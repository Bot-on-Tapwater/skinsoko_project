from django.urls import path
from . import views

app_name = "eridosolutions"
urlpatterns = [
    # Auth0
    path("login", views.login, name="login"),
    path("logout", views.logout, name="logout"),
    path("callback", views.callback, name="callback"),

    # Landing Page
    path('', views.index, name='index'),

    # Authentication
    # path('register/', views.register, name='register'),
    # path('login/', views.login, name='login'),
    # path('logout/', views.logout, name='logout'),

    # Product Management
    path('products/', views.list_all_products, name='list-all-products'),
    path('products/<int:id>/', views.get_product_with_product_id, name='get-product-details'),
    path('products/create/', views.create_new_product, name='create-new-product'),
    path('products/<int:id>/update/', views.update_product_with_product_id_details, name='update-product-details'),
    path('products/<int:id>/delete/', views.delete_product_with_product_id, name='delete-product'),

    # User Profile
    path('users/<int:id>/', views.get_user_with_user_id_profile_details, name='get-user-profile-details'),
    path('users/<int:id>/update/', views.update_user_with_user_id_profile_details, name='update-user-profile-details'),
    path('users/<int:id>/orders/', views.list_orders_placed_by_user_with_user_id, name='list-user-orders'),

    # Shopping Cart
    path('cart/', views.get_contents_of_shopping_cart_of_user, name='get-cart-contents'),
    path('cart/add/', views.add_product_to_user_cart, name='add-product-to-cart'),
    path('cart/remove/<int:productId>/', views.remove_product_from_user_cart, name='remove-product-from-cart'),
    path('cart/clear/', views.clear_entire_shopping_cart, name='clear-cart'),

    # Order Management
    path('orders/', views.get_list_of_all_orders, name='list-all-orders'),
    path('orders/<int:id>/', views.get_details_of_order_with_order_id, name='get-order-details'),
    path('orders/create/', views.create_new_order, name='create-new-order'),
    path('orders/<int:id>/cancel/', views.cancel_order_with_order_id, name='cancel-order'),

    # Payment Integration
    path('payment/charge/', views.process_payment, name='process-payment'),
    path('payment/refund/<int:orderId>/', views.refund_payment, name='refund-payment'),

    # Category Management
    path('categories/', views.get_list_of_all_product_categories, name='list-all-categories'),
    path('categories/create/', views.create_new_product_category, name='create-new-category'),
    path('categories/<int:id>/update/', views.update_details_of_category_with_category_id, name='update-category-details'),
    path('categories/<int:id>/delete/', views.remove_product_category_with_category_id, name='delete-category'),

    # Reviews and Ratings
    path('products/<int:id>/reviews/', views.get_reviews_for_product_with_product_id, name='get-product-reviews'),
    path('products/<int:id>/reviews/create/', views.creat_review_for_product_with_product_id, name='create-product-review'),

    # Search and Filters
    path('search/', views.search_products, name='search-products'),
    path('filters/', views.turn_on_filters, name='turn-on-filters'),

    # Shipping and Address
    path('shipping-options/', views.get_available_shipping_options, name='get-shipping-options'),
    path('addresses/', views.get_user_saved_addresses, name='get-user-addresses'),
    path('addresses/create/', views.add_address_to_user_profile, name='add-address-to-profile'),
    path('addresses/<int:id>/update/', views.update_details_of_address_with_address_id, name='update-address-details'),
    path('addresses/<int:id>/delete/', views.delete_address_with_address_id, name='delete-address'),
]
