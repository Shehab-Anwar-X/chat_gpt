import 'dart:convert';

import 'models_keys/message_creation_data_keys.dart';
import '../../domain/entities/message_creation_data.dart';

class MessageCreationDataSerializable extends MessageCreationData {
  const MessageCreationDataSerializable({
    required super.message,
  });

  MessageCreationDataSerializable copyWith({
    String? message,
  }) {
    return MessageCreationDataSerializable(
      message: message ?? super.message,
    );
  }

  factory MessageCreationDataSerializable.fromJson(String json) {
    return MessageCreationDataSerializable.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory MessageCreationDataSerializable.fromMap(Map<String, dynamic> map) {
    return MessageCreationDataSerializable(
      message: map[MessageCreationDataKeys.message] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MessageCreationDataKeys.message: message,
    };
  }
}

abstract class MessageCreationDataAdapter {
  const MessageCreationDataAdapter();

  MessageCreationDataSerializable serializableModelFromMessageCreationData({
    required MessageCreationData model,
  }) {
    return MessageCreationDataSerializable(
      message: model.message,
    );
  }
}
