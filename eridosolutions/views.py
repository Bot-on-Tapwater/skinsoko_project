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
from django.http import HttpResponseNotFound, HttpResponseServerError, Http404

"""LANDING PAGE"""
@require_http_methods(["GET"])
def index(request):
    # /eridosolutions/
    # return HttpResponse("Error handler content", status=404)
    # raise Http404("Resource not found")
    # return JsonResponse("Landing page.", safe=False)
    return render(request, "eridosolutions/index.html")

"""AUTHENTICATION"""
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def register(request):
    # /eridosolutions/register
    return JsonResponse("Create a new user account.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def login(request):
    # /eridosolutions/login
    return JsonResponse("Authenticate a user and generate an access token.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def logout(request):
    # /eridosolutions/logout
    return JsonResponse("Invalidate the user's access token and log them out.", safe=False)

"""PRODUCT MANAGEMENT"""
@require_http_methods(["GET"])
def list_all_products(request):
    # /eridosolutions/products
    return JsonResponse("Get a list of all products.", safe=False)

@require_http_methods(["GET"])
def get_product_with_product_id(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Get details of a specific product.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product(request):
    # /eridosolutions/products
    return JsonResponse("Add a new product to the catalog.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_product_with_product_id_details(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Update details of a specific product.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_product_with_product_id(request, id):
    # /eridosolutions/products/<id>
    return JsonResponse("Remove a product from the catalog.", safe=False)

"""USER PROFILE"""
@require_http_methods(["GET"])
def get_user_with_user_id_profile_details(request, id):
    # /eridosolutions/users/<id>
    return JsonResponse("Get user profile details.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_user_with_user_id_profile_details(request, id):
    # /eridosolutions/users/<id>
    return JsonResponse("Update user profile details.", safe=False)

@require_http_methods(["GET"])
def list_orders_placed_by_user_with_user_id(request, id):
    # /eridosolutions/users/<id>/orders
    return JsonResponse("Get a list of orders placed by the user.", safe=False)

"""SHOPPING CART"""
@require_http_methods(["GET"])
def get_contents_of_shopping_cart_of_user(request):
    # /eridosolutions/cart
    return JsonResponse("Get the current contents of the user's shopping cart.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_product_to_user_cart(request):
    # /eridosolutions/cart/add
    return JsonResponse("Add a product to the shopping cart.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_from_user_cart(request, productId):
    # /eridosolutions/cart/remove/<productId>
    return JsonResponse("Remove a product from the shopping cart", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def clear_entire_shopping_cart(request):
    # /eridosolutions/cart/clear
    return JsonResponse("Clear the entire shopping cart.", safe=False)

"""ORDER MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_orders(request):
    # /eridosolutions/orders
    return JsonResponse("Get a list of all orders(admin access).", safe=False)

@require_http_methods(["GET"])
def get_details_of_order_with_order_id(request, id):
    # /eridosolutions/orders/<id>
    return JsonResponse("Get details of a specific order.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_order(request):
    # /eridosolutions/orders
    return JsonResponse("Place a new order.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def cancel_order_with_order_id(request, id):
    # /eridosolutions/orders/<id>/cancel
    return JsonResponse("Cancel a specific order.", safe=False)

"""PAYMENT INTEGRATION"""
@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def process_payment(request):
    # /eridosolutions/payment/charge
    return JsonResponse("Process payment for an order.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def refund_payment(request, orderId):
    # /eridosolutions/payment/refund/<orderId>
    return JsonResponse("Refund a payment for a specific order.", safe=False)

"""CATEGORY MANAGEMENT"""
@require_http_methods(["GET"])
def get_list_of_all_product_categories(request):
    # /eridosolutions/categories
    return JsonResponse("Get list of all product categories.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def create_new_product_category(request):
    # /eridosolutions/categories
    return JsonResponse("Add a new product category.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_category_with_category_id(request):
    # /eridosolutions/categories/<id>
    return JsonResponse("Update details of a specific product category.", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def remove_product_category_with_category_id(request):
    # /eridosolutions/categories/<id>
    return JsonResponse("Remove a product category.", safe=False)

"""REVIEWS AND RATINGS"""
@require_http_methods(["GET"])
def get_reviews_for_product_with_product_id(request):
    # /eridosolutions/products/<id>/reviews
    return JsonResponse("Get reviews for a specific product.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def creat_review_for_product_with_product_id(request):
    # /eridosolutions/products/<id>/reviews
    return JsonResponse("Add a new review for a product.", safe=False)

"""SEARCH AND FILTERS"""
@require_http_methods(["GET"])
def search_products(request):
    # /eridosolutions/search
    return JsonResponse("Search for products based no specified criteria.", safe=False)

@require_http_methods(["GET"])
def turn_on_filters(request):
    # /eridosolutions/filters
    return JsonResponse("Get filter options for product search.", safe=False)

"""SHIPPING AND ADDRESS"""
@require_http_methods(["GET"])
def get_available_shipping_options(request):
    # /eridosolutions/shipping-options
    return JsonResponse("Get available shipping options.", safe=False)

@require_http_methods(["GET"])
def get_user_saved_addresses(request):
    # /eridosolutions/addresses
    return JsonResponse("Get user's saved addresses.", safe=False)

@require_http_methods(["POST"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def add_address_to_user_profile(request):
    # /eridosolutions/addresses
    return JsonResponse("Add a new address to the user's profile.", safe=False)

@require_http_methods(["PUT"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def update_details_of_address_with_address_id(request, id):
    # /eridosolutions/addresses/<id>
    return JsonResponse("Update details of a specific address", safe=False)

@require_http_methods(["DELETE"])
@csrf_exempt # !!!SECURITY RISK!!! COMMENT OUT CODE
def delete_address_with_address_id(request, id):
    # /eridosolutions/addresses/<id>
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
