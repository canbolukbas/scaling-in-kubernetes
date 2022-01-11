# Scaling In Kubernetes
## Running Django Project
1. Go to `project` folder.
2. Run `python manage.py runserver`.

**Note:** Make migrations if needed by `python manage.py migrate`.

### CPU, Memory and IO Intensive Tasks
- Enter `http://127.0.0.1:8000/app/cpu/` for CPU intensive task.
- Enter `http://127.0.0.1:8000/app/memory/` for memory intensive task.
- Enter `http://127.0.0.1:8000/app/io/` for IO intensive task.

## To-Do's
- Decide on an IO intensive task and add it into `project/app/views.py`.

## Before You Start

When you create a GKE cluster do the following

```
./manifests/metrics-server.sh
```

Then you can follow the scripts under `hpa`, `vpa` and `cluster-autoscaler` folders.

## Testing with JMeter
1- Enter GUI. Change JMX file's path variables. Close GUI.
2- Run below on CLI:
```
jmeter -n -t [jmx file] -l [results file] -e -o [Path to web report folder]
```
