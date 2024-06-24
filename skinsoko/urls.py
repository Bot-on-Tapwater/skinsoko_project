from django.urls import include, path
from .views import social_auth

from . import views

urlpatterns = [
    # Email & SMTP

    # User Authentication & Authorization
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("register/", views.register_view, name="register"),
    path("password_reset/request/", views.request_password_reset, name="request-password-reset"),
    path("password_reset/validate/", views.validate_passsword_reset_token),
    path("password_reset/reset/", views.reset_password),
    path("user_status/", views.user_status),


    # Product Management
    path("products/", views.list_all_products, name="list-all-products"),
    path("products/<slug:slug>/", views.get_product_with_product_id, name="get-product-details"),

    # User Profile
    path('users/', views.get_user_with_user_id_profile_details, name='get-user-profile-details'),
    path('users/reviews/', views.list_reviews_created_by_user_with_user_id, name='list-user-reviews'),

    # List of User's Orders
    path("users/orders/", views.list_orders_placed_by_user_with_user_id, name="get-user-orders"),

    # Shopping Cart
    path("users/cart/", views.get_contents_of_shopping_cart_of_user, name="get-cart-contents"),
    path("users/cart/add/<int:productId>/", views.add_product_to_user_cart, name="add-product-to-cart"),
    path("users/cart/remove/<int:productId>/", views.remove_product_from_user_cart, name="remove-product-from-cart"),
    path("users/cart/clear/", views.clear_entire_shopping_cart, name="clear-cart"),
    path('users/cart/update/<int:productId>/', views.update_product_in_user_cart, name='update-product-in-cart'),

    # Order Management
    path("orders/", views.get_list_of_all_orders, name="list-all-orders"),
    path('orders/<int:id>/', views.get_details_of_order_with_order_id, name='get-order-details'),
    path('users/orders/create/', views.create_new_order, name='create-new-order'),
    path('orders/<int:id>/cancel/', views.cancel_order_with_order_id, name='cancel-order'),

    # Category Management
    path("main-categories/", views.get_list_of_all_main_categories, name="list-all-categories"),
    path("subcategories/<str:main_category>/", views.get_list_of_all_sub_categories_in_a_main_category, name="list-all-sub-categories"),
    path("brands/", views.get_list_of_all_brands, name="list-all-brand-categories"),

    # Search Features
    path("search/", views.search, name="search-products"),

    # Reviews and Ratings
    path('products/<slug:slug>/reviews/', views.get_reviews_for_product_with_product_id, name='get-product-reviews'),
    path('users/products/<slug:slug>/reviews/create/', views.creat_review_for_product_with_product_id, name='create-product-review'),
    path('users/reviews/<int:id>/delete/', views.user_delete_review, name='delete-user-review'),

    # Shipping and Address
    path('users/addresses/', views.get_user_saved_addresses, name='get-user-addresses'),
    path('users/addresses/create/', views.add_address_to_user_profile, name='add-address-to-profile'),
    path('users/addresses/<int:id>/update/', views.update_details_of_address_with_address_id, name='update-address-details'),
    path('users/addresses/<int:id>/delete/', views.delete_address_with_address_id, name='delete-address'),

    # Towns
    path('towns/', views.list_all_towns, name='list-all-towns'),

    # Wishlist
    path('users/wishlists/', views.get_user_wishlist, name='list-all-wishlists'),
    path('users/wishlists/add/<int:productId>/', views.add_item_to_wishlist, name='add-item-to-wishlist'),
    path('users/wishlists/remove/<int:productId>/', views.remove_item_from_wishlist, name='remove-item-from-wishlist'),

    # Social Auth
    path('privacy/', views.privacy_policy, name='privacy-policy'),
    path('tos/', views.TOS, name='terms-of-service'),
    path('data_deletion/', views.data_deletion, name='data-deletion'),
    path('auth/<str:backend>/', social_auth, name='social-auth'),
    path('auth/', include('social_django.urls', namespace='social')),
]