import '../data_sources/base/base_data_source.dart';
import '../models/message.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/message_creation_data.dart';
import '../../domain/repository/chat_repository.dart';

class ChatRepository extends BaseChatRepository {
  const ChatRepository({required BaseChatDataSource dataSource})
      : _dataSource = dataSource;

  final BaseChatDataSource _dataSource;

  @override
  Future<Message> sendMessage({
    required MessageCreationData creationData,
  }) async {
    final result = await _dataSource.sendMessage(creationData: creationData);
    return MessageSerializable.fromMap(result);
  }
}
