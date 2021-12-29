from django.shortcuts import render

from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView


class HealthView(APIView):

    def get(self, request, *args, **kwargs):
        return Response(data="", status=HTTP_200_OK)


class CPUView(APIView):

    def get(self, request, *args, **kwargs):
        for i in range(pow(10, 5)):
            pass
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)


class MemoryView(APIView):

    def get(self, request, *args, **kwargs):
        memory_intensive_task = ['Cloud'*1024 for _ in range(0, 1024)]
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)


class IOView(APIView):

    def get(self, request, *args, **kwargs):
        # perform an IO intensive task here.
        data = {"msg": "Completed"}
        return Response(data=data, status=HTTP_200_OK)
