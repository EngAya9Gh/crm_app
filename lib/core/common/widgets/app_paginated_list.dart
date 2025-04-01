import 'package:flutter/material.dart';
import 'app_loader.dart';

class AppPaginatedList extends StatefulWidget {
  final List items;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool isLoading;
  final bool hasReachedEnd;
  final Function? onLoadMore;

  final ScrollController? scrollController;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final double? cacheExtent;
  final EdgeInsetsGeometry? listMargin;
  final Axis? scrollDirection;

  const AppPaginatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.hasReachedEnd = false,
    this.onLoadMore,
    this.separatorBuilder,
    this.scrollController,
    this.cacheExtent,
    this.listMargin,
    this.scrollDirection,
  });

  @override
  State<AppPaginatedList> createState() => _AppPaginatedListState();
}

class _AppPaginatedListState extends State<AppPaginatedList> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool showLoading = widget.isLoading && !widget.hasReachedEnd;
    return ListView.separated(
      scrollDirection: widget.scrollDirection ?? Axis.vertical,
      padding: widget.listMargin ??
          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      cacheExtent: widget.cacheExtent ?? 20,
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

    return isScrolling && !widget.isLoading && !widget.hasReachedEnd;
  }
}

class PageVariables {
  List<dynamic> allList = [];
  bool hasReachedEnd = false;
  int currentPage = 1;
  int totalPages = 0;
  int totalCount = 0;
}
