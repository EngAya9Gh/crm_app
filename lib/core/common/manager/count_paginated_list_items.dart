import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class CountPaginatedListItems<C extends Cubit<S>, S> extends StatelessWidget {
  final int Function(S state) countSelector;
  final String label;

  const CountPaginatedListItems({
    super.key,
    required this.countSelector,
    this.label = 'عدد العملاء: ',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(label),
        BlocBuilder<C, S>(
          builder: (context, state) {
            final count = countSelector(state);
            return AppText("$count");
          },
        ),
      ],
    );
  }
}
