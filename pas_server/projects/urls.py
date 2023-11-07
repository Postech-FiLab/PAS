from django.urls import path
from .views import ResearchProjectListCreateAPIView, ProjectListAPIView, ProjectCreateAPIView

urlpatterns = [
    path('research-projects/', ResearchProjectListCreateAPIView.as_view(), name='research-projects-list-create'),
    path('projects/', ProjectListAPIView.as_view(), name='projects-list'),
    path('create-project/', ProjectCreateAPIView.as_view(), name='create-project'),
]