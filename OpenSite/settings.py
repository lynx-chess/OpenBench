"""
Django settings for OpenSite project.

Generated by 'django-admin startproject' using Django 2.0.6.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/
# SECURITY WARNING: keep the secret key used in production secret!
# SECURITY WARNING: don't run with debug turned on in production!
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY', '<N0tA$3c73t>')
DEBUG = bool(os.environ.get('DJANGO_DEBUG', default=0))

ALLOWED_HOSTS = ['*']

HTML_MINIFY   = True
APPEND_SLASH  = True

DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'

# Application definition

SETTINGS_DIR  = os.path.dirname(__file__)
PROJECT_PATH  = os.path.join(SETTINGS_DIR, os.pardir)
PROJECT_PATH  = os.path.abspath(PROJECT_PATH)
TEMPLATE_PATH = os.path.join(PROJECT_PATH, 'Templates')

MEDIA_URL  = '/Media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'mediafiles')

INSTALLED_APPS = [
    'OpenBench',
    'OpenBench.templatetags',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'upload',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'htmlmin.middleware.HtmlMinifyMiddleware',
    'htmlmin.middleware.MarkRequestMiddleware',
]

ROOT_URLCONF = 'OpenSite.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATE_PATH, ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',
            ],
        },
    },
]

WSGI_APPLICATION = 'OpenSite.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(*[BASE_DIR, 'db', 'lynx-test-ob.sqlite3']),
        'NAME': os.path.join(*[BASE_DIR, 'db', os.environ.get('DJANGO_DB_NAME', default='lynx-default-ob.sqlite3')]),
    }
}

## Azure Cosmos DB configuration
# DATABASES = {
#     'default': {
#         'ENGINE': 'djongo',
#         'NAME': os.environ.get('DJANGO_DB_NAME', ''),
#         'CLIENT': {
#            'host': os.environ.get('DJANGO_DB_HOST', ''),
#            'port': 10255,
#            'username': os.environ.get('DJANGO_DB_USER', ''),
#            'password': os.environ.get('DJANGO_DB_PASSWORD', ''),
#            'authMechanism': 'SCRAM-SHA-1',
#            'ssl': True,
#            'tlsAllowInvalidCertificates': True,
#            'retryWrites': False
#         }
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/2.0/ref/settings/#auth-password-validators

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
# https://docs.djangoproject.com/en/2.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Europe/Madrid'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

# Security

SECURE_SSL_REDIRECT = False
SESSION_COOKIE_SECURE = bool(os.environ.get('DJANGO_SESSION_COOKIE_SECURE', default=0))
CSRF_COOKIE_SECURE = bool(os.environ.get('DJANGO_CSRF_COOKIE_SECURE', default=0))
CSRF_TRUSTED_ORIGINS = ["http://localhost:1337"]