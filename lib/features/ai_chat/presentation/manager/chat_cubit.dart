import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/chat_message_model.dart';
import '../../domain/repositories/chat_repository.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;
  String? _clientId;

  ChatCubit(this._chatRepository, {String? clientId})
      : super(const ChatState()) {
    _clientId = clientId;
  }

  void setClientId(String clientId) {
    _clientId = clientId;
  }

  void toggleChatWindow() {
    emit(state.copyWith(showChatWindow: !state.showChatWindow));
  }

  void resetChat() {
    emit(const ChatState());
  }

  void addUserMessage(String message) {
    final newMessage = ChatMessage(
      message: message,
      type: MessageType.user,
      clientId: _clientId,
    );

    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(newMessage);

    emit(state.copyWith(
      messages: updatedMessages,
      status: ChatStatus.success,
    ));
  }

  void addPredefinedQuestion(PredefinedQuestion question) {
    // Add the user's question to the chat
    final userMessage = ChatMessage(
      message: question.question,
      type: MessageType.predefined,
      clientId: _clientId,
    );

    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(userMessage);

    // Add a loading message from the bot
    final loadingMessage = ChatMessage(
      message: 'جاري التفكير...',
      type: MessageType.bot,
      isLoading: true,
      clientId: _clientId,
    );

    emit(state.copyWith(
      messages: [...updatedMessages, loadingMessage],
      status: ChatStatus.loading,
    ));

    // Send the actual prompt to the AI
    _sendMessageToAI(question.id, loadingMessage);
  }

  Future<void> _sendMessageToAI(
      String questionId, ChatMessage loadingMessage) async {
    try {
      // Send the questionId and clientId if available
      final response = await _chatRepository.sendMessageToAI(
        questionId,
        clientId: _clientId,
      );

      // Replace the loading message with the actual response
      final messageIndex = state.messages.indexOf(loadingMessage);
      final updatedMessages = List<ChatMessage>.from(state.messages);

      if (messageIndex != -1) {
        updatedMessages[messageIndex] = ChatMessage(
          message: response,
          type: MessageType.bot,
          clientId: _clientId,
        );
      } else {
        // If for some reason we can't find the loading message, just add a new one
        updatedMessages.add(ChatMessage(
          message: response,
          type: MessageType.bot,
          clientId: _clientId,
        ));
      }

      emit(state.copyWith(
        messages: updatedMessages,
        status: ChatStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ChatStatus.failure,
        errorMessage: e.toString(),
      ));

      // Replace the loading message with an error message
      final messageIndex = state.messages.indexOf(loadingMessage);
      final updatedMessages = List<ChatMessage>.from(state.messages);

      if (messageIndex != -1) {
        updatedMessages[messageIndex] = ChatMessage(
          message:
              'حدث خطأ أثناء الاتصال بالذكاء الاصطناعي. حاول مرة أخرى لاحقًا.',
          type: MessageType.bot,
          clientId: _clientId,
        );
      }

      emit(state.copyWith(
        messages: updatedMessages,
        status: ChatStatus.success, // Reset status for UI
      ));
    }
  }
}
