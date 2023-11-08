class Projects {
  final int projectId;
  final String researchProjectName;
  final String modelName;
  final String algorithmType;
  final int researchProject;

  Projects({
    required this.projectId,
    required this.researchProjectName,
    required this.modelName,
    required this.algorithmType,
    required this.researchProject,
  });

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      projectId: json['project_id'],
      researchProjectName: json['research_project_name'],
      modelName: json['model_name'],
      algorithmType: json['algorithm_type'],
      researchProject: json['research_project'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'research_project_name': researchProjectName,
      'model_name': modelName,
      'algorithm_type': algorithmType,
      'research_project': researchProject,
    };
  }
}
