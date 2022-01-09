from django.db import models
from django_prometheus.models import ExportModelOperationsMixin

# Create your models here.
class CPURequest(ExportModelOperationsMixin("cpu-intensive-requests"), models.Model):
    timestamp = models.DateTimeField(primary_key=True, auto_now_add=True, editable=False)

class MemoryRequest(ExportModelOperationsMixin("memory-intensive-requests"), models.Model):
    timestamp = models.DateTimeField(primary_key=True, auto_now_add=True, editable=False)
