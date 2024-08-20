import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class CountPaginatedList<C extends Cubit<S>, S> extends StatelessWidget {
  final int Function(S state) countSelector;
  final String label;
  final int Function(S state)? totalCount;

  const CountPaginatedList({
    super.key,
    required this.countSelector,
    this.label = 'عدد العملاء: ',
    this.totalCount,
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
            final total = totalCount?.call(state);
            return AppText(total != null ? '$count/$total' : '$count');
          },
        ),
      ],
    );
  }
}
