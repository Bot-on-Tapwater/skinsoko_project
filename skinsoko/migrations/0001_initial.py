# Generated by Django 5.0.6 on 2024-06-09 07:40

import django.db.models.deletion
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('brand_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='MainCategory',
            fields=[
                ('main_category_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('order_id', models.AutoField(primary_key=True, serialize=False)),
                ('total_amount', models.PositiveIntegerField()),
                ('order_status', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='ShoppingCart',
            fields=[
                ('cart_id', models.AutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Towns',
            fields=[
                ('town_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('delivery_fee', models.PositiveIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=100, unique=True)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=100)),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('verification_token', models.UUIDField(blank=True, default=uuid.uuid4, null=True)),
                ('password_reset_token', models.UUIDField(blank=True, null=True)),
                ('is_verified', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('product_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('price', models.PositiveIntegerField()),
                ('discount', models.PositiveIntegerField()),
                ('quantity_in_stock', models.PositiveIntegerField()),
                ('best_seller', models.BooleanField(default=False)),
                ('image', models.TextField()),
                ('brand', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.brand')),
            ],
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('item_id', models.AutoField(primary_key=True, serialize=False)),
                ('quantity', models.PositiveIntegerField()),
                ('unit_price', models.PositiveIntegerField()),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.order')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.product')),
            ],
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('item_id', models.AutoField(primary_key=True, serialize=False)),
                ('quantity', models.PositiveIntegerField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.product')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.shoppingcart')),
            ],
        ),
        migrations.CreateModel(
            name='SubCategory',
            fields=[
                ('sub_category_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('main_category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='subcategories', to='skinsoko.maincategory')),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='subcategories',
            field=models.ManyToManyField(to='skinsoko.subcategory'),
        ),
        migrations.AddField(
            model_name='shoppingcart',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.user'),
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('review_id', models.AutoField(primary_key=True, serialize=False)),
                ('rating', models.PositiveIntegerField()),
                ('comment', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.user')),
            ],
        ),
        migrations.AddField(
            model_name='order',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.user'),
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('address_id', models.AutoField(primary_key=True, serialize=False)),
                ('street_address', models.CharField(max_length=255, null=True)),
                ('town', models.CharField(max_length=255, null=True)),
                ('county', models.CharField(max_length=255, null=True)),
                ('phone_number', models.CharField(max_length=255, null=True)),
                ('additional_details', models.TextField(null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='skinsoko.user')),
            ],
        ),
    ]