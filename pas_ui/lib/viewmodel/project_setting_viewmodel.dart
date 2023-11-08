import 'package:flutter/material.dart';
import 'package:pas_ui/model/project_model.dart';
import 'package:pas_ui/model/researchproject_model.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ProjectSettingViewModel extends ChangeNotifier {
  List<Projects> projects = [];
  List<ResearchProjectModel> researchProjects = [];

  int _researchProjectIndex = 0;
  int _projectIndex = 0;

  int get researchProjectIndex => _researchProjectIndex;
  int get projectIndex => _projectIndex;

  set researchProjectIndex(int value) {
    _researchProjectIndex = value;
    notifyListeners();
  }

  set projectIndex(int value) {
    _projectIndex = value;
    notifyListeners();
  }

  Future<void> fetchProjects() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/projects/');

    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final List<dynamic> projectsJson = json.decode(response.body);
        projects = projectsJson.map((json) => Projects.fromJson(json)).toList();
      } else {
        throw 'Server error with status code: ${response.statusCode}';
      }
    } catch (error) {
      rethrow;
    }

    notifyListeners();
  }

  Future<void> fetchResearchProjects() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/research-projects/');

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> researchProjectsJson = json.decode(response.body);
        researchProjects = researchProjectsJson
            .map((json) => ResearchProjectModel.fromJson(json))
            .toList();
      } else {
        throw 'Server error with status code: ${response.statusCode}';
      }
    } catch (error) {
      rethrow;
    }

    notifyListeners(); // 연구 프로젝트 데이터가 변경됐음을 알립니다.
  }

  List<Projects> get filteredProjects {
    if (researchProjects.isNotEmpty && projects.isNotEmpty) {
      final selectedResearchProject = researchProjects[researchProjectIndex];
      return projects
          .where((p) => p.researchProject == selectedResearchProject.researchId)
          .toList();
    }
    return [];
  }
}
