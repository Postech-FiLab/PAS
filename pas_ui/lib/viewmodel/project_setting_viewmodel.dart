import 'package:flutter/material.dart';
import 'package:pas_ui/model/project_model.dart';
import 'package:pas_ui/model/researchproject_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectViewModel extends ChangeNotifier {
  List<Projects> projects = [];
  List<ResearchProjectModel> researchProjects = [];

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
}
