from pyexpat import model
from unicodedata import category
from django.db import models

# Create your models here.

class Actor(models.Model):
    name = models.CharField(max_length=255)

class Soundtracks(models.Model):
    name = models.CharField(max_length=255)
    duration = models.IntegerField(1)

class Director(models.Model):
    name = models.CharField(max_length=250)
    budget = models.IntegerField(1)

class MovieCategories(models.Model):
    name = models.CharField(max_length=250)

class Movie(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=2000)
    ranking = models.IntegerField(1)
    category = models.ForeignKey(MovieCategories, on_delete=models.PROTECT)

    actors = models.ManyToManyField(Actor)
    sountracks = models.ManyToManyField(Soundtracks)
    director = models.ManyToManyField(Director)
    #class Meta:
     #   db_table = 'movies'

