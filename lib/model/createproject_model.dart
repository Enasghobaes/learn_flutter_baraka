// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'handling_model.dart';

class ProjectModel extends ResultModel {
  String projectDescription;
  String projectName;
  String projectStatus;
  ProjectModel({
    required this.projectDescription,
    required this.projectName,
    required this.projectStatus,
  });

  ProjectModel copyWith({
    String? projectDescription,
    String? projectName,
    String? projectStatus,
  }) {
    return ProjectModel(
      projectDescription: projectDescription ?? this.projectDescription,
      projectName: projectName ?? this.projectName,
      projectStatus: projectStatus ?? this.projectStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectName': projectName,
      'projectDescription': projectDescription,
      'projectStatus': projectStatus,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectDescription: map['projectDescription'] as String,
      projectName: map['projectName'] as String,
      projectStatus: map['projectStatus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProjectModel(projectDescription: $projectDescription, projectName: $projectName, projectStatus: $projectStatus)';

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.projectDescription == projectDescription &&
        other.projectName == projectName &&
        other.projectStatus == projectStatus;
  }

  @override
  int get hashCode =>
      projectDescription.hashCode ^
      projectName.hashCode ^
      projectStatus.hashCode;
}
