from django.shortcuts import render, HttpResponse, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
# from django.contrib.auth.models import User
from authlib.integrations.django_client import OAuth
from django.conf import settings
from django.shortcuts import redirect, render
from django.urls import reverse
from urllib.parse import quote_plus, urlencode
import json
import requests
from django.http import JsonResponse
from django.http import HttpResponseNotFound, HttpResponseServerError, Http404
from .models import Product, Category, User, Order, ShoppingCart, CartItem
from django.utils.datastructures import MultiValueDictKeyError
from django.core.exceptions import ValidationError
from django.http import QueryDict
from django.db.models import F, ExpressionWrapper, fields, Sum


"""AUTHO"""
oauth = OAuth()

oauth.register(
    "auth0",
    client_id=settings.AUTH0_CLIENT_ID,
    client_secret=settings.AUTH0_CLIENT_SECRET,
    client_kwargs={
        "scope": "openid profile email",
    },
    server_metadata_url=f"https://{settings.AUTH0_DOMAIN}/.well-known/openid-configuration",
)


def login(request):
    return oauth.auth0.authorize_redirect(
        request, request.build_absolute_uri(reverse("eridosolutions:callback"))
    )

def callback(request):
    token = oauth.auth0.authorize_access_token(request)
    request.session["user"] = token
    return redirect(request.build_absolute_uri(reverse("eridosolutions:index")))

def logout(request):
    request.session.clear()

    return redirect(
        f"https://{settings.AUTH0_DOMAIN}/v2/logout?"
        + urlencode(
            {
                "returnTo": request.build_absolute_uri(reverse("eridosolutions:index")),
                "client_id": settings.AUTH0_CLIENT_ID,
            },
            quote_via=quote_plus,
        ),
    )

"""LANDING PAGE"""
@require_http_methods(["GET"])
def index(request):
    # http://127.0.0.1:8000/eridosolutions/
    try:
        # return JsonResponse(f"ID: {request.session.get('user')['userinfo']['sub']} USERNAME: {request.session.get('user')['userinfo']['nickname']} EMAIL: {request.session.get('user')['userinfo']['name']}", safe=False)
        username = request.session.get('user')['userinfo']['nickname']
        email = request.session.get('user')['userinfo']['name']
        auth0_user_id = request.session.get('user')['userinfo']['sub']

        try:
            current_user = User.objects.get(auth0_user_id=auth0_user_id)
        
        except User.DoesNotExist:
            new_user = User(username=username, email=email, auth0_user_id=auth0_user_id)
            new_user.save()

    except TypeError:
        # return JsonResponse(f"Sign in to use the platform.", safe=False)
        pass       

    return render(
        request,
        "eridosolutions/index.html",
        context={
            "session": request.session.get("user"),
            "pretty": json.dumps(request.session.get("user"), indent=4),
        },
    )
    

"""AUTHENTICATION"""
# @require_http_methods(["POST"])
# @csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# def register(request):
#     # http://127.0.0.1:8000/eridosolutions/register/
#     return JsonResponse("Create a new user account.", safe=False)

# @require_http_methods(["POST"])
# @csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# def login(request):
#     # http://127.0.0.1:8000/eridosolutions/login/
#     return JsonResponse("Authenticate a user and generate an access token.", safe=False)

# @require_http_methods(["POST"])
# @csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# def logout(request):
#     # http://127.0.0.1:8000/eridosolutions/logout/
#     return JsonResponse("Invalidate the user's access token and log them out.", safe=False)

"""PRODUCT MANAGEMENT"""
@require_http_methods(["GET"])
def list_all_products(request):
    # http://127.0.0.1:8000/eridosolutions/products/

    all_products = Product.objects.all()

    if all_products.exists():
        return JsonResponse([product.to_dict() for product in all_products], safe=False)
    else:
        return JsonResponse("No products found, add a product and try again.", safe=False)
    # return JsonResponse("Get a list of all products.", safe=False)

@require_http_methods(["GET"])
def get_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/

    try:
        specific_product = Product.objects.get(product_id=id)
        return JsonResponse(specific_product.to_dict(), safe=False)

    except Product.DoesNotExist:
        return JsonResponse(f"Product with ID: {id} was not found.", safe=False)
    # return JsonResponse("Get details of a specific product.", safe=False)


@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product(request):
    # http://127.0.0.1:8000/eridosolutions/products/create/
    try:
        name = request.POST['name']
        description = request.POST['description']
        price = request.POST['price']
        quantity_in_stock = request.POST['quantity_in_stock']
        category = request.POST['category']
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

    try:
        new_product = Product(name=name, description=description, price=float(price), quantity_in_stock=quantity_in_stock, category=Category.objects.get(name=category))
        new_product.save()
    except (ValueError, ValidationError) as e:
        return JsonResponse(f"{str(e)}", safe=False)    

    return JsonResponse(new_product.to_dict(), safe=False)
    # return JsonResponse(f"Add a new product to the catalog.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_product_with_product_id_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/update/
    try:
        product_to_update = Product.objects.get(product_id=id)

        for field, value in QueryDict(request.body).items():
            # print(f"FIELD: {field} VALUE: {value}")
            if (hasattr(product_to_update, field) and field == "category"):                
                try:
                    setattr(product_to_update, field, Category.objects.get(name=value))
                except (ValueError, ValidationError, Category.DoesNotExist) as e:
                    return JsonResponse(f"{str(e)}", safe=False)
            
            elif (hasattr(product_to_update, field)):
                setattr(product_to_update, field, value)
            
            else:
                return JsonResponse(f"There is no field named {field} in products table.", safe=False)

        product_to_update.save()      
    
    except Product.DoesNotExist as e:
        return JsonResponse(f"Product with ID: {id} was not found.", safe=False)

    return JsonResponse(f"{product_to_update.to_dict()}", safe=False)
        

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/delete/
    try:
        product_to_delete = Product.objects.get(product_id=id)

        product_to_delete_details = product_to_delete.to_dict()

        product_to_delete.delete()

    except Product.DoesNotExist as e:
        return JsonResponse(f"Product with ID: {id} was not found.", safe=False)
    
    return JsonResponse(f"Deleted successfully {product_to_delete_details}", safe=False)

"""USER PROFILE"""
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/
    # auth0|65aad24e45bc7f710f2a381a

    try:
        specific_user = User.objects.get(auth0_user_id=id)
        return JsonResponse(specific_user.to_dict(), safe=False)
    except User.DoesNotExist:
        return JsonResponse(f"User with ID: {id} does not exist.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/update/
    try:
        user_to_update = User.objects.get(auth0_user_id=id)

        username = QueryDict(request.body)['username']

        setattr(user_to_update, "username", username)

        user_to_update.save()

        return JsonResponse(user_to_update.to_dict(), safe=False)
    
    except User.DoesNotExist as e:
        return JsonResponse(f"User with id {id} does not exist.", safe=False)
    
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/orders/
    try:
        orders_placed_by_user = Order.objects.get(user=id)
        return JsonResponse(f"{[order.to_dict() for order in orders_placed_by_user]}", safe=False)
    except Order.DoesNotExist:
        return JsonResponse(f"User with ID: {id} hasn't placed any orders.", safe=False)

"""SHOPPING CART"""
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request, id):
    try:
        cart_contents_of_user = ShoppingCart.objects.get(user=id)

        return JsonResponse(f"{[item.to_dict() for item in CartItem.objects.filter(cart=cart_contents_of_user.cart_id)]}", safe=False)
    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"Current user hasn't placed any items in cart.", safe=False)
    except TypeError:
        return JsonResponse(f"No active cart found for current user.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_product_to_user_cart(request, id, productId):
    try:
        quantity = request.POST['quantity']

        try:
            try:
                existing_cart_item = CartItem.objects.get(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId))
                
                existing_cart_item.quantity += int(quantity)

                existing_cart_item.save()

                return JsonResponse(str(existing_cart_item.to_dict()), safe=False)
            except CartItem.DoesNotExist:
                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId), quantity=quantity)
            

        except ShoppingCart.DoesNotExist:
            try:
                new_shopping_cart = ShoppingCart(user=User.objects.get(auth0_user_id=id))

                new_shopping_cart.save()

                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId), quantity=quantity)
            except User.DoesNotExist:
                return JsonResponse(f"User with ID: {id} does not exist.", safe=False)
        
        except Product.DoesNotExist:
            return JsonResponse(f"Product with ID: {productId} not found.", safe=False)
    
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)
    
    new_cart_item.save()    

    return JsonResponse(str(new_cart_item.to_dict()), safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_from_user_cart(request, id, productId):
    try:
        cart_item_to_delete = CartItem.objects.get(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId))

        cart_item_to_delete_details = cart_item_to_delete.to_dict()

        cart_item_to_delete.delete()
    
    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"User with ID: {id} does not have an active cart.", safe=False)
    except Product.DoesNotExist:
        return JsonResponse(f"Product with ID: {productId} not found in cart.", safe=False)
    except CartItem.DoesNotExist:
        return JsonResponse(f"CartItem does not exist.", safe=False)
    
    return JsonResponse(str(cart_item_to_delete_details), safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def clear_entire_shopping_cart(request, id):
    # http://127.0.0.1:8000/eridosolutions/cart/clear/
    try:
        cart_to_clear = ShoppingCart.objects.get(user=id)

        cart_to_clear_details = cart_to_clear.to_dict()

        cart_to_clear.delete()

    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"User with ID: {id} does not have a cart.", safe=False)
    return JsonResponse(str(cart_to_clear_details), safe=False)

"""ORDER MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    # http://127.0.0.1:8000/eridosolutions/orders/
    all_orders = Order.objects.all()

    if all_orders.exists():
        return JsonResponse([order.to_dict() for order in all_orders], safe=False)
    else:
        return JsonResponse(f"No orders found, add an order and try again.", safe=False)

@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/orders/<id>/
    try:
        specific_order_details = Order.objects.get(order_id=id)

    except Order.DoesNotExist:
        return JsonResponse(f"Order with ID: {id} does not exist.", safe=False)
    
    return JsonResponse(specific_order_details.to_dict(), safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_order(request, userId):
    try:
        user_cart = ShoppingCart.objects.get(user=userId)

        total_cost_of_cart_items = CartItem.objects.filter(cart=user_cart).aggregate(total_cost=Sum(ExpressionWrapper(F('quantity') * F('product__price'), output_field=fields.FloatField())))
        total_cost = total_cost_of_cart_items.get('total_cost', 0) or 0

        new_order = Order(user=User.objects.get(auth0_user_id=userId), total_amount=total_cost, order_status='ACTIVE')

    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"User with ID: {userId} has no items in cart.", safe=False)
    
    new_order.save()

    return JsonResponse(new_order.to_dict(), safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def cancel_order_with_order_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/orders/<id>/cancel/
    return JsonResponse("Cancel a specific order.", safe=False)

"""PAYMENT INTEGRATION"""
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def process_payment(request):
    # http://127.0.0.1:8000/eridosolutions/payment/charge/
    return JsonResponse("Process payment for an order.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def refund_payment(request, orderId):
    # http://127.0.0.1:8000/eridosolutions/payment/refund/<orderId>/
    return JsonResponse("Refund a payment for a specific order.", safe=False)

"""CATEGORY MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_product_categories(request):
    # http://127.0.0.1:8000/eridosolutions/categories/
    return JsonResponse("Get list of all product categories.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product_category(request):
    # http://127.0.0.1:8000/eridosolutions/categories/create/
    return JsonResponse("Add a new product category.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_category_with_category_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/categories/<id>/update/
    return JsonResponse("Update details of a specific product category.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_category_with_category_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/categories/<id>/delete/
    return JsonResponse("Remove a product category.", safe=False)

"""REVIEWS AND RATINGS"""
@require_http_methods(["GET"])
def get_reviews_for_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/reviews/
    return JsonResponse("Get reviews for a specific product.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def creat_review_for_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/reviews/create/
    return JsonResponse("Add a new review for a product.", safe=False)

"""SEARCH AND FILTERS"""
@require_http_methods(["GET"])
def search_products(request):
    # http://127.0.0.1:8000/eridosolutions/search/
    return JsonResponse("Search for products based no specified criteria.", safe=False)

@require_http_methods(["GET"])
def turn_on_filters(request):
    # http://127.0.0.1:8000/eridosolutions/filters/
    return JsonResponse("Get filter options for product search.", safe=False)

"""SHIPPING AND ADDRESS"""
@require_http_methods(["GET"])
def get_available_shipping_options(request):
    # http://127.0.0.1:8000/eridosolutions/shipping-options/
    return JsonResponse("Get available shipping options.", safe=False)

@require_http_methods(["GET"])
def get_user_saved_addresses(request):
    # http://127.0.0.1:8000/eridosolutions/addresses/
    return JsonResponse("Get user's saved addresses.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_address_to_user_profile(request):
    # http://127.0.0.1:8000/eridosolutions/addresses/create/
    return JsonResponse("Add a new address to the user's profile.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_address_with_address_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/addresses/<id>/update/
    return JsonResponse("Update details of a specific address", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_address_with_address_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/addresses/<id>/delete/
    return JsonResponse("Remove an address from the user's profile.", safe=False)

"""ERROR HANDLING"""

def handler404(request, exception):
    return render(request, '404.html', status=400)

# def handler500(request):
#     return render(request, '404.html', status=500)

# def handler403(request, exception):
#     return render(request, '404.html', status=403)

# def handler400(request, exception):
#     return render(request, '404.html', status=400)

# def handler401(request, exception):
#     return render(request, '404.html', status=401)
