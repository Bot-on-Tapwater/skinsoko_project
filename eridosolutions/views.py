from django.shortcuts import render, HttpResponse, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from authlib.integrations.django_client import OAuth
from django.conf import settings
from django.shortcuts import redirect, render
from django.urls import reverse
from urllib.parse import quote_plus, urlencode
import json
import requests
from django.http import JsonResponse
from django.http import HttpResponseNotFound, HttpResponseServerError, Http404
from .models import *


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
    return JsonResponse("Get a list of all products.", safe=False)

@require_http_methods(["GET"])
def get_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/
    return JsonResponse("Get details of a specific product.", safe=False)


@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product(request):
    # http://127.0.0.1:8000/eridosolutions/products/create/
    return JsonResponse(f"Add a new product to the catalog.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_product_with_product_id_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/update/
    return JsonResponse("Update details of a specific product.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_product_with_product_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/products/<id>/delete/
    return JsonResponse("Remove a product from the catalog.", safe=False)

"""USER PROFILE"""
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/
    return JsonResponse("Get user profile details.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_user_with_user_id_profile_details(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/update/
    return JsonResponse("Update user profile details.", safe=False)

@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/users/<id>/orders/
    return JsonResponse("Get a list of orders placed by the user.", safe=False)

"""SHOPPING CART"""
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request):
    # http://127.0.0.1:8000/eridosolutions/cart/
    return JsonResponse("Get the current contents of the user's shopping cart.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_product_to_user_cart(request):
    # http://127.0.0.1:8000/eridosolutions/cart/add/
    return JsonResponse("Add a product to the shopping cart.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_from_user_cart(request, productId):
    # http://127.0.0.1:8000/eridosolutions/cart/remove/<productId>/
    return JsonResponse("Remove a product from the shopping cart", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def clear_entire_shopping_cart(request):
    # http://127.0.0.1:8000/eridosolutions/cart/clear/
    return JsonResponse("Clear the entire shopping cart.", safe=False)

"""ORDER MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    # http://127.0.0.1:8000/eridosolutions/orders/
    return JsonResponse("Get a list of all orders(admin access).", safe=False)

@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    # http://127.0.0.1:8000/eridosolutions/orders/<id>/
    return JsonResponse("Get details of a specific order.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_order(request):
    # http://127.0.0.1:8000/eridosolutions/orders/create/
    return JsonResponse("Place a new order.", safe=False)

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
