from main import views
from django.urls import path

urlpatterns = [
    path('', views.index, name='index'),
    path('main/start', views.start, name='start'),

    
]
