import 'package:flutter/material.dart';

import 'custom_loading_indicator.dart';

class CustomPaginatedList extends StatelessWidget {
  const CustomPaginatedList({
    super.key,
    required this.items,
    required this.onLoadMore,
    required this.itemBuilder,
    required this.isLoading,
    required this.hasReachedMax,
    required this.scrollController,
    this.separatorBuilder,
  });

  final List items;
  final Function onLoadMore;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final bool hasReachedMax;

  final ScrollController scrollController;
  final Widget Function(BuildContext, int)? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    final bool showLoading = isLoading && !hasReachedMax;
    return ListView.separated(
      controller: scrollController
        ..addListener(() {
          if (_doLoadMore()) {
            onLoadMore();
          }
        }),
      itemCount: items.length + (showLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return CustomLoadingIndicator();
        }
        return itemBuilder(context, index);
      },
      separatorBuilder: (context, index) {
        if (separatorBuilder != null) {
          return separatorBuilder!.call(context, index);
        }
        return const SizedBox(height: 10.0);
      },
    );
  }

  bool _doLoadMore() {
    return (scrollController.offset >=
            scrollController.position.maxScrollExtent - 100) &&
        !isLoading &&
        !hasReachedMax;
  }
}
