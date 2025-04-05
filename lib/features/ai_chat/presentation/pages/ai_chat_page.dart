import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/chat_repository_impl.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';
import '../widgets/chat_window.dart';

class AIChatPage extends StatelessWidget {
  const AIChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        ChatRepositoryImpl(),
      ),
      child: const AIChatView(),
    );
  }
}

class AIChatView extends StatelessWidget {
  const AIChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.showChatWindow)
              Positioned(
                bottom: 80,
                right: 20,
                child: ChatWindow(),
              ),
            Positioned(
              bottom: 20,
              right: 20,
              child: _buildChatButton(context, state),
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
        width: 56,
        height: 56,
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
            size: 24,
          ),
        ),
      ),
    );
  }
}
