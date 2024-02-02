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
from .models import Product, Category, User, Order, ShoppingCart, CartItem, Review, Address, OrderItem
from django.utils.datastructures import MultiValueDictKeyError
from django.core.exceptions import ValidationError, MultipleObjectsReturned
from django.http import QueryDict
from django.db.models import F, ExpressionWrapper, fields, Sum
from django.db import IntegrityError
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required


"""AUTHO"""
# oauth = OAuth()

# oauth.register(
#     "auth0",
#     client_id=settings.AUTH0_CLIENT_ID,
#     client_secret=settings.AUTH0_CLIENT_SECRET,
#     client_kwargs={
#         "scope": "openid profile email",
#     },
#     server_metadata_url=f"https://{settings.AUTH0_DOMAIN}/.well-known/openid-configuration",
# )


# def login(request):
#     return oauth.auth0.authorize_redirect(
#         request, request.build_absolute_uri(reverse("eridosolutions:callback"))
#     )

# def callback(request):
#     token = oauth.auth0.authorize_access_token(request)
#     request.session["user"] = token
#     return redirect(request.build_absolute_uri(reverse("eridosolutions:index")))

# def logout(request):
    # request.session.clear()

    # return redirect(
    #     f"https://{settings.AUTH0_DOMAIN}/v2/logout?"
    #     + urlencode(
    #         {
    #             "returnTo": request.build_absolute_uri(reverse("eridosolutions:index")),
    #             "client_id": settings.AUTH0_CLIENT_ID,
    #         },
    #         quote_via=quote_plus,
    #     ),
    # )

"""LANDING PAGE"""
@require_http_methods(["GET"])
def index(request):
    # http://127.0.0.1:8000/eridosolutions/
    # return JsonResponse("Welcome to our beautiful LaNdInG pAgE!", safe=False)
    return render(request, 'eridosolutions/index.html')

"""AUTHENTICATION"""

redirect_url_for_paths_that_fail_login_requirements = "eridosolutions/"
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def register(request):
    # http://127.0.0.1:8000/eridosolutions/register/
    try:
        data = request.POST

        username, password, email, first_name, last_name = [data['username'], data['password'], data['email'], data['first_name'], data['last_name']]

        user = User.objects.create_user(username=username, password=password, email=email, first_name=first_name, last_name=last_name)

        user.save()

        user_cart = ShoppingCart(user=user)

        user_cart.save()        

        return JsonResponse({'id': user.id, 'username': user.username, 'email': user.email, 'first_name': user.first_name, 'last_name': user.last_name}, safe=False)
    
    except IntegrityError:
        return JsonResponse(f"User with the same username or email already exists.", safe=False)

    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def login_view(request):
    # http://127.0.0.1:8000/eridosolutions/login/
    try:
        username, password = [request.POST['username'], request.POST['password']]

    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)
    
    try:
        user_email_passed_instead = User.objects.get(email=username)

        username = user_email_passed_instead.username

    except User.DoesNotExist:
        pass

    except MultipleObjectsReturned:
        return JsonResponse(f"You are using the same email for Django Admin Dashboard and your newly created user, change one of them.", safe=False)
    
    user = authenticate(username=username, password=password)

    if user is not None:
        login(request, user)
        return JsonResponse({'id': user.id, 'username': user.username, 'email': user.email, 'first_name': user.first_name, 'last_name': user.last_name}, safe=False)
    
    else:
        return JsonResponse(f"Either the email/username or the password is incorrect", safe=False)

# @require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def logout_view(request):
    # http://127.0.0.1:8000/eridosolutions/logout/
    logout(request)
    return redirect('eridosolutions:index')

"""PRODUCT MANAGEMENT"""
@login_required(login_url="/eridosolutions/")
@require_http_methods(["GET"])
def list_all_products(request):
    # http://127.0.0.1:8000/eridosolutions/products/

    all_products = Product.objects.all()

    if all_products.exists():
        return JsonResponse([product.to_dict() for product in all_products], safe=False)
    else:
        return JsonResponse("No products found, add a product and try again.", safe=False)
    # return JsonResponse("Get a list of all products.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/

    try:
        specific_product = Product.objects.get(product_id=id)
        return JsonResponse(specific_product.to_dict(), safe=False)

    except Product.DoesNotExist:
        return JsonResponse(f"Product with ID: {id} was not found.", safe=False)
    # return JsonResponse("Get details of a specific product.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
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
        image = request.FILES['image']
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

    try:
        new_product = Product(name=name, description=description, price=float(price), quantity_in_stock=quantity_in_stock, category=Category.objects.get(name=category), image=image)
        new_product.save()
    except (ValueError, ValidationError) as e:
        return JsonResponse(f"{str(e)}", safe=False)    

    return JsonResponse(new_product.to_dict(), safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["PUT", "POST"])
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

    return JsonResponse(product_to_update.to_dict(), safe=False)
        

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
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
    
    return JsonResponse(product_to_delete_details, safe=False)

"""USER PROFILE"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/
    # auth0|65aad24e45bc7f710f2a381a

    try:
        specific_user = User.objects.get(id=id)
        return JsonResponse({'id': specific_user.id, 'username': specific_user.username, 'email': specific_user.email, 'first_name': specific_user.first_name, 'last_name': specific_user.last_name}, safe=False)
    except User.DoesNotExist:
        return JsonResponse(f"User with ID: {id} does not exist.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/update/
    try:
        user_to_update = User.objects.get(id=id)

        for field, value in QueryDict(request.body).items():
            # print(f"FIELD: {field} VALUE: {value}")
            if (hasattr(user_to_update, field) and field == "password"):                
                try:
                    user_to_update.set_password(value)
                except (ValueError, ValidationError, Category.DoesNotExist) as e:
                    return JsonResponse(f"{str(e)}", safe=False)
            
            elif (hasattr(user_to_update, field)):
                setattr(user_to_update, field, value)
            
            else:
                return JsonResponse(f"There is no field named {field} in users table.", safe=False)

        user_to_update.save()      
    
    except User.DoesNotExist as e:
        return JsonResponse(f"user with ID: {id} was not found.", safe=False)

    return JsonResponse({'id': user_to_update.id, 'username': user_to_update.username, 'email': user_to_update.email, 'first_name': user_to_update.first_name, 'last_name': user_to_update.last_name}, safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/orders/
    try:
        orders_placed_by_user = Order.objects.get(user=id)
        return JsonResponse([order_item.to_dict() for order_item in OrderItem.objects.filter(order=orders_placed_by_user)], safe=False)
    except Order.DoesNotExist:
        return JsonResponse(f"User with ID: {id} hasn't placed any orders.", safe=False)

"""SHOPPING CART"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request, id):
    try:
        cart_contents_of_user = ShoppingCart.objects.get(user=id)

        return JsonResponse([item.to_dict() for item in CartItem.objects.filter(cart=cart_contents_of_user.cart_id)], safe=False)
    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"Current user hasn't placed any items in cart.", safe=False)
    except TypeError:
        return JsonResponse(f"No active cart found for current user or A TypeError occured.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
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

                return JsonResponse(existing_cart_item.to_dict(), safe=False)
            except CartItem.DoesNotExist:
                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId), quantity=quantity)
            

        except ShoppingCart.DoesNotExist:
            try:
                new_shopping_cart = ShoppingCart(user=User.objects.get(id=id))

                new_shopping_cart.save()

                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId), quantity=quantity)
            except User.DoesNotExist:
                return JsonResponse(f"User with ID: {id} does not exist.", safe=False)
        
        except Product.DoesNotExist:
            return JsonResponse(f"Product with ID: {productId} not found.", safe=False)
    
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)
    
    new_cart_item.save()    

    return JsonResponse(new_cart_item.to_dict(), safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
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
    
    return JsonResponse(cart_item_to_delete_details, safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["DELETE", "POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def clear_entire_shopping_cart(request, id):
    # http://127.0.0.1:8000/eridosolutions/cart/clear/
    try:
        cart_to_clear = ShoppingCart.objects.get(user=id)

        cart_to_clear_items = CartItem.objects.filter(cart=cart_to_clear)

        _ = list(map(lambda x: x.delete(), cart_to_clear_items))

    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"User with ID: {id} does not have a cart.", safe=False)
    return JsonResponse(f"Cart cleared.", safe=False)

"""ORDER MANAGEMENT"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    # http://127.0.0.1:8000/eridosolutions/orders/
    all_orders = Order.objects.all()

    if all_orders.exists():
        return JsonResponse([order.to_dict() for order in all_orders], safe=False)
    else:
        return JsonResponse(f"No orders found, add an order and try again.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/orders/<id>/
    try:
        specific_order_details = Order.objects.get(order_id=id)

    except Order.DoesNotExist:
        return JsonResponse(f"Order with ID: {id} does not exist.", safe=False)
    
    return JsonResponse(specific_order_details.to_dict(), safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_order(request, userId):
    try:
        user_cart = ShoppingCart.objects.get(user=userId)

        total_cost_of_cart_items = CartItem.objects.filter(cart=user_cart).aggregate(total_cost=Sum(ExpressionWrapper(F('quantity') * F('product__price'), output_field=fields.FloatField())))
        total_cost = total_cost_of_cart_items.get('total_cost', 0) or 0

        new_order = Order(user=User.objects.get(id=userId), total_amount=total_cost, order_status='ACTIVE')

        new_order.save()

        new_order_items = list(map(lambda item: OrderItem(order=new_order, product=item.product, quantity=item.quantity, unit_price=item.product.price), [item for item in CartItem.objects.filter(cart=user_cart)]))

        for item in CartItem.objects.filter(cart=user_cart):
            product_to_update_quantity = Product.objects.get(product_id=item.product.product_id)

            product_to_update_quantity.quantity_in_stock -= item.quantity

            product_to_update_quantity.save()

        OrderItem.objects.bulk_create(new_order_items)

        clear_entire_shopping_cart(request, userId)

    except ShoppingCart.DoesNotExist:
        return JsonResponse(f"User with ID: {userId} has no items in cart.", safe=False)    

    return JsonResponse([order_item.to_dict() for order_item in OrderItem.objects.filter(order=new_order)], safe=False)
    # return clear_entire_shopping_cart(request, userId)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def cancel_order_with_order_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/orders/<id>/cancel/
    try:
        order_to_cancel = Order.objects.get(order_id=id)

        order_to_cancel.order_status = "CANCELED"

        order_to_cancel.save()

        return JsonResponse(order_to_cancel.to_dict(), safe=False)
    
    except Order.DoesNotExist:
        return JsonResponse(f"Order with ID: {id} does not exist.", safe=False)
    

"""PAYMENT INTEGRATION"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def process_payment(request, orderId):
    try:
        order_to_pay_for = Order.objects.get(order_id=orderId)

        return JsonResponse(order_to_pay_for.to_dict(), safe=False) if (order_to_pay_for.order_status == "ACTIVE") else JsonResponse(f"Can't process payment for a CANCELLED/COMPLETED order.", safe=False)
        # return JsonResponse(f"Process payment for order: {order_to_pay_for.to_dict()}.", safe=False)
    
    except Order.DoesNotExist:
        return JsonResponse(f"Order with ID: {orderId} does not exist.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def refund_payment(request, orderId):
    try:
        order_to_refund = Order.objects.get(order_id=orderId)
        return JsonResponse(order_to_refund.to_dict(), safe=False)
    
    except Order.DoesNotExist:
        return JsonResponse(f"Order with ID: {orderId} does not exist.", safe=False)


"""CATEGORY MANAGEMENT"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_list_of_all_product_categories(request):
    # http://127.0.0.1:8000/eridosolutions/categories/
    list_of_all_categories = Category.objects.all()

    if list_of_all_categories.exists():
        return JsonResponse([category.to_dict() for category in list_of_all_categories], safe=False)
    else:
        return JsonResponse(f"No category found, add one and try again.", safe=False)
    

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_list_of_all_products_in_category(request, id):
    return JsonResponse([product.to_dict() for product in Product.objects.filter(category=id)], safe=False)


@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product_category(request):
    # http://127.0.0.1:8000/eridosolutions/categories/create/
    try:
        name = request.POST["name"]

        new_category = Category(name=name)

    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value fo attribute {e} is missing.", safe=False)
    
    new_category.save()

    return JsonResponse(new_category.to_dict(), safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_category_with_category_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/categories/<id>/update/
    try:
        category_to_update = Category.objects.get(category_id=id)

        name = QueryDict(request.body)['name']

        category_to_update.name = name
    
    except Category.DoesNotExist:
        return JsonResponse(f"Category with ID: {id} does not exist.", safe=False)

    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)
    
    category_to_update.save()

    return JsonResponse(category_to_update.to_dict(), safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_category_with_category_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/categories/<id>/delete/
    try:
        category_to_delete = Category.objects.get(category_id=id)

        category_to_delete_details = category_to_delete.to_dict()

        category_to_delete.delete()

    except Category.DoesNotExist:
        return JsonResponse(f"Category with ID: {id} does not exist.", safe=False)
    
    return JsonResponse(category_to_delete_details, safe=False)

"""REVIEWS AND RATINGS"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_reviews_for_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/reviews/
    reviews = Review.objects.filter(product=id)

    if reviews.exists():
        return JsonResponse([review.to_dict() for review in reviews], safe=False)
    else:
        return JsonResponse(f"Product with ID: {id} does not have reviews.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def creat_review_for_product_with_product_id(request, userId, id):
    try:
        user_leaving_review = User.objects.get(id=userId)
        product_to_review = Product.objects.get(product_id=id)

        rating = request.POST['rating']
        comment = request.POST['comment']

        new_review = Review(product=product_to_review, user=user_leaving_review, rating=rating, comment=comment)

        new_review.save()

        return JsonResponse(new_review.to_dict(), safe=False)

    except User.DoesNotExist:
        return JsonResponse(f"User with ID: {userId} does not exist.", safe=False)
    
    except Product.DoesNotExist:
        return JsonResponse(f"Product with ID: {id} does not exist.", safe=False)

    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

"""SEARCH AND FILTERS"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def search_products(request):
    # http://127.0.0.1:8000/eridosolutions/search/
    return JsonResponse("Search for products based on specified criteria.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def turn_on_filters(request):
    # http://127.0.0.1:8000/eridosolutions/filters/
    return JsonResponse("Get filter options for product search.", safe=False)

"""SHIPPING AND ADDRESS"""
@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_available_shipping_options(request):
    # http://127.0.0.1:8000/eridosolutions/shipping-options/
    return JsonResponse("Get available shipping options.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["GET"])
def get_user_saved_addresses(request, userId):
    user_saved_addresses = Address.objects.filter(user=userId)

    if user_saved_addresses.exists():
        return JsonResponse([address.to_dict() for address in user_saved_addresses], safe=False)
    else:
        return JsonResponse(f"User with ID: {userId} has no addresses.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_address_to_user_profile(request, userId):
    try:
        data = request.POST
        street_address, city, state, zipcode, country = [data['street_address'], data['city'], data['state'], data['zipcode'], data['country']]

        user = User.objects.get(id=userId)

        new_address = Address(street_address=street_address, city=city, state=state, zipcode=zipcode, country=country, user=user)

        new_address.save()

        return JsonResponse(new_address.to_dict(), safe=False)
    
    except User.DoesNotExist:
        return JsonResponse(f"User with ID: {userId} does not exist.", safe=False)
    
    except MultiValueDictKeyError as e:
        return JsonResponse(f"The form value for attribute {str(e)} is missing.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_address_with_address_id(request, userId, id):
    try:
        address_to_update = Address.objects.get(address_id=id)

        user = User.objects.get(id=userId)

        data = QueryDict(request.body)

        for field, value in data.items():
            
            if (hasattr(address_to_update, field)):
                setattr(address_to_update, field, value)
            
            else:
                return JsonResponse(f"There is no field named {field} in address table.", safe=False)

        address_to_update.save()

        return JsonResponse(address_to_update.to_dict(), safe=False)

    except Address.DoesNotExist:
        return JsonResponse(f"Address with ID: {id} does not exist.", safe=False)
    
    except User.DoesNotExist:
        return JsonResponse(f"User with ID: {userId} does not exist.", safe=False)

@login_required(login_url=redirect_url_for_paths_that_fail_login_requirements)
@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_address_with_address_id(request, userId, id):
    try:
        address_to_delete = Address.objects.get(address_id=id, user=userId)

        address_to_delete_details = address_to_delete.to_dict()

        address_to_delete.delete()

        return JsonResponse(address_to_delete_details, safe=False)
    
    except Address.DoesNotExist:
        return JsonResponse(f"Address with ID: {id} does not exist.", safe=False)

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
