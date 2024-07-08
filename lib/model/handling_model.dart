// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'createproject_model.dart';

class ResultModel {}

class ErrorModel extends ResultModel {}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class DataSuccess extends ResultModel {
  // ProjectModel projectModel;
  // DataSuccess({required this.projectModel})
}

class ListOf<T> extends ResultModel {
  List<T> listOfData;
  ListOf({
    required this.listOfData,
  });
}
