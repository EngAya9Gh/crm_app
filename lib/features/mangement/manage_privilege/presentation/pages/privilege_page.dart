import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/level_model.dart';
import '../../data/models/privilege_model.dart';
import '../manager/privilege_cubit.dart';

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
                  onPressed:
                      isEqual ? null : () => _privilegeCubit.updatePrivilege(),
                  appButtonStyle: AppButtonStyle.secondary,
                );
              },
            )
          ],
        ),
      ),
      body: BlocBuilder<PrivilegeCubit, PrivilegeState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          return state.privilegesOfLevelTemp.when(
            init: () => const AppLoader(),
            loading: () => const AppLoader(),
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

                      case 'user':
                        return 'إدارة المستخدمين';

                      default:
                        return '';
                    }
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return PrivilegeCard(privilegeModel: element);
                  },
                ),
              );
            },
            empty: () => const AppLoader(),
            error: (e) => Center(
              child: IconButton(
                onPressed: () => _privilegeCubit
                    .getPrivilegesLevel(widget.levelModel.idLevel!),
                icon: Icon(Icons.refresh),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PrivilegeCard extends StatelessWidget {
  const PrivilegeCard({
    super.key,
    required this.privilegeModel,
  });

  final PrivilegeModel privilegeModel;

  @override
  Widget build(BuildContext context) {
    final privilegeCubit = context.read<PrivilegeCubit>();
    return Container(
      child: SwitchListTile(
        title: Text(privilegeModel.namePrivilege!),
        value: privilegeModel.isCheck!,
        activeColor: AppColors.white,
        activeTrackColor: AppColors.green,
        onChanged: (bool? value) {
          if (value == null) {
            return;
          }
          privilegeCubit.changePrivilege(
            privilegeModel: privilegeModel,
          );
          // privilegeCubit.onChangePrivilege(privilegeModel);
        },
      ),
    );
  }
}
