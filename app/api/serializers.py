from dataclasses import field, fields
import re
from .models import *
from rest_framework import serializers

class MovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = ['id','name', 'description', 'ranking', 'category_id', 'actors', 'director', 'sountracks']
    
    def to_representation(self, instance):
        ret = super().to_representation(instance)
        return {
            'id': ret['id'],
            'name': ret['name'],
            'ranking': ret['ranking'],
            'description': ret['description'],
            'category_id': ret['category_id'],
        }

class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ['id', 'name']

class SoundtracksSerializer(serializers.ModelSerializer):
    class Meta:
        model = Soundtracks
        fields = ['id', 'name','duration']

class DirectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Director
        fields = ['id', 'name' ,'budget']

class MovieCategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieCategories
        fields = ['id','name']