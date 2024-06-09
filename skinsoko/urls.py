from django.urls import path

from . import views

urlpatterns = [
    # Email & SMTP

    # User Authentication & Authorization
    path("login/", views.test_login_view, name="login"),

    # Product Management
    path("products/", views.list_all_products, name="list-all-products"),
    path("products/<int:id>/", views.get_product_with_product_id, name="get-product-details"),

    # User Profile

    # List of User's Orders
    path("users/orders/", views.list_orders_placed_by_user_with_user_id, name="get-user-orders"),

    # Shopping Cart
    path("users/cart/", views.get_contents_of_shopping_cart_of_user, name="get-cart-contents"),
    path("users/cart/add/<int:productId>/", views.add_product_to_user_cart, name="add-product-to-cart"),
    path("users/cart/remove/<int:productId>/", views.remove_product_from_user_cart, name="remove-product-from-cart"),
    path("users/cart/clear/", views.clear_entire_shopping_cart, name="clear-cart"),

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
    path('products/<int:id>/reviews/', views.get_reviews_for_product_with_product_id, name='get-product-reviews'),
    path('users/products/<int:id>/reviews/create/', views.creat_review_for_product_with_product_id, name='create-product-review'),
    path('users/reviews/<int:id>/delete/', views.user_delete_review, name='delete-user-review'),

    # Shipping and Address
    path('users/addresses/', views.get_user_saved_addresses, name='get-user-addresses'),
    path('users/addresses/create/', views.add_address_to_user_profile, name='add-address-to-profile'),
    path('users/addresses/<int:id>/update/', views.update_details_of_address_with_address_id, name='update-address-details'),
    path('users/addresses/<int:id>/delete/', views.delete_address_with_address_id, name='delete-address'),

    # Towns
    path('towns/', views.list_all_towns, name='list-all-towns'),

]