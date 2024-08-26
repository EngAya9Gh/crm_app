import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/levels_cubit/levels_cubit.dart';
import '../widgets/add_level_sheet.dart';
import '../widgets/level_card.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  late LevelsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<LevelsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getLevels();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'إدارة الصلاحيات',
        actions: [
          if (context.read<PrivilegesCubit>().checkPrivilege('26')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "إضافة\nمستوي",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddLevelSheet(),
                  );
                },
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                  color: AppColors.kWhiteColor,
                ),
                appButtonStyle: AppButtonStyle.secondary,
              ),
            ),
          ],
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<LevelsCubit, LevelsState>(
                label: "عدد المستويات",
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            10.height,
            Expanded(
              child: BlocBuilder<LevelsCubit, LevelsState>(
                buildWhen: (previous, current) =>
                    previous.getLevelStatus != current.getLevelStatus,
                builder: (context, state) {
                  return state.getLevelStatus.when(
                    success: (data) => AppPaginatedList(
                      items: _cubit.pageVariables.allList,
                      itemBuilder: (context, index) => LevelCard(
                        level: _cubit.pageVariables.allList[index],
                      ),
                    ),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () async => await _cubit.getLevels(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
