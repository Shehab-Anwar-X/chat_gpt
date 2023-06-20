import 'dart:convert';

import '../../domain/entities/message_usage.dart';
import 'models_keys/message_usage_keys.dart';

class MessageUsageSerializable extends MessageUsage {
  const MessageUsageSerializable({
    required super.promptTokens,
    required super.completionTokens,
    required super.totalTokens,
  });

  MessageUsageSerializable copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return MessageUsageSerializable(
      promptTokens: promptTokens ?? super.promptTokens,
      completionTokens: completionTokens ?? super.completionTokens,
      totalTokens: totalTokens ?? super.totalTokens,
    );
  }

  factory MessageUsageSerializable.fromJson(String json) {
    return MessageUsageSerializable.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory MessageUsageSerializable.fromMap(Map<String, dynamic> map) {
    return MessageUsageSerializable(
      promptTokens: map[MessageUsageKeys.promptTokens] as int,
      completionTokens: map[MessageUsageKeys.completionTokens] as int? ??0  ,
      totalTokens: map[MessageUsageKeys.totalTokens] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MessageUsageKeys.promptTokens: promptTokens,
      MessageUsageKeys.completionTokens: completionTokens,
      MessageUsageKeys.totalTokens: totalTokens,
    };
  }
}

abstract class MessageUsageAdapter {
  const MessageUsageAdapter();

  static MessageUsageSerializable serializableModelFromMessageUsage({
    required MessageUsage model,
  }) {
    return MessageUsageSerializable(
      promptTokens: model.promptTokens,
      completionTokens: model.completionTokens,
      totalTokens: model.totalTokens,
    );
  }
}
