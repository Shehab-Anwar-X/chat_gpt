import '../../../domain/entities/message_creation_data.dart';

abstract class BaseChatDataSource {
  const BaseChatDataSource();

  Future<Map<String, dynamic>> sendMessage({
    required MessageCreationData creationData,
  });
}
