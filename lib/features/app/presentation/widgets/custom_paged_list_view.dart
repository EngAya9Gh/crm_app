import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'app_loader_widget/app_loader.dart';

class CustomPagedListView<T, B> extends StatelessWidget {
  const CustomPagedListView({
    Key? key,
    required this.firstPageErrorIndicatorBuilder,
    this.isSliver = false,
    required this.noItemsFoundIndicatorWidget,
    required this.pagingController,
    required this.itemBuilder,
    this.padding,
    this.physics,
    this.scrollController,
    this.shrinkWrap = false,
  })  : _separatorBuilder = null,
        super(key: key);

  final PagingController<T, B> pagingController;
  final IndexedWidgetBuilder? _separatorBuilder;
  final Widget? noItemsFoundIndicatorWidget;
  final Widget? firstPageErrorIndicatorBuilder;
  final ItemWidgetBuilder<B> itemBuilder;
  final bool isSliver;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final bool shrinkWrap;

  const CustomPagedListView.separated({
    this.isSliver = false,
    this.firstPageErrorIndicatorBuilder,
    this.noItemsFoundIndicatorWidget,
    required this.pagingController,
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    this.padding,
    this.physics,
    this.scrollController,
    this.shrinkWrap = false,
    Key? key,
  })  : _separatorBuilder = separatorBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSliver ? buildPagedSliverList : buildPagedListView;
  }

  PagedListView<T, B> get buildPagedListView {
    return _separatorBuilder != null
        ? PagedListView<T, B>.separated(
            separatorBuilder: _separatorBuilder!,
            pagingController: pagingController,
            padding: padding,
            physics: physics,
            scrollController: scrollController,
            shrinkWrap: shrinkWrap,
            builderDelegate: PagedChildBuilderDelegate<B>(
              firstPageProgressIndicatorBuilder: (context) => AppLoader(),
              newPageProgressIndicatorBuilder: (context) => Center(child: const AppLoader.spinKitThreeBounce()),
              noItemsFoundIndicatorBuilder:
                  noItemsFoundIndicatorWidget != null ? (context) => noItemsFoundIndicatorWidget! : null,
              firstPageErrorIndicatorBuilder:
                  firstPageErrorIndicatorBuilder != null ? (context) => firstPageErrorIndicatorBuilder! : null,
              itemBuilder: itemBuilder,
            ),
          )
        : PagedListView<T, B>(
            pagingController: pagingController,
      padding: padding,
      physics: physics,
      scrollController: scrollController,
      shrinkWrap: shrinkWrap,
            builderDelegate: PagedChildBuilderDelegate<B>(
              firstPageProgressIndicatorBuilder: (context) => AppLoader(),
              newPageProgressIndicatorBuilder: (context) => Center(child: const AppLoader.spinKitThreeBounce()),
              noItemsFoundIndicatorBuilder:
                  noItemsFoundIndicatorWidget != null ? (context) => noItemsFoundIndicatorWidget! : null,
              firstPageErrorIndicatorBuilder:
                  firstPageErrorIndicatorBuilder != null ? (context) => firstPageErrorIndicatorBuilder! : null,
              itemBuilder: itemBuilder,
            ),
          );
  }

  PagedSliverList<dynamic, dynamic> get buildPagedSliverList {
    return _separatorBuilder != null
        ? PagedSliverList<T, B>.separated(
            separatorBuilder: _separatorBuilder!,
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<B>(
              itemBuilder: itemBuilder,
              firstPageProgressIndicatorBuilder: (context) => AppLoader(),
              newPageProgressIndicatorBuilder: (context) => Center(child: const AppLoader.spinKitThreeBounce()),
              noItemsFoundIndicatorBuilder:
                  noItemsFoundIndicatorWidget != null ? (context) => noItemsFoundIndicatorWidget! : null,
              firstPageErrorIndicatorBuilder:
                  firstPageErrorIndicatorBuilder != null ? (context) => firstPageErrorIndicatorBuilder! : null,
            ),
          )
        : PagedSliverList<T, B>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<B>(
              itemBuilder: itemBuilder,
              firstPageProgressIndicatorBuilder: (context) => AppLoader(),
              newPageProgressIndicatorBuilder: (context) => Center(child: const AppLoader.spinKitThreeBounce()),
              noItemsFoundIndicatorBuilder:
                  noItemsFoundIndicatorWidget != null ? (context) => noItemsFoundIndicatorWidget! : null,
              firstPageErrorIndicatorBuilder:
                  firstPageErrorIndicatorBuilder != null ? (context) => firstPageErrorIndicatorBuilder! : null,
            ),
          );
  }
}
