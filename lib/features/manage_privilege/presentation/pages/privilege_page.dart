import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_scaffold.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_privilege/data/models/level_model.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../core/di/di_container.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../data/models/privilege_model.dart';

class PrivilegePage extends StatefulWidget {
  const PrivilegePage({Key? key, required this.levelModel}) : super(key: key);

  final LevelModel levelModel;

  @override
  State<PrivilegePage> createState() => _PrivilegePageState();
}

class _PrivilegePageState extends State<PrivilegePage> {
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _privilegeCubit = getIt<PrivilegeCubit>()
      ..getPrivilegesLevel(widget.levelModel.idLevel!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: SmartCrmAppBar(
        appBarParams: AppBarParams(
          title: widget.levelModel.nameLevel,
          action: [
            BlocBuilder<PrivilegeCubit, PrivilegeState>(
              builder: (context, state) {
                final isEqual = listEquals(
                  state.privilegesOfLevel.getDataWhenSuccess,
                  state.privilegesOfLevelTemp.getDataWhenSuccess,
                );

                return AppTextButton(
                  text: 'حفظ',
                  isLoading: state.updatePrivilegeStatus.isLoading(),
                  onPressed: isEqual
                      ? null
                      : () => _privilegeCubit.updatePrivilege(
                          context.read<UserProvider>().currentUser.idUser!),
                  appButtonStyle: AppButtonStyle.secondary,
                );
              },
            )
          ],
        ),
      ),
      body: BlocBuilder<PrivilegeCubit, PrivilegeState>(
        builder: (context, state) => state.privilegesOfLevelTemp.when(
          init: () => Center(child: AppLoader()),
          loading: () => Center(child: AppLoader()),
          loaded: (data) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: GroupedListView<PrivilegeModel, String>(
                elements: data,
                groupBy: (element) {
                  switch (element.typePrv) {
                    case 'sales':
                      return 'المبيعات';

                    case 'manage':
                      return 'الإدارة';

                    case 'care':
                      return 'العناية بالعملاء';

                    case 'support':
                      return 'الدعم الفني';

                    case 'market':
                      return 'التسويق الالكتروني';

                    case 'other':
                      return 'آخرى';

                    case 'notify':
                      return 'الإشعارات';
                    case 'report':
                      return 'التقارير';
                    case 'tasks':
                      return 'إدارة المهام';
                  }
                  return '';
                },
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1.priority?.compareTo(item2.priority ?? '0') ?? 0,
                order: GroupedListOrder.ASC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                itemBuilder: (c, element) {
                  return Container(
                    child: SwitchListTile(
                      title: Text(element.namePrivilege!),
                      value: element.isCheck!,
                      activeColor: AppColors.white,
                      activeTrackColor: AppColors.green,
                      onChanged: (bool? value) {
                        if (value == null) {
                          return;
                        }
                        _privilegeCubit.onChangePrivilege(element);
                      },
                    ),
                  );
                },
              ),
            );
          },
          empty: () => Center(child: AppLoader()),
          error: (e) => Center(
            child: IconButton(
              onPressed: () => _privilegeCubit
                  .getPrivilegesLevel(widget.levelModel.idLevel!),
              icon: Icon(Icons.refresh),
            ),
          ),
        ),
      ),
    );
  }
}
