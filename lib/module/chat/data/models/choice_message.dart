import 'dart:convert';

import 'models_keys/choice_message_keys.dart';
import '../../domain/entities/choice_message.dart';

class ChoiceMessageSerializable extends ChoiceMessage {
  const ChoiceMessageSerializable({
    required super.role,
    required super.content,
  });

  ChoiceMessageSerializable copyWith({
    String? role,
    String? content,
  }) {
    return ChoiceMessageSerializable(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  factory ChoiceMessageSerializable.fromJson(String json) {
    return ChoiceMessageSerializable.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ChoiceMessageSerializable.fromMap(Map<String, dynamic> json) {
    return ChoiceMessageSerializable(
      role: json[ChoiceMessageKeys.role] as String? ?? '',
      content: json[ChoiceMessageKeys.content] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ChoiceMessageKeys.role: role,
      ChoiceMessageKeys.content: content,
    };
  }
}

abstract class ChoiceMessageAdapter {
  const ChoiceMessageAdapter();

  static ChoiceMessageSerializable serializableModelFromChoiceMessage({
    required ChoiceMessage model,
  }) {
    return ChoiceMessageSerializable(
      role: model.role,
      content: model.content,
    );
  }
}
