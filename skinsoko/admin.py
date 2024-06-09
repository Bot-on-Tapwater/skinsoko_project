# Register your models here.
from django.contrib import admin
from .models import User, MainCategory, SubCategory, Brand, Product, ShoppingCart, CartItem, Order, OrderItem, Review, Address, Towns, Wishlist

admin.site.register(User)
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
