from django.shortcuts import render, HttpResponse, get_object_or_404
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
# from authlib.integrations.django_client import OAuth
from django.conf import settings
from django.shortcuts import redirect, render
from django.urls import reverse
from urllib.parse import quote_plus, urlencode
import json
import requests
from django.http import JsonResponse

"""LANDING PAGE"""
@require_http_methods(["GET"])
def index(request):
    # /eridosolutions/
    return JsonResponse("Landing page.")

"""AUTHENTICATION"""
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def register(request):
    # /eridosolutions/register
    return JsonResponse("Create a new user account.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def login(request):
    # /eridosolutions/login
    return JsonResponse("Authenticate a user and generate an access token.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def logout(request):
    # /eridosolutions/logout
    return JsonResponse("Invalidate the user's access token and log them out.")

"""PRODUCT MANAGEMENT"""
@require_http_methods(["GET"])
def list_all_products(request):
    # /eridosolutions/products
    return JsonResponse("Get a list of all products.")

@require_http_methods(["GET"])
def get_product_with_product_id(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Get details of a specific product.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product(request):
    # /eridosolutions/products
    return JsonResponse("Add a new product to the catalog.")

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_product_with_product_id_details(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Update details of a specific product.")

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_product_with_product_id(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Remove a product from the catalog.")

"""USER PROFILE"""
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request, id):
    # /eridosolutions/users/<id>
    return JsonResponse("Get user profile details.")

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_user_with_user_id_profile_details(request, id):
    # /eridosolutions/users/<id>
    return JsonResponse("Update user profile details.")

@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request, id):
    # /eridosolutions/users/<id>/orders
    return JsonResponse("Get a list of orders placed by the user.")

"""SHOPPING CART"""
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request):
    # /eridosolutions/cart
    return JsonResponse("Get the current contents of the user's shopping cart.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_product_to_user_cart(request):
    # /eridosolutions/cart/add
    return JsonResponse("Add a product to the shopping cart.")

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_from_user_cart(request, productId):
    # /eridosolutions/cart/remove/<productId>
    return JsonResponse("Remove a product from the shopping cart")

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def clear_entire_shopping_cart(request):
    # /eridosolutions/cart/clear
    return JsonResponse("Clear the entire shopping cart.")

"""ORDER MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    # /eridosolutions/orders
    return JsonResponse("Get a list of all orders(admin access).")

@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    # /eridosolutions/orders/<id>
    return JsonResponse("Get details of a specific order.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_order(request):
    # /eridosolutions/orders
    return JsonResponse("Place a new order.")

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def cancel_order_with_order_id(request, id):
    # /eridosolutions/orders/<id>/cancel
    return JsonResponse("Cancel a specific order.")

"""PAYMENT INTEGRATION"""
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def process_payment(request):
    # /eridosolutions/payment/charge
    return JsonResponse("Process payment for an order.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def refund_payment(request, orderId):
    # /eridosolutions/payment/refund/<orderId>
    return JsonResponse("Refund a payment for a specific order.")

"""CATEGORY MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_product_categories(request):
    # /eridosolutions/categories
    return JsonResponse("Get list of all product categories.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product_category(request):
    # /eridosolutions/categories
    return JsonResponse("Add a new product category.")

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_category_with_category_id(request):
    # /eridosolutions/categories/<id>
    return JsonResponse("Update details of a specific product category.")

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_category_with_category_id(request):
    # /eridosolutions/categories/<id>
    return JsonResponse("Remove a product category.")

"""REVIEWS AND RATINGS"""
@require_http_methods(["GET"])
def get_reviews_for_product_with_product_id(request):
    # /eridosolutions/products/<id>/reviews
    return JsonResponse("Get reviews for a specific product.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def creat_review_for_product_with_product_id(request):
    # /eridosolutions/products/<id>/reviews
    return JsonResponse("Add a new review for a product.")

"""SEARCH AND FILTERS"""
@require_http_methods(["GET"])
def search_products(request):
    # /eridosolutions/search
    return JsonResponse("Search for products based no specified criteria.")

@require_http_methods(["GET"])
def turn_on_filters(request):
    # /eridosolutions/filters
    return JsonResponse("Get filter options for product search.")

"""SHIPPING AND ADDRESS"""
@require_http_methods(["GET"])
def get_available_shipping_options(request):
    # /eridosolutions/shipping-options
    return JsonResponse("Get available shipping options.")

@require_http_methods(["GET"])
def get_user_saved_addresses(request):
    # /eridosolutions/addresses
    return JsonResponse("Get user's saved addresses.")

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_address_to_user_profile(request):
    # /eridosolutions/addresses
    return JsonResponse("Add a new address to the user's profile.")

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_address_with_address_id(request, id):
    # /eridosolutions/addresses/<id>
    return JsonResponse("Update details of a specific address")

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_address_with_address_id(request, id):
    # /eridosolutions/addresses/<id>
    return JsonResponse("Remove an address from the user's profile.")