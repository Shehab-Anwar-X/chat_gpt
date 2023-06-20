import 'package:equatable/equatable.dart';

class MessageCreationData extends Equatable {
  final String message;

  const MessageCreationData({
    required this.message,
  });

  @override
  List<Object?> get props {
    return <Object>[
      message,
    ];
  }
}
