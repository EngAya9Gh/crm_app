import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/chat_repository_impl.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';
import '../widgets/chat_window.dart';
import '../widgets/ai_chat_button.dart';

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
}
