import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/extensions/build_context.dart';
import '../../../../../../core/config/theme/theme.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/important_link_model.dart';
import '../manager/important_links_cubit.dart';
import 'action_link_page.dart';

class ImportantLinkCard extends StatelessWidget {
  const ImportantLinkCard({
    super.key,
    required this.link,
  });

  final ImportantLinkModel link;

  @override
  Widget build(BuildContext context) {
    final ImportantLinksCubit _cubit = context.read<ImportantLinksCubit>();
    return InkWell(
      onTap: () async {
        AppNavigator.go(
          BlocProvider.value(
            value: _cubit,
            child: ActionLinkPage(linkModel: link),
          ),
          isNew: false,
        );
        _cubit.getImportantLinks();
      },
      child: AppCardContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              link.title ?? '',
              color: context.colorScheme.grey600,
            ),
            5.height,
            AppText(
              "${(link.department)} (${(link.clause)} )",
              color: context.colorScheme.grey600,
            ),
          ],
        ),
      ),
    );
  }
}
