import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        final result = await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => BlocProvider.value(
                    value: _cubit,
                    child: ActionLinkPage(linkModel: link),
                  )),
        );
        _cubit.getImportantLinks();
      },
      child: Card(
        // color: Colors.grey.shade200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                      child: AppText(
                        link.title ?? '',
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: context.colorScheme.grey600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                    child: AppText(
                      "${(link.department)} (${(link.clause)} )",
                      style: context.textTheme.bodySmall!
                          .copyWith(color: context.colorScheme.grey600),
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
