from datetime import timedelta

from django.utils import timezone

from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView
from prometheus_client import Summary

from app.models import CPURequest
from app.models import MemoryRequest


# Create a metric to track time spent and requests made.
REQUEST_SUMMARY = Summary('http_requests_total', 'Time spent processing request')


class HealthView(APIView):

    def get(self, request, *args, **kwargs):
        return Response(data="", status=HTTP_200_OK)


class CPUView(APIView):

    @REQUEST_SUMMARY.time()
    def get(self, request, *args, **kwargs):
        for i in range(pow(10, 5)):
            pass
        data = {"msg": "Completed"}
        cpu_request = CPURequest()
        cpu_request.save()
        return Response(data=data, status=HTTP_200_OK)


class MemoryView(APIView):

    @REQUEST_SUMMARY.time()
    def get(self, request, *args, **kwargs):
        memory_intensive_task = ['Cloud'*1024 for _ in range(0, 1024)]
        data = {"msg": "Completed"}
        memory_request = MemoryRequest()
        memory_request.save()
        return Response(data=data, status=HTTP_200_OK)


class IOView(APIView):

    def get(self, request, *args, **kwargs):
        # perform an IO intensive task here.
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)
