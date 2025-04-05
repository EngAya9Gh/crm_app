import 'package:equatable/equatable.dart';

import '../../domain/models/chat_message_model.dart';

enum ChatStatus {
  initial,
  loading,
  success,
  failure,
}

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final ChatStatus status;
  final String? errorMessage;
  final bool showChatWindow;

  const ChatState({
    this.messages = const [],
    this.status = ChatStatus.initial,
    this.errorMessage,
    this.showChatWindow = false,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    ChatStatus? status,
    String? errorMessage,
    bool? showChatWindow,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      errorMessage: errorMessage,
      showChatWindow: showChatWindow ?? this.showChatWindow,
    );
  }

  @override
  List<Object?> get props => [messages, status, errorMessage, showChatWindow];
}
