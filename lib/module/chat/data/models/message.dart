import 'dart:convert';

import 'message_choice.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/message_choice.dart';
import '../../domain/entities/message_usage.dart';
import 'message_usage.dart';
import 'models_keys/message_keys.dart';

class MessageSerializable extends Message {
  const MessageSerializable({
    required super.id,
    required super.object,
    required super.created,
    required super.model,
    required super.usage,
    required super.choices,
  });

  MessageSerializable copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    MessageUsage? usage,
    List<MessageChoice>? choices,
  }) {
    return MessageSerializable(
      id: id ?? super.id,
      object: object ?? super.object,
      created: created ?? super.created,
      model: model ?? super.model,
      usage: usage ?? super.usage,
      choices: choices ?? super.choices,
    );
  }

  factory MessageSerializable.fromJson(String json) {
    return MessageSerializable.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory MessageSerializable.fromMap(Map<String, dynamic> map) {
    return MessageSerializable(
      id: map[MessageKeys.id] as String,
      object: map[MessageKeys.object] as String,
      created: map[MessageKeys.created] as int,
      model: map[MessageKeys.model] as String,
      usage: MessageUsageSerializable.fromMap(
        Map<String, dynamic>.from(map[MessageKeys.usage] as Map),
      ),
      choices: List<MessageChoiceSerializable>.from(
        (List<Map<String, dynamic>>.from(map[MessageKeys.choices] as List)).map(
          (x) => MessageChoiceSerializable.fromMap(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MessageKeys.id: id,
      MessageKeys.object: object,
      MessageKeys.created: created,
      MessageKeys.model: model,
      MessageKeys.usage: MessageUsageAdapter.serializableModelFromMessageUsage(
        model: usage,
      ).toMap(),
      MessageKeys.choices: List<Map>.from(
        choices.map<Map<String, dynamic>>((x) {
          return MessageChoiceAdapter.serializableModelFromMessageChoice(
                  model: x)
              .toMap();
        }),
      ),
    };
  }
}

abstract class MessageAdapter {
  const MessageAdapter();

  static MessageSerializable serializableModelFromChoiceMessage({
    required Message model,
  }) {
    return MessageSerializable(
      id: model.id,
      object: model.object,
      created: model.created,
      model: model.model,
      usage: model.usage,
      choices: model.choices,
    );
  }
}
