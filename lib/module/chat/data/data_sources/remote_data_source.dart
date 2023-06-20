import 'dart:convert';

import '../../domain/entities/message_creation_data.dart';
import 'base/base_data_source.dart';
import 'package:http/http.dart' as http;

const _apiUrl = 'https://api.openai.com/v1/chat/completions';
const _apiKey = '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';

// ToDo: You must inject http client and refactor the code.
// It's a simple example until refactor the code.
class ChatRemoteDataSource extends BaseChatDataSource {
  const ChatRemoteDataSource();

  @override
  Future<Map<String, dynamic>> sendMessage({
    required MessageCreationData creationData,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": creationData.message}
          ]
        }),
      );

      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(jsonDecode(response.body) as Map);
      } else {
        throw 'Error: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
