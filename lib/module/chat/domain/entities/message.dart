import 'package:equatable/equatable.dart';

import 'message_choice.dart';
import 'message_usage.dart';

class Message extends Equatable {
  final String id;
  final String object;
  final int created;
  final String model;
  final MessageUsage usage;
  final List<MessageChoice> choices;

  const Message({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
  });

  @override
  List<Object?> get props {
    return <Object>[
      id,
      object,
      created,
      model,
      usage,
      choices,
    ];
  }
}
