// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class add_task_model {
  String taskDescription;
  String taskStatus;
  int projectId;
  add_task_model({
    required this.taskDescription,
    required this.taskStatus,
    required this.projectId,
  });

  add_task_model copyWith({
    String? taskDescription,
    String? taskStatus,
    int? projectId,
  }) {
    return add_task_model(
      taskDescription: taskDescription ?? this.taskDescription,
      taskStatus: taskStatus ?? this.taskStatus,
      projectId: projectId ?? this.projectId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'projectId': projectId,
    };
  }

  factory add_task_model.fromMap(Map<String, dynamic> map) {
    return add_task_model(
      taskDescription: map['taskDescription'] as String,
      taskStatus: map['taskStatus'] as String,
      projectId: map['projectId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory add_task_model.fromJson(String source) =>
      add_task_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'add_task_model(taskDescription: $taskDescription, taskStatus: $taskStatus, projectId: $projectId)';

  @override
  bool operator ==(covariant add_task_model other) {
    if (identical(this, other)) return true;

    return other.taskDescription == taskDescription &&
        other.taskStatus == taskStatus &&
        other.projectId == projectId;
  }

  @override
  int get hashCode =>
      taskDescription.hashCode ^ taskStatus.hashCode ^ projectId.hashCode;
}
