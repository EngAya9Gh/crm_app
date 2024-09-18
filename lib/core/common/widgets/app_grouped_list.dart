import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class AppGroupedList<T, G> extends StatelessWidget {
  final List<T> elements;
  final G Function(T element) groupBy;
  final int Function(G value1, G value2)? groupComparator;
  final int Function(T item1, T item2)? itemComparator;
  final GroupedListOrder order;
  final Widget Function(G group)? groupSeparatorBuilder;
  final Widget Function(BuildContext context, T element) itemBuilder;
  final bool useStickyGroupSeparators;
  final Widget separator;

  const AppGroupedList({
    super.key,
    required this.elements,
    required this.groupBy,
    this.groupComparator,
    this.itemComparator,
    this.order = GroupedListOrder.ASC,
    this.groupSeparatorBuilder,
    required this.itemBuilder,
    this.useStickyGroupSeparators = true,
    this.separator = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return GroupedListView<T, G>(
      elements: elements,
      groupBy: groupBy,
      groupComparator: groupComparator,
      itemComparator: itemComparator,
      order: order,
      useStickyGroupSeparators: useStickyGroupSeparators,
      groupSeparatorBuilder: groupSeparatorBuilder ??
          (value) {
            return Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: AppText(
                value,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            );
          },
      separator: separator,
      itemBuilder: itemBuilder,
    );
  }
}
