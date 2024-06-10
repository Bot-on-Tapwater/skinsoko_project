# Register your models here.
from django.contrib import admin
from .models import User, MainCategory, SubCategory, Brand, Product, ShoppingCart, CartItem, Order, OrderItem, Review, Address, Towns, Wishlist

class UserAdmin(admin.ModelAdmin):
    # Fields to display in the list view
    list_display = ('id', 'username', 'email', 'first_name', 'last_name', 'is_verified')
    
    # Fields to display in the detail view
    fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name', 'verification_token', 'password_reset_token', 'is_verified')
    
    # Make the id field read-only
    readonly_fields = ('id',)

admin.site.register(User, UserAdmin)
admin.site.register(MainCategory)
admin.site.register(SubCategory)
admin.site.register(Brand)
admin.site.register(Product)
admin.site.register(ShoppingCart)
admin.site.register(CartItem)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Review)
admin.site.register(Address)
admin.site.register(Towns)
admin.site.register(Wishlist)
