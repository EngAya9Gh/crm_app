import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../utils/app_dimensions.dart';
import 'app_loader.dart';

class AppPaginatedGridView extends StatefulWidget {
  final List items;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final bool hasReachedMax;
  final Function? onLoadMore;

  final ScrollController? scrollController;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final bool shrinkWrap;

  const AppPaginatedGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.hasReachedMax = false,
    this.onLoadMore,
    this.separatorBuilder,
    this.scrollController,
    this.shrinkWrap = false,
  });

  @override
  State<AppPaginatedGridView> createState() => _AppPaginatedGridViewState();
}

class _AppPaginatedGridViewState extends State<AppPaginatedGridView> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool showLoading = widget.isLoading && !widget.hasReachedMax;
    return ResponsiveGridList(
      shrinkWrap: widget.shrinkWrap,
      controller: scrollController
        ..addListener(() {
          if (_doLoadMore()) widget.onLoadMore?.call();
        }),
      desiredItemWidth: AppDimensions.scaleWidth(250),
      minSpacing: 5,
      children: [
        for (int index = 0; index < widget.items.length; index++)
          widget.itemBuilder(context, index),
        if (showLoading) const AppLoader(),
      ],
    );
  }

  bool _doLoadMore() {
    bool isScrolling = scrollController.offset >=
        scrollController.position.maxScrollExtent - 50;

    return isScrolling && !widget.isLoading && !widget.hasReachedMax;
  }
}
