// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class message_model {
  int? id;
  String message;
  bool is_me;
  String message_time;
  message_model({
    this.id,
    required this.message,
    required this.is_me,
    required this.message_time,
  });

  message_model copyWith({
    int? id,
    bool? is_me,
    String? message,
    String? message_time,
  }) {
    return message_model(
      id: id ?? this.id,
      is_me: is_me ?? this.is_me,
      message: message ?? this.message,
      message_time: message_time ?? this.message_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'is_me': is_me,
      'message': message,
      'message_time': message_time,
    };
  }

  factory message_model.fromMap(Map<String, dynamic> map) {
    return message_model(
      id: map['id'] as int,
      is_me: map['is_me'] as bool,
      message: map['message'] as String,
      message_time: map['message_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory message_model.fromJson(String source) =>
      message_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'message_model(id: $id, is_me: $is_me, message: $message, message_time: $message_time)';
  }

  @override
  bool operator ==(covariant message_model other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.is_me == is_me &&
        other.message == message &&
        other.message_time == message_time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        is_me.hashCode ^
        message.hashCode ^
        message_time.hashCode;
  }
}
