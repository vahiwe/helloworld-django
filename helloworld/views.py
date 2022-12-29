from django.http import HttpResponse
import os

def index(request):
    # Get env variable NAME
    return HttpResponse("Hello, world! " + os.getenv('NAME', 'No name set'))
