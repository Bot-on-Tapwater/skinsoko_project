from django.urls import include, path
from . import views

address_patterns = [
    path(
        "users/addresses/",
        views.AddressViews.get_user_saved_addresses,
        name="get-user-addresses",
    ),
    path(
        "users/addresses/create/",
        views.AddressViews.add_address_to_user_profile,
        name="add-address-to-profile",
    ),
    path(
        "users/addresses/<uuid:id>/update/",
        views.AddressViews.update_details_of_address_with_address_id,
        name="update-address-details",
    ),
    path(
        "users/addresses/<uuid:id>/delete/",
        views.AddressViews.delete_address_with_address_id,
        name="delete-address",
    ),
    path("users/addresses/contacts/", views.AddressViews.get_contacts_from_address),
    path("towns/", views.AddressViews.list_all_towns, name="list-all-towns"),
]

auth_patterns = [
    path("login/", views.AuthViews.login_view, name="login"),
    path("logout/", views.AuthViews.logout_view, name="logout"),
    path("register/", views.AuthViews.register_view, name="register"),
    path(
        "password_reset/request/",
        views.AuthViews.request_password_reset,
        name="request-password-reset",
    ),
    path("password_reset/validate/", views.AuthViews.validate_passsword_reset_token),
    path("password_reset/reset/", views.AuthViews.reset_password),
    path("user_status/", views.AuthViews.user_status),
]

cart_patterns = [
    path(
        "users/cart/",
        views.CartViews.get_contents_of_shopping_cart_of_user,
        name="get-cart-contents",
    ),
    path(
        "users/cart/add/<uuid:productId>/",
        views.CartViews.add_product_to_user_cart,
        name="add-product-to-cart",
    ),
    path(
        "users/cart/remove/<uuid:productId>/",
        views.CartViews.remove_product_from_user_cart,
        name="remove-product-from-cart",
    ),
    path(
        "users/cart/clear/",
        views.CartViews.clear_entire_shopping_cart,
        name="clear-cart",
    ),
    path(
        "users/cart/update/<uuid:productId>/",
        views.CartViews.update_product_in_user_cart,
        name="update-product-in-cart",
    ),
]

category_patterns = [
    path(
        "main-categories/",
        views.CategoryViews.get_list_of_all_main_categories,
        name="list-all-categories",
    ),
    path(
        "subcategories/<str:main_category>/",
        views.CategoryViews.get_list_of_all_sub_categories_in_a_main_category,
        name="list-all-sub-categories",
    ),
    path(
        "brands/",
        views.CategoryViews.get_list_of_all_brands,
        name="list-all-brand-categories",
    ),
]

coupon_patterns = [
    path("coupons/generate/", views.CouponViews.generate_coupons),
    path("coupons/validate/", views.CouponViews.validate_coupon),
]


csrf_patterns = [path("api/csrf-token/", views.CsrfViews.get_csrf_token)]

data_patterns = [
    path(
        "consolidated-data/",
        views.DataViews.consolidated_data_view,
        name="consolidated-data",
    ),
]

database_patterns = [
    path("database/populate/", views.DatabaseViews.populate_database),
    path("database/populate/products/", views.DatabaseViews.populate_products),
    path("database/populate/categories/", views.DatabaseViews.populate_categories),
    path("database/populate/towns/", views.DatabaseViews.populate_towns),
]

maillist_patterns = [
    path(
        "maillist/create/", views.MaillistViews.maillist_create, name="maillist-create"
    ),
    path("maillist/all/", views.MaillistViews.maillist_all, name="maillist-all"),
]

order_patterns = [
    path(
        "users/orders/",
        views.OrderViews.list_orders_placed_by_user_with_user_id,
        name="get-user-orders",
    ),
    path("orders/", views.OrderViews.get_list_of_all_orders, name="list-all-orders"),
    path(
        "orders/<uuid:id>/",
        views.OrderViews.get_details_of_order_with_order_id,
        name="get-order-details",
    ),
    path(
        "users/orders/create/",
        views.OrderViews.create_new_order,
        name="create-new-order",
    ),
    path(
        "orders/<uuid:id>/cancel/",
        views.OrderViews.cancel_order_with_order_id,
        name="cancel-order",
    ),
    path(
        "orders/<uuid:id>/order-items/",
        views.OrderViews.get_order_items_for_order_with_order_id,
        name="get-order-items",
    ),
    path(
        "orders/<uuid:id>/deliver/",
        views.OrderViews.update_order_to_delivered_with_order_id,
        name="delivered-order",
    ),
    path("orders/paid/", views.OrderViews.get_list_of_paid_for_orders),
]

product_patterns = [
    path("products/", views.ProductViews.list_all_products, name="list-all-products"),
    path(
        "products/<slug:slug>/",
        views.ProductViews.get_product_with_product_id,
        name="get-product-details",
    ),
    path(
        "search/", views.ProductViews.search, name="search-products"
    ),  # TODO: Pass as query to list all products function
]

review_patterns = [
    path(
        "users/reviews/",
        views.ReviewViews.list_reviews_created_by_user_with_user_id,
        name="list-user-reviews",
    ),
    path(
        "products/<slug:slug>/reviews/",
        views.ReviewViews.get_reviews_for_product_with_product_id,
        name="get-product-reviews",
    ),
    path(
        "users/products/<slug:slug>/reviews/create/",
        views.ReviewViews.create_review_for_product_with_product_id,
        name="create-product-review",
    ),
    path(
        "users/reviews/<uuid:id>/delete/",
        views.ReviewViews.user_delete_review,
        name="delete-user-review",
    ),
]

user_patterns = [
    path(
        "users/",
        views.UserViews.get_user_with_user_id_profile_details,
        name="get-user-profile-details",
    ),
]

wishlist_patterns = [
    path(
        "users/wishlists/",
        views.WishlistViews.get_user_wishlist,
        name="list-all-wishlists",
    ),
    path(
        "users/wishlists/add/<uuid:productId>/",
        views.WishlistViews.add_item_to_wishlist,
        name="add-item-to-wishlist",
    ),
    path(
        "users/wishlists/remove/<uuid:productId>/",
        views.WishlistViews.remove_item_from_wishlist,
        name="remove-item-from-wishlist",
    ),
]

# Uncategorized Routes
misc_patterns = [
    path("privacy/", views.MiscViews.privacy_policy, name="privacy-policy"),
    path("tos/", views.MiscViews.TOS, name="terms-of-service"),
    path("data_deletion/", views.MiscViews.data_deletion, name="data-deletion"),
]

# Depracted
pesapal_patterns = [
    path("pesapal/api_token/", views.PesapalViews.get_pesapal_token_view),
    path("pesapal/ipn/", views.PesapalViews.register_ipn_view),
    path(
        "pesapal/submit_order/<uuid:order_id>/",
        views.PesapalViews.pesapal_submit_order,
        name="submit_order_request",
    ),
    path(
        "pesapal/transaction_status/<str:tracking_id>/",
        views.PesapalViews.pesapal_transaction_status,
        name="transaction_status",
    ),
    path(
        "pesapal/ipn/notification/",
        views.PesapalViews.ipn_notification_view,
        name="ipn_notification",
    ),
]

selcom_patterns = [
    path("selcom/create_minimal_order/", views.SelcomViews.create_minimal_order),
    path("selcom/webhook/", views.SelcomViews.selcom_webhook),
    path("selcom/order_status/", views.SelcomViews.get_selcom_order_status),
]


urlpatterns = [
    path("/", include((address_patterns, "address"))),
    path("/", include((auth_patterns, "auth"))),
    path("/", include((cart_patterns, "cart"))),
    path("/", include((category_patterns, "category"))),
    path("/", include((coupon_patterns, "coupon"))),
    path("/", include((csrf_patterns, "csrf"))),
    path("/", include((data_patterns, "data"))),
    path("/", include((database_patterns, "database"))),
    path("/", include((maillist_patterns, "maillist"))),
    path("/", include((order_patterns, "order"))),
    path("/", include((product_patterns, "product"))),
    path("/", include((review_patterns, "review"))),
    path("/", include((user_patterns, "user"))),
    path("/", include((wishlist_patterns, "wishlist"))),
    # Uncategorized Routes
    path("/", include((misc_patterns, "misc"))),
    # Depracated Routes
    path("/", include((pesapal_patterns, "pesapal"))),
    path("/", include((selcom_patterns, "selcom"))),
]
