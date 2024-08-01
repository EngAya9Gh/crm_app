import 'package:flutter/material.dart';

import 'app_loader.dart';

class CustomPaginatedList extends StatefulWidget {
  final List items;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final bool hasReachedMax;
  final Function? onLoadMore;

  final ScrollController? scrollController;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const CustomPaginatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.hasReachedMax = false,
    this.onLoadMore,
    this.separatorBuilder,
    this.scrollController,
  });

  @override
  State<CustomPaginatedList> createState() => _CustomPaginatedListState();
}

class _CustomPaginatedListState extends State<CustomPaginatedList> {
  late final bool showLoading;
  late final ScrollController scrollController;

  @override
  void initState() {
    showLoading = widget.isLoading && !widget.hasReachedMax;
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 20,
      controller: scrollController
        ..addListener(() {
          if (_doLoadMore()) {
            widget.onLoadMore?.call();
          }
        }),
      itemCount: widget.items.length + (showLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= widget.items.length) {
          return const AppLoader();
        }
        return widget.itemBuilder(context, index);
      },
      separatorBuilder: (context, index) {
        if (widget.separatorBuilder != null) {
          return widget.separatorBuilder!.call(context, index);
        }
        return const SizedBox(height: 10.0);
      },
    );
  }

  bool _doLoadMore() {
    bool isScrolling = scrollController.offset >=
        scrollController.position.maxScrollExtent - 50;

    return isScrolling && !widget.isLoading && !widget.hasReachedMax;
  }
}
