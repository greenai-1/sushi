"""
URL configuration for DjangoBLOG project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from blog_post.views import home, home_template, showpost
from line_bot.views import callback, pushMsg
from django.conf import settings  
from django.conf.urls.static import static  

#127.0.0.1:8000
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_template),
    path('demo1', home),
    path('post/<slug:slug>', showpost),
    path('line/', callback),
    path('line/push/<str:uid>', pushMsg),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  