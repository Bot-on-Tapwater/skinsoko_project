from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth.tokens import default_token_generator
from django.http import HttpResponse, JsonResponse, QueryDict
from django.views.decorators.http import require_http_methods
from django.core.mail import send_mail
from django.contrib.auth.hashers import make_password, check_password
from django.urls import reverse
import uuid
from django.contrib.sessions.models import Session
from functools import wraps
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
import datetime
from .models import Product, MainCategory, SubCategory, Brand, Wishlist, User, Order, ShoppingCart, CartItem, Review, Address, OrderItem, Towns
import re
from django.core.paginator import Paginator, EmptyPage
from django.utils.datastructures import MultiValueDictKeyError
from django.core.exceptions import ValidationError, MultipleObjectsReturned, PermissionDenied
from django.db.models import F, ExpressionWrapper, fields, Sum, Q
from social_django.utils import psa
from django.contrib.auth.signals import user_logged_in
from django.dispatch import receiver

# Create your views here.

"""SOCIAL AUTH"""
@psa('social:complete')
def social_auth(request, backend):
    return redirect(reverse('social:begin', kwargs={'backend': backend}))

"""DECORATORS"""
def login_required(view_func):
    @wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if 'user_id' not in request.session:
            return JsonResponse({'error': 'User is not logged in'}, status=401)
        return view_func(request, *args, **kwargs)
    return wrapper

# def check_user_id(view_func):
#     def wrapper(request, *args, **kwargs):
#         if not request.user_id:
#             print(str(request))
#             return JsonResponse({"error": "Unauthorized"}, status=401)
#         return view_func(request, *args, **kwargs)
#     return wrapper

"""EMAIL & SMTP"""
def send_email(subject=None, message=None, from_email=None, recipient_list=None):
    from_email = 'brandonmunda1@gmail.com'

    send_mail(subject, message, from_email, recipient_list)
    
    return JsonResponse('Mail sent successfully', safe=False)
def index(request):
    return JsonResponse({"message": "skin soko is live"})

"""USER AUTHENTICATION & AUTHORIZATION"""

def user_status(request):
    if 'user_id' in request.session:
        return JsonResponse({'user': True})
    else:
        return JsonResponse({'user': False})

@csrf_exempt
@require_http_methods(["POST", "GET"])
def register_view(request):
    if request.method == 'POST':
        try:
            # Extract data from POST request
            # username = request.POST.get('username')
            password = request.POST.get('password')
            email = request.POST.get('email')
            # first_name = request.POST.get('first_name')
            # last_name = request.POST.get('last_name')
            # role = request.POST.get('role')

            # Validate form data
            if not password or not email:
                raise ValueError('All fields are required.')

            # Basic email validation
            email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
            if not re.match(email_regex, email):
                raise ValueError('Enter a valid email address.')

            # Check if the username already exists
            if User.objects.filter(email=email).exists():
                raise ValueError('Email already exists.')

            # Create new user
            new_user = User(
                password=make_password(password), 
                email=email,
            )
            new_user.save()

            # print("User saved successfully:", new_user.id)

            # Send registration email
            # send_registration_mail(new_user)

            # Redirect to a success page
            login_response = login_view(request, email, password)
            return login_response

        except Exception as e:
            print(e)
            context = {
                'error': str(e)
            }
            return JsonResponse({"error": "user registration failed"}, status=401)

    return JsonResponse({"message": "User registration successful"}, status=200)

def send_registration_mail(new_user):
    verification_link = f"http://0.0.0.0:8000/library/verify-email/?token={new_user.verification_token}"

    subject = "Navari Library - Verify your email address"

    recipient_list = [new_user.email]

    message = f"Please click on the following link to verify your email address: {verification_link}"

    send_email(subject=subject, recipient_list=recipient_list, message=message)

def verify_email(request):
    if 'token' in request.GET:
        verification_token = request.GET['token']
        try:
            user = User.objects.get(verification_token=verification_token)

            user.is_verified = True

            user.save()

            return JsonResponse({"message": "Email verified successfully"})
        
        except Exception as e:
            print(e)
            context = {
                'error': str(e)
            }
            return JsonResponse({"error": "user login/registration failed"})

@require_http_methods(["POST", "GET"])
@csrf_exempt
def login_view(request, email=None, password=None):
    if request.method == "POST" or (email and password):
        try:
            if not email or not password:
                data = request.POST
                email, password = [data['email'], data['password']]

            user = User.objects.get(email=email)

            if check_password(password, user.password):
                request.session['user_id'] = str(user.id)
                request.session['user_email'] = user.email

                merge_carts(request, user)

                return JsonResponse({'message': 'Login successful'}, status=200)

        except Exception as e:
                print(e)
                context = {
                    'error': str(e)
                }
                return JsonResponse({"error": "user login failed"}, status=401)

    else:
        return JsonResponse({"error": "user login failed"}, status=401)
    
@require_http_methods(["POST", "GET"])
@csrf_exempt
def test_login_view(request):
    if request.method == "POST":
        try:
            data = request.POST

            email, password = [data['email'], data['password']]

            user = User.objects.get(email=email)

            if password == user.password:
                request.session['user_id'] = str(user.id)
                # request.session['user_name'] = user.username
                request.session['user_email'] = user.email

                return JsonResponse({'message': 'Login successful'})

        except Exception as e:
                print(e)
                context = {
                    'error': str(e)
                }
                return JsonResponse({"error": "user login/registration failed"})

    else:
        return JsonResponse({"error": "user login/registration failed"})

@csrf_exempt
@require_http_methods(["POST", "GET"])
def request_password_reset(request):
    if request.method == "POST":
        try:
            email = request.POST['email']

            user = User.objects.get(email=email)

            user.password_reset_token = uuid.uuid4()

            user.save()

            reset_link = f"https://skinsoko.botontapwater.tech/skinsoko/password_reset/validate/?token={user.password_reset_token}"

            subject = "Password Reset Request"

            message = f"Click the link below to reset your password:\n{reset_link}"

            # Send the password reset email
            send_email(subject=subject, message=message, recipient_list=[user.email])

            return JsonResponse({'message': 'Password reset email sent'})

        except User.DoesNotExist:
            return JsonResponse({'error': 'User with this email does not exist'})

    else:
        return JsonResponse({'error': 'Invalid request'})

@require_http_methods(["GET"])
def validate_passsword_reset_token(request):
    if 'token' in request.GET:
        password_reset_token = request.GET['token']
        try:
            user = User.objects.get(password_reset_token=password_reset_token)

            return JsonResponse({'message': 'Token valid'})
        
        except Exception as e:
            print(e)
            context = {
                'error': str(e)
            }
            return JsonResponse({"error": "user login/registration failed"})

@csrf_exempt
def reset_password(request):
    try:
        password = request.POST['password']

        email = request.POST['email']

        user = User.objects.get(email=email)

        user.set_password(password)

        user.save()

        return JsonResponse({'message': 'Password reset successful'})
    
    except Exception as e:
            print(e)
            context = {
                'error': str(e)
            }
            return JsonResponse({"error": "user login/registration failed"})
    
def logout_view(request):
    if 'user_id' in request.session:
        del request.session['user_id']
        # del request.session['user_name']
        del request.session['user_email']
        return JsonResponse({'message': 'Logout successful'})
    else:
        return JsonResponse({'error': 'User not logged in'})

def show_logged_in_user_id(request):
    if request.user.id:
        return JsonResponse({"user": True})
    return JsonResponse({"user": False})

"""PAGINATION"""
def paginate_results(request, query_results, view_url, items_per_page=40):
    items_per_page = items_per_page

    page_number = request.GET.get('page', 1)

    paginator = Paginator(query_results, items_per_page)

    try:
        page_obj = paginator.get_page(page_number)
    
    except EmptyPage:
        return JsonResponse({"error": "Page not found"}, status=404)
    
    items_on_current_page = page_obj.object_list

    json_data = {
        'current_page': page_obj.number,
        'total_pages': paginator.num_pages,
        'query_results': [item.to_dict(request) for item in items_on_current_page],
    }
    
    if page_obj.has_previous():
        if "page=" in view_url:
            json_data['previous_page'] = f"{view_url[:view_url.rfind('page=')]}page={page_obj.previous_page_number()}"
        else:
            json_data['previous_page'] = f"{view_url}?page={page_obj.previous_page_number()}"

    if page_obj.has_next():
        if "page=" in view_url:
            json_data['next_page'] = f"{view_url[:view_url.rfind('page=')]}page={page_obj.next_page_number()}"
        else:
            json_data['next_page'] = f"{view_url}?page={page_obj.next_page_number()}"
    
    return json_data

"""PRODUCT MANAGEMENT"""
@require_http_methods(["GET"])
def list_all_products(request):
    view_url = request.build_absolute_uri()

    # Start with all products
    all_products = Product.objects.all()

    # Check for filter_brand query parameter
    filter_brand = request.GET.get('filter_brand')
    if filter_brand:
        all_products = all_products.filter(brand__name=filter_brand)
    
    # Check for filter_main_category query parameter
    filter_main_category = request.GET.get('filter_main_category')
    if filter_main_category:
        all_products = all_products.filter(subcategories__main_category__name=filter_main_category)
    
    # Check for filter_sub_category query parameter
    filter_sub_category = request.GET.get('filter_sub_category')
    if filter_sub_category:
        all_products = all_products.filter(subcategories__name=filter_sub_category)
    
    # Eliminate duplicates if a product belongs to multiple subcategories
    all_products = all_products.distinct()

    if all_products.exists():
        return JsonResponse(paginate_results(request, all_products, view_url), safe=False)
    else:
        return JsonResponse({"error": "No products found."}, status=404)

@require_http_methods(["GET"])
def get_product_with_product_id(request, slug):
    try:
        specific_product = Product.objects.get(slug=slug)
        return JsonResponse(specific_product.to_dict(request), safe=False)

    except Product.DoesNotExist:
        return JsonResponse({"error":f"Product with ID: {id} was not found."}, status=404)

"""USER PROFILE"""
@login_required
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request):
    try:
        id = request.session.get('user_id')
        specific_user = User.objects.get(id=id)
        return JsonResponse({'email': specific_user.email}, safe=False)
    except User.DoesNotExist:
        return JsonResponse({"error": f"User does not exist."}, status=404)

@login_required
@csrf_exempt
@require_http_methods(["PUT"])
def update_user_with_user_id_profile_details(request):
    try:
        id = request.session.get('user_id')

        user_to_update = User.objects.get(id=id)

        for field, value in QueryDict(request.body).items():
            if (hasattr(user_to_update, field) and field == "password"):                
                try:
                    user_to_update.set_password(value)
                except (ValueError, ValidationError) as e:
                    return JsonResponse(f"{str(e)}", safe=False)
            
            elif (hasattr(user_to_update, field)):
                setattr(user_to_update, field, value)

            else:
                return JsonResponse({"error": f"There is no field named {field} in users table."}, status=404)

        user_to_update.save()      
    
    except User.DoesNotExist as e:
        return JsonResponse({"error": f"user with ID: {id} was not found."}, status=404)

    return JsonResponse({"success": True}, safe=False)

"""LIST OF USER'S ORDERS"""
@login_required
@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request):
    view_url = request.build_absolute_uri()

    try:
        id = request.session.get('user_id')
        orders_placed_by_user = Order.objects.filter(user=id)
        return JsonResponse([order.to_dict() for order in orders_placed_by_user], safe=False)
    except Order.DoesNotExist:
        return JsonResponse(None, safe=False)

"""SHOPPING CART"""
# @login_required
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request):
    view_url = request.build_absolute_uri()
    
    id = request.session.get('user_id')
    session_key = request.session.session_key    

    if not session_key:
        request.session.create()
        session_key = request.session.session_key

    try:
        if id:
            cart_contents_of_user = ShoppingCart.objects.get(user=id)
        else:
            cart_contents_of_user = ShoppingCart.objects.get(session_key=session_key)
        
        cart_items = [item.to_dict() for item in CartItem.objects.filter(cart=cart_contents_of_user.cart_id)]

        # dict to hold user's cart summary
        cart_summary = {
            "totalItems": 0,
            "itemsSubtotal": 0,
            "shippingFee": 0,
            "estimatedTax": 0,
            "orderTotal": 0
        }

        for item in cart_items:
            cart_summary["totalItems"] += item["quantity"]
            cart_summary["itemsSubtotal"] += item["subtotal"]
        cart_summary["orderTotal"] += cart_summary["itemsSubtotal"] + cart_summary["estimatedTax"] + cart_summary["shippingFee"]

        print(cart_items)
        return JsonResponse({"cart_summary": cart_summary, "cart_items": cart_items})

    except ShoppingCart.DoesNotExist:
        return JsonResponse(None, safe=False)
    
    except TypeError:
        return JsonResponse(None, safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# @login_required
def add_product_to_user_cart(request, productId):
    try:
        id = request.session.get('user_id')

        product = Product.objects.get(product_id=productId)

        quantity = request.POST['quantity']

        if (int(quantity) > Product.objects.get(product_id=productId).quantity_in_stock):
            return JsonResponse(f"Quantity in stock is {Product.objects.get(product_id=productId).quantity_in_stock}, reduce your current quantity of ({quantity}) items.", safe=False)

        if not id: # user not authenticated
            session_key = request.session.session_key
            if not session_key:
                request.session.create()
                session_key = request.session.session_key

            try:
                session_cart, created = ShoppingCart.objects.get_or_create(session_key=session_key)
                try:
                    cart_item = CartItem.objects.get(cart=session_cart, product=product)
                    cart_item.quantity += int(quantity)
                except CartItem.DoesNotExist:
                    cart_item = CartItem(cart=session_cart, product=product, quantity=quantity)
                cart_item.save()
                return JsonResponse({"success": True}, safe=False)
            except Exception as e:
                return JsonResponse({"error": str(e)}, status=500)

        

        try:
            try:
                existing_cart_item = CartItem.objects.get(cart=ShoppingCart.objects.get(user=id), product=product)
                
                existing_cart_item.quantity += int(quantity)

                existing_cart_item.save()

                return JsonResponse(existing_cart_item.to_dict(), safe=False)
            except CartItem.DoesNotExist:
                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=product, quantity=quantity)
            Product, SubCategory, User, Order, ShoppingCart, CartItem, Review, Address, OrderItem
        except ShoppingCart.DoesNotExist:
            try:
                new_shopping_cart = ShoppingCart(user=User.objects.get(id=id))

                new_shopping_cart.save()

                new_cart_item = CartItem(cart=ShoppingCart.objects.get(user=id), product=product, quantity=quantity)
            except User.DoesNotExist:
                return JsonResponse({"error": f"User with ID: {id} does not exist."}, status=404)
        
    except Product.DoesNotExist:
        return JsonResponse({"error": f"Product with ID: {productId} not found."
        }, status=404)
    
    except MultiValueDictKeyError as e:
        return JsonResponse({"error": f"The form value for attribute {str(e)} is missing"
            }, status=400)
    
    new_cart_item.save()    

    return JsonResponse({"success": True}, safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_product_in_user_cart(request, productId):
    try:
        id = request.session.get('user_id')
        session_key = request.session.session_key

        if not session_key:
            request.session.create()
            session_key = request.session.session_key

        if id:
            cart = ShoppingCart.objects.get(user=id)
        else:
            cart = ShoppingCart.objects.get(session_key=session_key)

        quantity = request.POST['new_product_quantity']

        product = get_object_or_404(Product, product_id=productId)

        if int(quantity) > product.quantity_in_stock:
            return JsonResponse(f"Quantity in stock is {product.quantity_in_stock}. Please reduce the quantity.", safe=False)

        if id:
            cart_item, created = CartItem.objects.get_or_create(cart__user_id=id, product_id=productId)
        else:
            cart_item, created = CartItem.objects.get_or_create(cart__session_key=session_key, product_id=productId)

        if not created:
            cart_item.quantity = int(quantity)
            cart_item.save()

        return JsonResponse({"success": True}, safe=False)
    
    except MultiValueDictKeyError as e:
        return JsonResponse({"error": f"The form value for attribute {str(e)} is missing"}, status=400)

# @receiver(user_logged_in)
def merge_carts(request, user):
    session_key = request.session.session_key
    if not session_key:
        return
    
    try:
        session_cart = ShoppingCart.objects.get(session_key=session_key)
        user_cart, created = ShoppingCart.objects.get_or_create(user=user)

        session_cart_items = CartItem.objects.filter(cart=session_cart)

        for item in session_cart_items:
            try:
                user_cart_item = CartItem.objects.get(cart=user_cart, product=item.product)
                user_cart_item.quantity += item.quantity
                user_cart_item.save()
            except CartItem.DoesNotExist:
                item.cart = user_cart
                item.save()
        
        session_cart.delete()
    except ShoppingCart.DoesNotExist:
        pass

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# @login_required
def remove_product_from_user_cart(request, productId):
    try:
        id = request.session.get('user_id')
        session_key = request.session.session_key

        if not session_key:
            request.session.create()
            session_key = request.session.session_key

        if id:
            cart = ShoppingCart.objects.get(user=id)
        else:
            cart = ShoppingCart.objects.get(session_key=session_key)

        cart_item_to_delete = CartItem.objects.get(cart=ShoppingCart.objects.get(user=id), product=Product.objects.get(product_id=productId))

        cart_item_to_delete_details = cart_item_to_delete.to_dict()

        cart_item_to_delete.delete()
    
    except ShoppingCart.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {id} does not have an active cart."}, status=404)

    except Product.DoesNotExist:
        return JsonResponse({"error": f"Product with ID: {productId} not found in cart."}, status=404)

    except CartItem.DoesNotExist:
        return JsonResponse({"error": f"CartItem does not exist."}, status=404)
    
    return JsonResponse({"message": "item deleted"})

@require_http_methods(["DELETE", "POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
# @login_required
def clear_entire_shopping_cart(request):
    try:
        id = request.session.get('user_id')
        session_key = request.session.session_key

        if not session_key:
            request.session.create()
            session_key = request.session.session_key

        if id:
            cart_to_clear = ShoppingCart.objects.get(user=id)
        else:
            cart_to_clear = ShoppingCart.objects.get(session_key=session_key)

        cart_to_clear_items = CartItem.objects.filter(cart=cart_to_clear)

        _ = list(map(lambda x: x.delete(), cart_to_clear_items))

    except ShoppingCart.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {id} does not have a cart."}, status=404)

    return JsonResponse({"message": "cart cleared"}, status=200)

"""ORDER MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    view_url = request.build_absolute_uri()

    all_orders = Order.objects.all()

    if all_orders.exists():
        return JsonResponse(paginate_results(request, [order for order in all_orders], view_url), safe=False)
    else:
        return JsonResponse({"error": f"No orders found, add an order and try again."}, status=404)

@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    try:
        specific_order_details = Order.objects.get(order_id=id)

    except Order.DoesNotExist:
        return JsonResponse({"error": f"Order with ID: {id} does not exist."}, status=404)
    
    return JsonResponse(specific_order_details.to_dict(), safe=False)

def get_order_items_for_order_with_order_id(request, id):
    try:
        specific_order_items = OrderItem.objects.filter(order=Order.objects.get(order_id=id))

    except Order.DoesNotExist:
        return JsonResponse({"error": f"Order with ID: {id} does not exist."}, status=404)
    
    return JsonResponse([order_item.to_dict() for order_item in specific_order_items], safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
@login_required
def create_new_order(request):
    try:
        userId = request.session.get('user_id')

        user_cart = ShoppingCart.objects.get(user=userId)

        cartitems = CartItem.objects.filter(cart=user_cart).all()

        if not cartitems:
            return JsonResponse({"error": f"User has no items in cart."}, status=404)
        
        else:
            total_cost_of_cart_items = CartItem.objects.filter(cart=user_cart).aggregate(total_cost=Sum(ExpressionWrapper(F('quantity') * F('product__price'), output_field=fields.FloatField())))
            total_cost = total_cost_of_cart_items.get('total_cost', 0) or 0

            new_order = Order(user=User.objects.get(id=userId), total_amount=total_cost, order_status='Pending')

            new_order.save()

            new_order_items = list(map(lambda item: OrderItem(order=new_order, product=item.product, quantity=item.quantity, unit_price=item.product.price), [item for item in CartItem.objects.filter(cart=user_cart)]))

            for item in CartItem.objects.filter(cart=user_cart):
                product_to_update_quantity = Product.objects.get(product_id=item.product.product_id)

                product_to_update_quantity.quantity_in_stock -= item.quantity

                product_to_update_quantity.save()

            OrderItem.objects.bulk_create(new_order_items)

            clear_entire_shopping_cart(request)

    except ShoppingCart.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} has no items in cart."}, status=404)

    return JsonResponse({"success": True}, safe=False)

@csrf_exempt
@require_http_methods(["PUT"])
def cancel_order_with_order_id(request, id):
    try:
        order_to_cancel = Order.objects.get(order_id=id)

        order_to_cancel.order_status = "Cancelled"

        order_to_cancel.save()

        return JsonResponse({"success": True}, safe=False)
    
    except Order.DoesNotExist:
        return JsonResponse({"error": f"Order with ID: {id} does not exist."}, status=404)

"""CATEGORY MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_main_categories(request):
    view_url = request.build_absolute_uri()

    list_of_all_main_categories = MainCategory.objects.all()

    if list_of_all_main_categories.exists():
        return JsonResponse([category.to_dict() for category in list_of_all_main_categories], safe=False)
    else:
        return JsonResponse(None, safe=False)

def get_list_of_all_sub_categories_in_a_main_category(request, main_category):    

    view_url = request.build_absolute_uri()
    
    try:
        list_of_subcategories = SubCategory.objects.filter(main_category=MainCategory.objects.get(name=main_category))
        return JsonResponse([category.to_dict() for category in list_of_subcategories], safe=False)
    
    except Exception:
        return JsonResponse({"message": "Could not get subcategories"}, status=404)

def get_list_of_all_brands(request):
    view_url = request.build_absolute_uri()

    list_of_all_brands = Brand.objects.all()

    if list_of_all_brands.exists():
        return JsonResponse([brand.to_dict() for brand in list_of_all_brands], safe=False)
    else:
        return JsonResponse(None, safe=False)
    
# @require_http_methods(["GET"])
# def get_list_of_all_products_in_category(request, id):
#     view_url = request.build_absolute_uri()

#     return JsonResponse(paginate_results(request, [product for product in Product.objects.filter(category=id)], view_url), safe=False)

"""SEARCH FEATURES"""
def search(request):
    view_url = request.build_absolute_uri()

    if query := request.GET.get('q'):
        search_results = Product.objects.filter(
            Q(name__icontains=query) |
            Q(description__icontains=query) |
            Q(ingredients__icontains=query) |
            Q(brand__name__icontains=query) |
            Q(subcategories__name__icontains=query) |
            Q(subcategories__main_category__name__icontains=query)
        ).distinct()
    
    else:
        search_results = None
    
    return JsonResponse(paginate_results(request, search_results, view_url), safe=False)


"""REVIEWS AND RATINGS"""
@require_http_methods(["GET"])
def get_reviews_for_product_with_product_id(request, slug):
    view_url = request.build_absolute_uri()

    reviews = Review.objects.filter(product=Product.objects.get(slug=slug))

    if reviews.exists():
        return JsonResponse([review.to_dict() for review in reviews], safe=False)
    else:
        return JsonResponse({"current_page": 0, "total_pages": 0, "query_results": []})

@login_required
@require_http_methods(["GET"])
def list_reviews_created_by_user_with_user_id(request):
    view_url = request.build_absolute_uri()

    try:
        user_id = request.session.get('user_id')
        reviews_by_user = Review.objects.filter(user=user_id)  # Assuming you have a 'user' field in your Review model

        if reviews_by_user.exists():
            return JsonResponse([review.to_dict() for review in reviews_by_user], safe=False)
        else:
            return JsonResponse(None, safe=False)
            # return JsonResponse({"current_page": 0, "total_pages": 0, "query_results": []})
    except Review.DoesNotExist:
        return JsonResponse(None, safe=False)


@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
@login_required
def creat_review_for_product_with_product_id(request, slug):
    try:
        userId = request.session.get('user_id')
        user_leaving_review = User.objects.get(id=userId)
        product_to_review = Product.objects.get(slug=slug)

        # Check if the user has already submitted a review for this product
        existing_review = Review.objects.filter(product=product_to_review, user=user_leaving_review).first()

        if existing_review:
            # User has already submitted a review for this product
            return JsonResponse({"error": "You can only submit one review per product.Check your profile for more actions."}, status=400)



        rating = request.POST['rating']
        comment = request.POST['comment']

        new_review = Review(product=product_to_review, user=user_leaving_review, rating=rating, comment=comment)

        new_review.full_clean()
        new_review.save()

        return JsonResponse({"success": True})  # Added this
    
    except ValidationError as e:
        return JsonResponse(str(e), safe=False)

    except User.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} does not exist."}, status=404)
    
    except Product.DoesNotExist:
        return JsonResponse({"error": f"Product with ID: {id} does not exist."}, status=404)

    except MultiValueDictKeyError as e:
        return JsonResponse({"error": f"The form value for attribute {str(e)} is missing."}, status=400)

@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
@require_http_methods(["DELETE"])
@login_required
def user_delete_review(request, id):
    try:
        userId = request.session.get('user_id')

        review_to_delete = Review.objects.get(review_id=id, user=userId)

        review_to_delete.delete()

        return JsonResponse({"success": True}, safe=False)
    
    except Review.DoesNotExist:
            return JsonResponse({"error": f"Review with ID: {id} does not exist."}, status=404)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


"""SHIPPING AND ADDRESS"""
@require_http_methods(["GET"])
@login_required
def get_user_saved_addresses(request):
    userId = request.session.get('user_id')

    view_url = request.build_absolute_uri()

    user_saved_addresses = Address.objects.filter(user=userId)

    if user_saved_addresses.exists():
        return JsonResponse(paginate_results(request, [address for address in user_saved_addresses], view_url), safe=False)
    else:  # we don't need to return an error here
        return JsonResponse(None, safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
@login_required
def add_address_to_user_profile(request):
    try:
        userId = request.session.get('user_id')

        data = request.POST

        street_address, town, county, phone_number, additional_details = [data['street_address'], data['town'], data['county'], data['phone_number'], data['additional_details']]

        user = User.objects.get(id=userId)

        new_address = Address(street_address=street_address, town=town, county=county, phone_number=phone_number, additional_details=additional_details, user=user)

        new_address.save()

        return JsonResponse({"message": "address created successfully"})
    
    except User.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} does not exist."}, status=404)
    
    except MultiValueDictKeyError as e:
        return JsonResponse({"error": f"The form value for attribute {str(e)} is missing."}, status=400)

@require_http_methods(["PUT"])
@login_required
@csrf_exempt
def update_details_of_address_with_address_id(request, id):
    try:
        userId = request.session.get('user_id')

        address_to_update = Address.objects.get(address_id=id)

        user = User.objects.get(id=userId)

        data = QueryDict(request.body)

        for field, value in data.items():
            
            if (hasattr(address_to_update, field)):
                setattr(address_to_update, field, value)
            
            else:
                return JsonResponse(f"There is no field named {field} in address table.", safe=False)

        address_to_update.save()

        return JsonResponse({"success": True}, safe=False)

    except Address.DoesNotExist:
        return JsonResponse({"error": f"Address with ID: {id} does not exist."}, status=404)
    
    except User.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} does not exist."}, status=404)

@require_http_methods(["DELETE"])
@login_required
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_address_with_address_id(request, id):
    try:
        userId = request.session.get('user_id')

        address_to_delete = Address.objects.get(address_id=id, user=userId)

        address_to_delete.delete()

        return JsonResponse({"success": True}, safe=False)
    
    except Address.DoesNotExist:
        return JsonResponse({"error": f"Address with ID: {id} does not exist."}, status=404)


"""TOWNS"""
def list_all_towns(request):
    view_url = request.build_absolute_uri()

    all_towns = Towns.objects.all()

    if all_towns.exists():
        return JsonResponse([town.to_dict() for town in all_towns], safe=False)
    else:  # we don't need to return an error here
        return JsonResponse(None, safe=False)

"""WISHLIST"""
@csrf_exempt
def get_user_wishlist(request):
    userId = request.session.get('user_id')

    view_url = request.build_absolute_uri()

    user_wishlist = Wishlist.objects.filter(user=userId)

    if user_wishlist.exists():
        return JsonResponse([item.to_dict() for item in user_wishlist],  safe=False)
    else:  # we don't need to return an error here
        return JsonResponse(None, safe=False)

@csrf_exempt
@require_http_methods(["POST"])
def add_item_to_wishlist(request, productId):
    userId = request.session.get('user_id')

    view_url = request.build_absolute_uri()

    try:
        user = User.objects.get(id=userId)
        product = Product.objects.get(product_id=productId)

        if Wishlist.objects.filter(user=user, product=product).exists():
            return JsonResponse({"error": "Item already in wishlist."}, status=400)

        new_wishlist_item = Wishlist(user=user, product=product)

        new_wishlist_item.save()

        return JsonResponse({"message": "Item added to wishlist successfully"}, status=200)
    
    except User.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} does not exist."}, status=404)
    
    except Product.DoesNotExist:
        return JsonResponse({"error": f"Product with ID: {productId} does not exist."}, status=404)

@csrf_exempt
@require_http_methods(["DELETE"])
def remove_item_from_wishlist(request, productId):
    userId = request.session.get('user_id')

    view_url = request.build_absolute_uri()
    try:
        user = User.objects.get(id=userId)
        product = Product.objects.get(product_id=productId)

        wishlist_item_to_delete = Wishlist.objects.get(user=user, product=product)

        wishlist_item_to_delete.delete()
    
    except User.DoesNotExist:
        return JsonResponse({"error": f"User with ID: {userId} does not exist."}, status=404)
    
    except Product.DoesNotExist:
        return JsonResponse({"error": f"Product with ID: {productId} does not exist."}, status=404)

    return JsonResponse({"message": "Item deleted from wishlist"})

"""SOCIAL AUTH"""

def privacy_policy(request):
    privacy_policy = {
            "title": "Privacy Policy",
            "description": "This is our privacy policy. It explains how we collect, use, and protect your personal information.",
            "last_updated": "2024-06-14",
            "sections": [
                {
                    "section_title": "Information We Collect",
                    "content": "We may collect personal information such as your name, email address, and IP address."
                },
                {
                    "section_title": "How We Use Your Information",
                    "content": "We use your information to provide and improve our services."
                },
                {
                    "section_title": "Your Rights",
                    "content": "You have rights regarding your personal information. You can request access to it, correction, deletion, or object to processing."
                }
            ]
        }

        # Return the privacy policy as a JSON response
    return JsonResponse(privacy_policy)

def data_deletion(request):
    # Define the data deletion instructions as a Python dictionary
    deletion_instructions = {
        "instructions": {
            "title": "Data Deletion Instructions",
            "description": "These instructions guide you on how to request the deletion of your personal data from our records.",
            "steps": [
                {
                    "step_number": 1,
                    "instruction": "Contact us via email at skinsoko@gmail.com with the subject line 'Data Deletion Request'."
                },
                {
                    "step_number": 2,
                    "instruction": "Include in your email the following details: Full Name, Email Address, and any other relevant information that can help us identify your account."
                },
                {
                    "step_number": 3,
                    "instruction": "Please allow up to 30 days for your request to be processed."
                }
            ],
            "contact_info": {
                "email": "skinsoko@gmail.com",
                "phone": "0703676507",
                "address": "Mombasa, Kenya"
            }
        }
    }

    # Return the data deletion instructions as a JSON response
    return JsonResponse(deletion_instructions)

def TOS(request):
    terms_of_service = {
            "title": "Terms of Service",
            "description": "These are the terms and conditions governing the use of our website and services.",
            "version": "1.0",
            "effective_date": "2024-06-14",
            "sections": [
                {
                    "section_title": "Introduction",
                    "content": "Welcome to our website. By accessing or using our website, you agree to the terms and conditions set forth in these Terms of Service."
                },
                {
                    "section_title": "Acceptance of Terms",
                    "content": "By accessing or using any part of the website, you agree to become bound by these terms and conditions."
                },
                {
                    "section_title": "Changes to the Terms",
                    "content": "We reserve the right to update or change our Terms of Service from time to time. We will notify you of any changes by posting the new Terms of Service on this page."
                }
            ]
        }

    # Return the terms of service as a JSON response
    return JsonResponse(terms_of_service)
