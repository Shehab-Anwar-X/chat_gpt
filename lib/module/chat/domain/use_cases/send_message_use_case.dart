import '../entities/message_creation_data.dart';
import '../repository/chat_repository.dart';
import '../entities/message.dart';

class SendMessageUseCase {
  final BaseChatRepository _repository;

  const SendMessageUseCase({required BaseChatRepository repository})
      : _repository = repository;

  Future<Message> call({required MessageCreationData creationData}) {
    return _repository.sendMessage(
      creationData: creationData,
    );
  }
}
