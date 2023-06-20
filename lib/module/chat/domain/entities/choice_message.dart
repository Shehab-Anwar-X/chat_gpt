import 'package:equatable/equatable.dart';

class ChoiceMessage extends Equatable {
  final String role;
  final String content;

  const ChoiceMessage({
    required this.role,
    required this.content,
  });

  @override
  List<Object?> get props {
    return [
      role,
      content,
    ];
  }
}
