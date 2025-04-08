import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/ai_chat/presentation/widgets/ai_chat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/models/chat_message_model.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';
import '../widgets/chat_window.dart';

class ClientAIChatPage extends StatelessWidget {
  final String clientId;

  const ClientAIChatPage({
    Key? key,
    required this.clientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        ChatRepositoryImpl(),
        clientId: clientId,
      ),
      child: const ClientAIChatView(),
    );
  }
}

class ClientAIChatView extends StatelessWidget {
  const ClientAIChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.showChatWindow)
              Positioned(
                bottom: 60,
                right: 20,
                child: ChatWindow(
                  questions: clientProfileQuestions,
                ),
              ),
            Positioned(
              bottom: 20,
              right: 20,
              child: AIChatButton(  
                showChatWindow: state.showChatWindow,
                onTap: () => context.read<ChatCubit>().toggleChatWindow(),
          ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChatButton(BuildContext context, ChatState state) {
    return GestureDetector(
      onTap: () {
        context.read<ChatCubit>().toggleChatWindow();
      },
      child: Container(
        width: 56.scaleWidth,
        height: 56.scaleHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            state.showChatWindow ? Icons.close : Icons.chat,
            color: Colors.white,
            size: 24.scaleIconsSize,
          ),
        ),
      ),
    );
  }
}
