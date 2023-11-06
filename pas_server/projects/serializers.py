from rest_framework import serializers
from .models import ResearchProject, Project

class ResearchProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = ResearchProject
        fields = "__all__"
        
class ProjectSerializer(serializers.ModelSerializer):
    research_project_name = serializers.ReadOnlyField(source="research_project.research_name")
    
    class Meta:
        model = Project
        fields = "__all__"