"""
Django settings for django_apps project.

Generated by 'django-admin startproject' using Django 3.2.19.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""

from pathlib import Path
import os
from django.utils.log import DEFAULT_LOGGING
from dotenv import load_dotenv, find_dotenv

# Load environment definition file
ENV_FILE = find_dotenv()
if ENV_FILE:
    load_dotenv(ENV_FILE)

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-j0ob=w%zc5h7(fo(bbkk@3=thmbu&ek9rlepjj=##y^hjllrtc'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
# DEBUG = False


# ALLOWED_HOSTS = ["0.0.0.0", "exceed.botontapwater.tech", "exceed-shop.netlify.app"]
ALLOWED_HOSTS = ["*", "shop.skinsoko.com"]


# Application definition

INSTALLED_APPS = [
    'whitenoise.runserver_nostatic',
    'skinsoko.apps.SkinsokoConfig',
    'eridosolutions.apps.EridosolutionsConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # ADDED THIS
    'corsheaders',
    # Social Auth
    'social_django',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    # whitenoise
    "whitenoise.middleware.WhiteNoiseMiddleware",
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'skinsoko.middleware.EnsureCSRFMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # ADDED THIS
    'corsheaders.middleware.CorsMiddleware',
    # Social Auth
    'social_django.middleware.SocialAuthExceptionMiddleware',
    'django.middleware.gzip.GZipMiddleware',

]

# CORS_ORIGIN_ALLOW_ALL = True
# ADDED THIS
CORS_ALLOW_CREDENTIALS = True
CORS_ORIGIN_WHITELIST = (
    'https://exceed-shop.netlify.app',
    'http://127.0.0.1:3000',
    'http://localhost:3000',
    'https://chic-hotteok-9cd9bd.netlify.app',
    'https://skinsoko.com',
    'https://www.skinsoko.com',
    'http://skinsoko.com',
    'http://www.skinsoko.com',
)

ROOT_URLCONF = 'django_apps.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                # Social Auth
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
            ],
        },
    },
]

WSGI_APPLICATION = 'django_apps.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DATABASE'),
        'USER': os.environ.get('DATABASE_USERNAME'),
        'PASSWORD': os.environ.get('PASSWORD'),
        'HOST': os.environ.get('HOST'),
        'PORT': os.environ.get('PORT'),
    }
}


# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Africa/Nairobi'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / "staticfiles"

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Load Auth0 application settings into memory
AUTH0_DOMAIN = os.environ.get("AUTH0_DOMAIN")
AUTH0_CLIENT_ID = os.environ.get("AUTH0_CLIENT_ID")
AUTH0_CLIENT_SECRET = os.environ.get("AUTH0_CLIENT_SECRET")

# Selcom Credentials
SELCOM_API_KEY = os.environ.get("SELCOM_API_KEY")
SELCOM_API_SECRET = os.environ.get("SELCOM_API_SECRET")
SELCOM_BASE_URL = os.environ.get("SELCOM_BASE_URL")
SELCOM_VENDOR_ID = os.environ.get("SELCOM_VENDOR_ID")

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

SESSION_COOKIE_SECURE = True
SESSION_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_DOMAIN = '.skinsoko.com'

CSRF_COOKIE_SAMESITE = 'None'
CSRF_COOKIE_SECURE = True
CSRF_COOKIE_DOMAIN = '.skinsoko.com'

# CSRF_USE_SESSIONS = True

CSRF_TRUSTED_ORIGINS = ['https://shop.skinsoko.com', 'http://shop.skinsoko.com', 'https://skinsoko.com', 'http://skinsoko.com', 'http://localhost:3000', 'https://localhost:3000']

# CSRF_TRUSTED_ORIGINS = ["http://localhost:3000"]
# LOGIN_REDIRECT_URL = ''

# Email & SMTP

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_HOST = '74.125.142.108'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
# EMAIL_HOST_USER = 'brandonmunda1@gmail.com'
# EMAIL_HOST_PASSWORD = 'wfte hrcq cuua gqag'
EMAIL_HOST_USER = 'support@skinsoko.com'
EMAIL_HOST_PASSWORD = 'zazt gxya ovdc disp'

# EMAIL_APP_PASSWORDS = {
#     'support@skinsoko.com': 'zazt gxya ovdc disp',
#     # Add more email addresses and corresponding app passwords as needed
# }

# DEFAULT_FROM_EMAIL = 'support@skinsoko.com'

# Social Auth
AUTHENTICATION_BACKENDS = (
    'social_core.backends.google.GoogleOAuth2',
    'social_core.backends.twitter.TwitterOAuth',
    'social_core.backends.facebook.FacebookOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

LOGIN_URL = 'login'
LOGOUT_URL = 'logout'

SOCIAL_AUTH_FACEBOOK_KEY = os.environ.get("SOCIAL_AUTH_FACEBOOK_KEY")  
SOCIAL_AUTH_FACEBOOK_SECRET = os.environ.get("SOCIAL_AUTH_FACEBOOK_SECRET") 

SOCIAL_AUTH_LOGIN_REDIRECT_URL = '/'
SOCIAL_AUTH_LOGIN_ERROR_URL = '/login-error/'
SOCIAL_AUTH_LOGIN_URL = '/login/'
SOCIAL_AUTH_LOGOUT_URL = '/logout/'
SOCIAL_AUTH_REDIRECT_IS_HTTPS = True  # If your site uses HTTPS

SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.auth_allowed',
    'social_core.pipeline.social_auth.social_user',
    'social_core.pipeline.user.get_username',
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'social_core.pipeline.social_auth.load_extra_data',
    'social_core.pipeline.user.user_details',
)

SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = os.environ.get('SOCIAL_AUTH_GOOGLE_OAUTH2_KEY')
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = os.environ.get('SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET')
SOCIAL_AUTH_GOOGLE_OAUTH2_REDIRECT_URI = 'https://skinsoko.botontapwater.tech/skinsoko/auth/complete/google-oauth2/'

# Pesapal
PESAPAL_CONSUMER_KEY=os.environ.get('PESAPAL_CONSUMER_KEY')
PESAPAL_CONSUMER_SECRET=os.environ.get('PESAPAL_CONSUMER_SECRET')
PESAPAL_IPN_ID=os.environ.get('PESAPAL_IPN_ID')

# Response compression
GZIP_MIN_LENGTH = 500

