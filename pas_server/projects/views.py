from rest_framework import generics
from .models import ResearchProject, Project
from .serializers import ResearchProjectSerializer, ProjectSerializer

class ResearchProjectListCreateAPIView(generics.ListCreateAPIView):
    queryset = ResearchProject.objects.all()
    serializer_class = ResearchProjectSerializer
    
class ProjectListAPIView(generics.ListAPIView):
    serializer_class = ProjectSerializer
    
    def get_queryset(self):
        research_project_id = self.request.query_params.get('research_project')
        return Project.objects.filter(research_project_id = research_project_id)
    
class ResearchProjectCreateAPIView(generics.CreateAPIView):
    queryset = ResearchProject.objects.all()
    serializer_class = ResearchProjectSerializer

class ProjectCreateAPIView(generics.CreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer