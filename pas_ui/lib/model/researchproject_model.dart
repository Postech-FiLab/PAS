class ResearchProjectModel {
  final int researchId;
  final String researchName;
  final String dbHost;
  final int dbPort;

  ResearchProjectModel({
    required this.researchId,
    required this.researchName,
    required this.dbHost,
    required this.dbPort,
  });

  // JSON에서 모델 객체로 변환하는 팩토리 생성자.
  factory ResearchProjectModel.fromJson(Map<String, dynamic> json) {
    return ResearchProjectModel(
      researchId: json['research_id'],
      researchName: json['research_name'],
      dbHost: json['db_host'],
      dbPort: json['db_port'],
    );
  }

  // 모델 객체에서 JSON으로 변환하는 메서드.
  Map<String, dynamic> toJson() {
    return {
      'research_id': researchId,
      'research_name': researchName,
      'db_host': dbHost,
      'db_port': dbPort,
    };
  }
}
