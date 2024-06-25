class AgentSupportFileModel {
  AgentSupportFileModel({
    required this.id,
    required this.fkAgent,
    required this.filePath,
    required this.typeFile,
    required this.addDate,
  });

  final int id;
  final int fkAgent;
  final String filePath;
  final dynamic typeFile;
  final String addDate;

  factory AgentSupportFileModel.fromJson(Map<String, dynamic> json) {
    return AgentSupportFileModel(
      id: json["id"],
      fkAgent: json["fk_agent"],
      filePath: json["file_path"],
      typeFile: json["type_file"],
      addDate: json["add_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fk_agent": fkAgent,
      "file_path": filePath,
      "type_file": typeFile,
      "add_date": addDate,
    };
  }
}
