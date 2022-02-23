from django.shortcuts import render
from .models import *
from rest_framework import viewsets
from rest_framework import permissions
from .serializers import *
from rest_framework import filters
#from api.serializers import MovieSerializer, MovieCategoriesSerializer

# Create your views here.
from django.http import HttpResponse


#def index(request):
#    return HttpResponse("Hello")

class MovieViewSet(viewsets.ModelViewSet):
    search_fields = ['name', 'description']
    filter_backends = (filters.SearchFilter,)
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    #permission_classes = [permissions.IsAuthenticated]

class MovieCategoriesViewSet(viewsets.ModelViewSet):
    queryset = MovieCategories.objects.all()
    serializer_class = MovieCategoriesSerializer

class ActorViewSet(viewsets.ModelViewSet):
    queryset = Actor.objects.all()
    serializer_class = ActorSerializer

class SoundtracksViewSet(viewsets.ModelViewSet):
    queryset = Soundtracks.objects.all()
    serializer_class = SoundtracksSerializer

class DirectorViewSet(viewsets.ModelViewSet):
    queryset = Director.objects.all()
    serializer_class = DirectorSerializer


