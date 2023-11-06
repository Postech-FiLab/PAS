from django.db import models

class ResearchProject(models.Model):
    research_id = models.AutoField(primary_key=True)
    research_name = models.CharField(max_length=255)
    db_host = models.CharField(max_length=255)
    db_port = models.IntegerField()
    
    def __str__(self) -> str:
        return self.research_name
    
class Project(models.Model):
    project_id = models.AutoField(primary_key=True)
    research_project = models.ForeignKey(ResearchProject, related_name='projects', on_delete=models.CASCADE)
    model_name = models.CharField(max_length=255)
    algorithm_type = models.CharField(max_length=255)
    
    def __str__(self) -> str:
        return f"{self.model_name} - {self.algorithm_type}"