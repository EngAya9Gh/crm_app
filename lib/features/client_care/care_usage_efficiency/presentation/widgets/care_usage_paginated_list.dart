import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _scrollController = ScrollController();
    _cubit = context.read<CareUsageCubit>();
    _scrollController.addListener(_onScroll);
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
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(16.r),
      itemCount: _cubit.pageVariables.allList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.r),
          child: CareUsageCard(
            careUsage: _cubit.pageVariables.allList[index],
          ),
        );
      },
    );
  }
}
