from django.db import models
from django.contrib.auth.hashers import make_password
import uuid


class User(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(null=False, unique=True)
    password = models.CharField(max_length=100, null=False)
    password_reset_token = models.UUIDField(null=True, blank=True)

    def set_password(self, raw_password):
        self.password = make_password(raw_password)

    def __str__(self):
        return self.email

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "email": self.email,
            "password_reset_token": (
                str(self.password_reset_token) if self.password_reset_token else None
            ),
        }


class MainCategory(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "name": self.name,
        }


class SubCategory(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    main_category = models.ForeignKey(
        MainCategory, on_delete=models.CASCADE, related_name="subcategories"
    )
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "main_category_id": str(self.id),
            "main_category_name": self.main_category.name,  # Assuming MainCategory has a 'name' field
            "name": self.name,
        }


class Brand(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    def to_dict(self, request=None):
        return {"id": str(self.id), "name": self.name}


class Product(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255, null=False, unique=True, db_index=True)
    description = models.TextField(null=False)
    ingredients = models.TextField(null=False)
    price = models.PositiveIntegerField(null=False, db_index=True)
    discount = models.PositiveIntegerField(default=0, null=False)
    discounted_price = models.PositiveIntegerField(null=False, editable=False)
    quantity_in_stock = models.PositiveIntegerField(null=False, db_index=True)
    subcategories = models.ManyToManyField(SubCategory)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    best_seller = models.BooleanField(default=False, db_index=True)
    image = models.TextField(null=False)
    slug = models.SlugField(default="", null=False, max_length=255, db_index=True)

    def __str__(self):
        return f"{self.name} - {self.price}"

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "name": self.name,
            "description": self.description,
            "ingredients": self.ingredients,
            "price": self.price,
            "discount": self.discount,
            "discounted_price": self.discounted_price,
            "quantity_in_stock": self.quantity_in_stock,
            "best_seller": self.best_seller,
            "slug": self.slug,
            "image": self.image,
            "brand": self.brand.name,
        }

    class Meta:
        indexes = [
            models.Index(
                fields=["name", "price", "quantity_in_stock", "best_seller", "slug"]
            ),
        ]

    def save(self, *args, **kwargs):
        # Calculate the discounted price
        self.discounted_price = self.price * (100 - self.discount) / 100
        super().save(*args, **kwargs)


class ShoppingCart(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    session_key = models.CharField(max_length=40, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Cart Id: {str(self.id)} - User: {self.user}"

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "user": self.user.id if self.user else None,
            "session_key": self.session_key,
            "created_at": str(self.created_at),
        }


class CartItem(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    cart = models.ForeignKey(ShoppingCart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()

    def __str__(self):
        return f"Item Id: {str(self.id)} - Product: {self.product.name} - Quantity: {self.quantity}"

    def to_dict(self, request=None):
        product_price = (
            self.product.discounted_price
            if self.product.discount != 0
            else self.product.price
        )

        return {
            "id": str(self.id),
            "product_id": str(self.product.id) if self.product else None,
            "product_image": self.product.image if self.product else None,
            "product_slug": self.product.slug if self.product else None,
            "product_name": self.product.name if self.product else None,
            "product_price": product_price,
            "quantity_in_stock": (
                self.product.quantity_in_stock if self.product else None
            ),
            "subtotal": product_price * self.quantity,
            "quantity": self.quantity,
        }


class Order(models.Model):

    STATUS_CHOICES = [
        ("Pending", "Pending"),
        ("Payment Completed", "Payment Completed"),
        ("Delivered", "Delivered"),
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total_amount = models.PositiveIntegerField()
    order_status = models.CharField(
        max_length=255, choices=STATUS_CHOICES, default="Pending"
    )
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Order Id: {str(self.id)} - User: {self.user.email} - Status: {self.order_status}"

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "user": str(self.user.id) if self.user else None,
            "total_amount": str(self.total_amount),
            "order_status": self.order_status,
            "created_at": self.created_at.strftime("%Y-%m-%d %H:%M:%S"),
        }


class OrderItem(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    unit_price = models.PositiveIntegerField()

    def __str__(self):
        return f"Item Id: {str(self.id)} - Product: {self.product.name} - Order: {str(self.order.id)}"

    def to_dict(self, request=None):
        return {
            "id": self.id,
            "order": str(self.order.id),  # Assuming you want to include the order ID
            "product": self.product.to_dict() if self.product else None,
            "quantity": self.quantity,
            "unit_price": self.unit_price,
        }


class Review(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.PositiveIntegerField()
    full_name = models.CharField(max_length=255)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Review Id: {str(self.id)} - Product: {self.product.name} - User: {self.user.email}"

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "product": self.product.to_dict() if self.product else None,
            "user": self.user.email,
            "rating": self.rating,
            "comment": self.comment,
            "full_name": self.full_name,
            "created_at": self.created_at.strftime("%Y-%m-%d"),
        }


class Address(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=255, null=True)
    street_address = models.CharField(max_length=255, null=True)
    town = models.CharField(max_length=255, null=True)
    county = models.CharField(max_length=255, null=True)
    phone_number = models.CharField(max_length=255, null=True)
    additional_details = models.CharField(max_length=500, null=True)

    def __str__(self):
        return f"Address Id: {str(self.id)} - User: {self.user.email}"

    def to_dict(self, request=None):
        return {
            "id": self.id,
            "user": self.user.email if self.user else None,
            "full_name": self.full_name,
            "street_address": self.street_address,
            "town": self.town,
            "county": self.county,
            "phone_number": self.phone_number,
            "additional_details": self.additional_details,
        }


class Towns(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    delivery_fee = models.PositiveIntegerField()

    def to_dict(self, request=None):
        return {
            "id": self.id,
            "name": self.name,
            "delivery_fee": self.delivery_fee,
        }

    def __str__(self):
        return f"Town Id: {str(self.id)}, Name: {self.name}, Delivery Fee: {self.delivery_fee}"


class Wishlist(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="wishlists")
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name="wishlisted_by"
    )
    added_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Wishlist Id: {str(self.id)} - User: {self.user.email} - Product: {self.product.name}"

    def to_dict(self, request=None):
        return {
            "id": str(self.id),
            "product_slug": self.product.slug,
            "product_id": str(self.product.id) if self.product else None,
            "product_image": self.product.image if self.product else None,
            "product_name": self.product.name if self.product else None,
            "product_price": self.product.price if self.product else None,
            "product_brand": self.product.brand.name if self.product else None,
            "product_quantity_in_stock": (
                self.product.quantity_in_stock if self.product else None
            ),
        }


class Coupon(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    code = models.CharField(max_length=50, unique=True)
    discount = models.DecimalField(max_digits=5, decimal_places=2)
    active = models.BooleanField(default=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return f"Coupon(code={self.code}, discount={self.discount}%)"

    def to_dict(self):
        return {
            "id": str(self.id),
            "code": self.code,
            "discount": float(
                self.discount
            ),  # Convert Decimal to float for JSON serialization
            "active": self.active,
            "order_id": self.order.id if self.order else None,
        }


class Maillist(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(null=False, unique=True)
    phone_number = models.CharField(max_length=255, null=True)

    def __str__(self):
        return f"Email: {self.email}, Phone Number: {self.phone_number}"

    def to_dict(self):
        return {
            "id": str(self.id),
            "email": self.email,
            "phone_number": self.phone_number,
        }
