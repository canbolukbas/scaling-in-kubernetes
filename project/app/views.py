from time import sleep

from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView
from prometheus_client import Summary

# Create a metric to track time spent and requests made.
REQUEST_SUMMARY = Summary('http_requests_total', 'Time spent processing request')


class HealthView(APIView):

    def get(self, request, *args, **kwargs):
        return Response(data="", status=HTTP_200_OK)


class CPUView(APIView):

    @REQUEST_SUMMARY.time()
    def get(self, request, *args, **kwargs):
        for i in range(pow(10, 4)):
            pass
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)


class MemoryView(APIView):

    @REQUEST_SUMMARY.time()
    def get(self, request, *args, **kwargs):
        memory_intensive_task = bytearray(37159485)
        sleep(1)
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)


class IOView(APIView):

    def get(self, request, *args, **kwargs):
        # perform an IO intensive task here.
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)
