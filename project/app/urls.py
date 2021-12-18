from django.urls import path

from app.views import CPUView, MemoryView, IOView

urlpatterns = [
    path('cpu/', CPUView.as_view()),
    path('memory/', MemoryView.as_view()),
    path('io/', IOView.as_view()),
]