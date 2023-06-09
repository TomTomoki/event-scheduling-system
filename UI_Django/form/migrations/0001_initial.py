# Generated by Django 4.1 on 2023-03-23 00:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Building',
            fields=[
                ('buildingid', models.IntegerField(primary_key=True, serialize=False)),
                ('buildingname', models.CharField(max_length=10)),
                ('buildingaddress', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'building',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('courseid', models.IntegerField(primary_key=True, serialize=False)),
                ('coursename', models.CharField(max_length=50)),
                ('academicyear', models.DecimalField(decimal_places=0, max_digits=4)),
                ('academicsemester', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'course',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('departmentid', models.IntegerField(primary_key=True, serialize=False)),
                ('departmentname', models.CharField(blank=True, max_length=20, null=True)),
            ],
            options={
                'db_table': 'department',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('eventid', models.IntegerField(primary_key=True, serialize=False)),
                ('eventname', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'event',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Faculty',
            fields=[
                ('facultyid', models.IntegerField(primary_key=True, serialize=False)),
                ('facultyfirstname', models.CharField(max_length=20)),
                ('facultylastname', models.CharField(max_length=20)),
                ('facultyemail', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'faculty',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('roomid', models.IntegerField(primary_key=True, serialize=False)),
                ('roomname', models.CharField(max_length=15)),
                ('capacity', models.IntegerField()),
            ],
            options={
                'db_table': 'room',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Roomassignment',
            fields=[
                ('roomassignmentid', models.IntegerField(primary_key=True, serialize=False)),
                ('expectedparticipant', models.IntegerField()),
                ('detail', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'roomassignment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Schedule',
            fields=[
                ('scheduleid', models.IntegerField(primary_key=True, serialize=False)),
                ('scheduleddate', models.DateField(blank=True, null=True)),
                ('starttime', models.TimeField()),
                ('endtime', models.TimeField()),
                ('recurring', models.BooleanField()),
                ('dayofweek', models.TextField(blank=True, null=True)),
                ('recurringstartdate', models.DateField(blank=True, null=True)),
                ('recurringenddate', models.DateField(blank=True, null=True)),
            ],
            options={
                'db_table': 'schedule',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Staff',
            fields=[
                ('staffid', models.IntegerField(primary_key=True, serialize=False)),
                ('stafffirstname', models.CharField(max_length=20)),
                ('stafflastname', models.CharField(max_length=20)),
                ('staffemail', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'staff',
                'managed': False,
            },
        ),
    ]
