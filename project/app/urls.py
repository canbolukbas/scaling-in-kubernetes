from django.urls import path

from app.views import CPUView, MemoryView, IOView, HealthView, CPURequestView, MemoryRequestView

urlpatterns = [
    path('cpu/', CPUView.as_view()),
    path('cpu-requests/', CPURequestView.as_view()),
    path('memory/', MemoryView.as_view()),
    path('memory-requests/', MemoryRequestView.as_view()),
    path('io/', IOView.as_view()),
    path('health/', HealthView.as_view()),
]