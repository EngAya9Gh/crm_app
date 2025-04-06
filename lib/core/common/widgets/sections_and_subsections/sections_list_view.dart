import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../config/navigator/app_routes_paths.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_styles.dart';
import '../../helpers/helper_functions.dart';
import '../../models/sections/section_model.dart';
import 'sections_card_for_list.dart';

class SectionsListView extends StatelessWidget {
  const SectionsListView({super.key, required this.sections});

  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Column(


      children: [
 Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                    decoration: BoxDecoration(
                      color: AppColors.primaryMain,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),),

       
        Expanded(

            
          child: AppPaginatedList(
            items: sections,
            itemBuilder: (context, index) {
              if (!context.read<PrivilegesCubit>().checkPrivilege(sections[index].privilegeId)) {
                return SizedBox.shrink();
              }
              return //SectionsCardForList(
                _buildCard( sections[index].title,'',() => 
                sections[index],
              );
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
                    '${EndPoints.baseUrls.urlLaravel}campaigns',
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

  bool _isAllowed(BuildContext context, SectionModel subsection) => context.read<PrivilegesCubit>().checkPrivilege(subsection.privilegeId);
}
 Widget _buildCard(String title, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 6),
              AppText(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryMain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
