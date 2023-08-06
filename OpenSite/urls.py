from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns, static
import OpenBench.urls
from upload.views import image_upload

urlpatterns = [
    path(r'admin/', admin.site.urls),
    path("", image_upload, name="upload"),
    # path(r'', include(OpenBench.urls.urlpatterns)),
]

urlpatterns += staticfiles_urlpatterns()

if bool(settings.DEBUG):
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
