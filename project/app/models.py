from django.db import models

# Create your models here.
class CPURequest(models.Model):
    timestamp = models.DateTimeField(primary_key=True, auto_now_add=True, editable=False)

class MemoryRequest(models.Model):
    timestamp = models.DateTimeField(primary_key=True, auto_now_add=True, editable=False)
