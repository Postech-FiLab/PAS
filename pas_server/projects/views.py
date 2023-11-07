from rest_framework import generics
from .models import ResearchProject, Project
from .serializers import ResearchProjectSerializer, ProjectSerializer

class ResearchProjectListCreateAPIView(generics.ListCreateAPIView):
    queryset = ResearchProject.objects.all()
    serializer_class = ResearchProjectSerializer
    
class ProjectListAPIView(generics.ListAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer

class ProjectCreateAPIView(generics.CreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer