from django.shortcuts import render, redirect
from django.contrib.auth.tokens import default_token_generator
from django.http import JsonResponse, QueryDict
from django.views.decorators.http import require_http_methods
from django.core.mail import send_mail
from django.contrib.auth.hashers import make_password, check_password
from django.urls import reverse
import uuid
from django.contrib.sessions.models import Session
from functools import wraps
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
import datetime

# Create your views here.
def index(request):
    return JsonResponse({"message": "skin soko is live"})