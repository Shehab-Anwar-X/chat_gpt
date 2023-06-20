import 'dart:convert';

import 'choice_message.dart';
import '../../domain/entities/choice_message.dart';
import '../../domain/entities/message_choice.dart';
import 'models_keys/message_choice_keys.dart';

class MessageChoiceSerializable extends MessageChoice {
  const MessageChoiceSerializable({
    required super.message,
    required super.finishReason,
    required super.index,
  });

  MessageChoiceSerializable copyWith({
    ChoiceMessage? message,
    String? finishReason,
    int? index,
  }) {
    return MessageChoiceSerializable(
      message: message ?? super.message,
      finishReason: finishReason ?? super.finishReason,
      index: index ?? super.index,
    );
  }

  factory MessageChoiceSerializable.fromJson(String json) {
    return MessageChoiceSerializable.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory MessageChoiceSerializable.fromMap(Map<String, dynamic> map) {
    return MessageChoiceSerializable(
      message: ChoiceMessageSerializable.fromMap(
        Map<String, dynamic>.from(map[MessageChoiceKeys.message] as Map),
      ),
      finishReason: map[MessageChoiceKeys.finishReason] as String? ?? '',
      index: map[MessageChoiceKeys.index] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MessageChoiceKeys.message:
          ChoiceMessageAdapter.serializableModelFromChoiceMessage(
        model: message,
      ).toMap(),
      MessageChoiceKeys.finishReason: finishReason,
      MessageChoiceKeys.index: index,
    };
  }
}

abstract class MessageChoiceAdapter {
  const MessageChoiceAdapter();

  static MessageChoiceSerializable serializableModelFromMessageChoice({
    required MessageChoice model,
  }) {
    return MessageChoiceSerializable(
      message: model.message,
      finishReason: model.finishReason,
      index: model.index,
    );
  }
}
