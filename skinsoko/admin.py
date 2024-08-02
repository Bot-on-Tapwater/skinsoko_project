# Register your models here.
from django.contrib import admin
from .models import User, MainCategory, SubCategory, Brand, Product, ShoppingCart, CartItem, Order, OrderItem, Review, Address, Towns, Wishlist, Coupon, Maillist

# class UserAdmin(admin.ModelAdmin):
#     # Fields to display in the list view
#     list_display = ('id', 'username', 'email', 'first_name', 'last_name', 'is_verified')
    
#     # Fields to display in the detail view
#     fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name', 'verification_token', 'password_reset_token', 'is_verified')
    
#     # Make the id field read-only
#     readonly_fields = ('id',)

# admin.site.register(User, UserAdmin)

class ProductAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("name",)}
    list_display = ('name', 'price', 'discount', 'discounted_price', 'quantity_in_stock', 'best_seller', 'brand')
    search_fields = ('name', 'brand__name')
    list_filter = ('best_seller', 'brand', 'subcategories')
    ordering = ('-price',)
admin.site.register(User)
admin.site.register(MainCategory)
admin.site.register(SubCategory)
admin.site.register(Brand)
admin.site.register(Product, ProductAdmin)
admin.site.register(ShoppingCart)
admin.site.register(CartItem)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Review)
admin.site.register(Address)
admin.site.register(Towns)
admin.site.register(Wishlist)
admin.site.register(Coupon)
admin.site.register(Maillist)
