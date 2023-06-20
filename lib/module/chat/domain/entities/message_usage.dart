import 'package:equatable/equatable.dart';

class MessageUsage extends Equatable {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  const MessageUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  @override
  List<Object?> get props {
    return [
      promptTokens,
      completionTokens,
      totalTokens,
    ];
  }
}
