import '../entities/message.dart';
import '../entities/message_creation_data.dart';

abstract class BaseChatRepository {
  const BaseChatRepository();

  Future<Message> sendMessage({
    required MessageCreationData creationData,
  });
}
