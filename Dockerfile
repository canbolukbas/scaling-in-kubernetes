 # Dockerfile

FROM python:3.9-slim

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
COPY requirements.txt /opt/app/
COPY project/ /opt/app/project/
WORKDIR /opt/app
RUN pip install -r requirements.txt --cache-dir /opt/app/pip_cache

# start server
EXPOSE 8080
CMD ["python", "./project/manage.py", "runserver", "0:8080"]