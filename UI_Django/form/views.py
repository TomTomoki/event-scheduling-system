from django.shortcuts import render
from django.contrib import messages
from django.db import transaction

from .models import Room, Course, Event, Schedule


def index(request):
    if request.method == 'GET':
        all_rooms = Room.objects.all()
        all_courses = Course.objects.all()
        all_events = Event.objects.all()
        all_schedules = Schedule.objects.all()
        context = {'all_rooms': all_rooms,
                'all_courses': all_courses,
                'all_events': all_events,
                'all_schedules': all_schedules}
        return render(request, 'form/index.html', context)
    
    elif request.method == 'POST':
        print("=== POST ===")
        print(request.POST)
        print("============")

        try:
            with transaction.atomic():
                # Perform insertions to Roomassignment & Schedule


                messages.success(request, 'The specified course/event was successfully scheduled!')
        except:
                messages.error(request, 'Error Occured. The course/event was NOT scheduled!')
        
        finally:
            all_rooms = Room.objects.all()
            all_courses = Course.objects.all()
            all_events = Event.objects.all()
            all_schedules = Schedule.objects.all()
            context = {'all_rooms': all_rooms,
                    'all_courses': all_courses,
                    'all_events': all_events,
                    'all_schedules': all_schedules}
            return render(request, 'form/index.html', context)


def detail(request, schedule_id):
    schedule = Schedule.objects.get(pk=schedule_id)
    context = {'schedule': schedule}
    return render(request, 'form/detail.html', context)