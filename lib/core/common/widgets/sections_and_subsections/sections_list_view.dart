import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../helpers/helper_functions.dart';
import '../../models/sections/section_model.dart';
import 'sections_card_for_list.dart';

class SectionsListView extends StatelessWidget {
  const SectionsListView({super.key, required this.sections});

  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppPaginatedList(
            items: sections,
            itemBuilder: (context, index) {
              if(!context.read<PrivilegesCubit>().checkPrivilege(sections[index].privilegeId)){
                return SizedBox.shrink();
              }
              return SectionsCardForList(page: sections[index]);
            },
          ),
        ),
        if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppTextButton(
                text: 'الحملات الإعلانية',
                textStyle: AppStyles.regular18.copyWith(color: AppColors.primaryMain, fontWeight: FontWeight.w600),
                onPressed: () async {
                  await HelperFunctions.urlLauncher(
                    'https://test.smartcrm.ws/campaigns',
                    isNewTab: true,
                  );
                },
              ),
            ),
          )
        ]
      ],
    );
  }
  bool _isAllowed(BuildContext context, SectionModel subsection) =>
      context.read<PrivilegesCubit>().checkPrivilege(subsection.privilegeId);

}
