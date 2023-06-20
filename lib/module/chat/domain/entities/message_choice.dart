import 'package:equatable/equatable.dart';

import 'choice_message.dart';

class MessageChoice extends Equatable {
  final ChoiceMessage message;
  final String finishReason;
  final int index;

  const MessageChoice({
    required this.message,
    required this.finishReason,
    required this.index,
  });

  @override
  List<Object?> get props {
    return [
      message,
      finishReason,
      index,
    ];
  }
}
