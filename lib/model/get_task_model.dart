// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_albaraka_statemangment/model/handling_model.dart';

List<get_task_mddel> getTasktMoselFromJson(String str) =>
    List<get_task_mddel>.from(
        json.decode(str).map((x) => get_task_mddel.fromJson(x)));

String getTasktMoselToJson(List<get_task_mddel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class get_task_mddel extends ResultModel {
  int taskId;
  String taskDescription;
  String taskStatus;
  bool hasBugs;
  List<dynamic> bugs;
  int taskProject;
  DateTime taskCreateDate;
  dynamic taskUpdateDate;
  int taskCreatedBy;
  dynamic taskUpdatedBy;
  get_task_mddel({
    required this.taskId,
    required this.taskDescription,
    required this.taskStatus,
    required this.hasBugs,
    required this.bugs,
    required this.taskProject,
    required this.taskCreateDate,
    required this.taskUpdateDate,
    required this.taskCreatedBy,
    required this.taskUpdatedBy,
  });

  factory get_task_mddel.fromJson(Map<String, dynamic> json) => get_task_mddel(
        taskId: json["taskId"],
        taskDescription: json["taskDescription"],
        taskStatus: json["taskStatus"],
        hasBugs: json["hasBugs"],
        bugs: List<dynamic>.from(json["bugs"].map((x) => x)),
        taskProject: json["taskProject"],
        taskCreateDate: DateTime.parse(json["taskCreateDate"]),
        taskUpdateDate: json["taskUpdateDate"],
        taskCreatedBy: json["taskCreatedBy"],
        taskUpdatedBy: json["taskUpdatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "taskDescription": taskDescription,
        "taskStatus": taskStatus,
        "hasBugs": hasBugs,
        "bugs": List<dynamic>.from(bugs.map((x) => x)),
        "taskProject": taskProject,
        "taskCreateDate": taskCreateDate.toIso8601String(),
        "taskUpdateDate": taskUpdateDate,
        "taskCreatedBy": taskCreatedBy,
        "taskUpdatedBy": taskUpdatedBy,
      };
}
