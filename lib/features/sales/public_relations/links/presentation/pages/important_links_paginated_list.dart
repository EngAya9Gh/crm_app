import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/important_links_cubit.dart';
import 'important_link_card.dart';

class ImportantLinksPaginatedList extends StatelessWidget {
  const ImportantLinksPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final ImportantLinksCubit _cubit = context.read<ImportantLinksCubit>();
    return BlocBuilder<ImportantLinksCubit, ImportantLinksState>(
      buildWhen: (previous, current) =>
          previous.getImportantLinksStatus != current.getImportantLinksStatus,
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return ImportantLinkCard(
              link: _cubit.pageVariables.allList[index],
            );
          },
          onLoadMore: () => _cubit.getImportantLinks(isNewFilter: false),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          isLoading: state.getImportantLinksStatus.isLoading(),
        );
      },
    );
  }
}
