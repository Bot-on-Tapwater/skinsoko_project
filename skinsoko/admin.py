from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django.db.models.query import QuerySet
from typing import Any
from .models import (
    User,
    MainCategory,
    SubCategory,
    Brand,
    Product,
    ShoppingCart,
    CartItem,
    Order,
    OrderItem,
    Review,
    Address,
    Towns,
    Wishlist,
    Coupon,
    Maillist,
)


class UserAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "email", "password_reset_token")
    fields: tuple[str, ...] = ("id", "email", "password", "password_reset_token")
    readonly_fields: tuple[str, ...] = ("id",)
    search_fields: tuple[str, ...] = ("email",)


class MainCategoryAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "name")
    search_fields: tuple[str, ...] = ("name",)


class SubCategoryAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "main_category", "name")
    search_fields: tuple[str, ...] = ("name", "main_category__name")
    list_filter: tuple[str, ...] = ("main_category",)


class BrandAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "name")
    search_fields: tuple[str, ...] = ("name",)


class ProductAdmin(ModelAdmin):
    prepopulated_fields: dict[str, tuple[str, ...]] = {"slug": ("name",)}
    list_display: tuple[str, ...] = (
        "name",
        "price",
        "discount",
        "discounted_price",
        "quantity_in_stock",
        "best_seller",
        "brand",
    )
    search_fields: tuple[str, ...] = ("name", "brand__name")
    list_filter: tuple[str, ...] = ("best_seller", "brand", "subcategories")
    ordering: tuple[str, ...] = ("-price",)


class ShoppingCartAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "user", "session_key", "created_at")
    search_fields: tuple[str, ...] = ("user__email", "session_key")
    list_filter: tuple[str, ...] = ("created_at",)


class CartItemAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "cart", "product", "quantity")
    search_fields: tuple[str, ...] = ("cart__id", "product__name")
    list_filter: tuple[str, ...] = ("cart", "product")


class OrderAdmin(ModelAdmin):
    list_display: tuple[str, ...] = (
        "id",
        "user",
        "total_amount",
        "order_status",
        "created_at",
    )
    search_fields: tuple[str, ...] = ("user__email", "id")
    list_filter: tuple[str, ...] = ("order_status", "created_at")


class OrderItemAdmin(ModelAdmin):
    list_display: tuple[str, ...] = (
        "id",
        "order",
        "product",
        "quantity",
        "unit_price",
    )
    search_fields: tuple[str, ...] = ("order__id", "product__name")
    list_filter: tuple[str, ...] = ("order", "product")


class ReviewAdmin(ModelAdmin):
    list_display: tuple[str, ...] = (
        "id",
        "product",
        "user",
        "rating",
        "full_name",
        "created_at",
    )
    search_fields: tuple[str, ...] = ("product__name", "user__email", "full_name")
    list_filter: tuple[str, ...] = ("rating", "created_at")


class AddressAdmin(ModelAdmin):
    list_display: tuple[str, ...] = (
        "id",
        "user",
        "full_name",
        "street_address",
        "town",
        "county",
        "phone_number",
    )
    search_fields: tuple[str, ...] = ("user__email", "full_name", "town")
    list_filter: tuple[str, ...] = ("town", "county")


class TownsAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "name", "delivery_fee")
    search_fields: tuple[str, ...] = ("name",)
    list_filter: tuple[str, ...] = ("delivery_fee",)


class WishlistAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("id", "user", "product", "added_at")
    search_fields: tuple[str, ...] = ("user__email", "product__name")
    list_filter: tuple[str, ...] = ("added_at",)


class CouponAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("code", "discount", "active", "order")
    search_fields: tuple[str, ...] = ("code",)
    list_filter: tuple[str, ...] = ("active", "order")


class MaillistAdmin(ModelAdmin):
    list_display: tuple[str, ...] = ("email", "phone_number")
    search_fields: tuple[str, ...] = ("email", "phone_number")


admin.site.register(User, UserAdmin)
admin.site.register(MainCategory, MainCategoryAdmin)
admin.site.register(SubCategory, SubCategoryAdmin)
admin.site.register(Brand, BrandAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ShoppingCart, ShoppingCartAdmin)
admin.site.register(CartItem, CartItemAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
admin.site.register(Review, ReviewAdmin)
admin.site.register(Address, AddressAdmin)
admin.site.register(Towns, TownsAdmin)
admin.site.register(Wishlist, WishlistAdmin)
admin.site.register(Coupon, CouponAdmin)
admin.site.register(Maillist, MaillistAdmin)
