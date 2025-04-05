abstract class ChatRepository {
  /// Sends a message to the AI and returns the response
  Future<String> sendMessageToAI(String questionId, {String? clientId});
}
