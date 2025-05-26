import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../presentation/manager/care_usage_cubit/care_usage_cubit.dart';
import 'care_usage_card.dart';

class CareUsagePaginatedList extends StatefulWidget {
  const CareUsagePaginatedList({Key? key}) : super(key: key);

  @override
  State<CareUsagePaginatedList> createState() => _CareUsagePaginatedListState();
}

class _CareUsagePaginatedListState extends State<CareUsagePaginatedList> {
  late final ScrollController _scrollController;
  late final CareUsageCubit _cubit;

  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController();
    _cubit = context.read<CareUsageCubit>();
    // _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_cubit.pageVariables.hasReachedEnd) {
      _cubit.getCareUsageList(isNewFilter: false);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareUsageCubit, CareUsageState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CareUsageCard(
              careUsage:   _cubit.pageVariables.allList[index],

            );
          },
          onLoadMore: () async {
            await _cubit.getCareUsageList(isNewFilter: false);
          },
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          isLoading: state.getCareUsageListStatus.isLoading(),
        );
      },
    );
  }
}
