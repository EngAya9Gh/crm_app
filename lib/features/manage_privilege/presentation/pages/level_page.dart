import 'package:crm_smart/core/common/models/page_state/result_builder.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/manage_privilege/presentation/pages/add_level_sheet.dart';
import 'package:crm_smart/features/manage_privilege/presentation/pages/privilege_page.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/theme.dart';
import '../../../../core/di/di_container.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/models/level_model.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({Key? key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _privilegeCubit = getIt<PrivilegeCubit>()
      ..getLevels(context.read<UserProvider>().currentUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _privilegeCubit,
      child: AppScaffold(
        appBar: SmartCrmAppBar(
            appBarParams: AppBarParams(title: 'إدارة الصلاحيات')),
        floatingActionButton: context
                .read<PrivilegeCubit>()
                .checkPrivilege('51')
            ? FloatingActionButton(
                child: Icon(Icons.add, color: AppColors.white),
                onPressed: () {
                  AppBottomSheet.show(context: context, child: AddLevelSheet());
                },
                backgroundColor: context.colorScheme.primary,
              )
            : Container(),
        body: BlocBuilder<PrivilegeCubit, PrivilegeState>(
          builder: (context, state) {
            return PageStateBuilder<List<LevelModel>>(
              init: Center(child: AppLoader()),
              success: (data) => RefreshIndicator(
                onRefresh: () => _privilegeCubit.getLevels(
                    context.read<UserProvider>().currentUser,
                    isRefresh: true),
                child: ListView.separated(
                  itemCount: data.length,
                  padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemBuilder: (BuildContext context, int index) =>
                      levelCard(data[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      15.verticalSpace,
                ),
              ),
              loading: Center(child: AppLoader()),
              error: (error) => IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
              result: state.levelsState,
              empty: SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget levelCard(LevelModel levelModel) => InkWell(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => PrivilegePage(levelModel: levelModel),
            )),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Colors.black87.withOpacity(0.2),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8).r),
            color: context.colorScheme.background,
          ),
          padding: HWEdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: AppText(levelModel.nameLevel ?? ''),
        ),
      );
}
