# Generated by Django 4.0 on 2022-01-09 10:59

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CPURequest',
            fields=[
                ('timestamp', models.DateTimeField(auto_now_add=True, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='MemoryRequest',
            fields=[
                ('timestamp', models.DateTimeField(auto_now_add=True, primary_key=True, serialize=False)),
            ],
        ),
    ]
