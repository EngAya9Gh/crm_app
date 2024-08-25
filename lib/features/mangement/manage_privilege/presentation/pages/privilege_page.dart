import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../core/common/enums/privilege_type.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/level_model.dart';
import '../../data/models/privilege_model.dart';
import '../manager/privilege_cubit.dart';
import '../widgets/privilege_card.dart';

class PrivilegePage extends StatefulWidget {
  const PrivilegePage({Key? key, required this.levelModel}) : super(key: key);

  final LevelModel levelModel;

  @override
  State<PrivilegePage> createState() => _PrivilegePageState();
}

class _PrivilegePageState extends State<PrivilegePage> {
  late PrivilegeCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PrivilegeCubit>()
      ..getPrivilegesByLevel(widget.levelModel.idLevel!);
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
                  _cubit.pageVariables.allList,
                  state.tempPrivileges.getDataWhenSuccess,
                );

                return AppTextButton(
                  text: 'حفظ',
                  isLoading: state.updatePrivilegeStatus.isLoading(),
                  onPressed: isEqual ? null : () => _cubit.updatePrivilege(),
                  appButtonStyle: AppButtonStyle.secondary,
                );
              },
            ),
            AppTextButton(
              text: 'تحديث',
              isLoading: false,
              onPressed: () =>
                  _cubit.getPrivilegesByLevel(widget.levelModel.idLevel!),
              appButtonStyle: AppButtonStyle.secondary,
            ),
          ],
        ),
      ),
      body: BlocBuilder<PrivilegeCubit, PrivilegeState>(
        buildWhen: (previous, current) =>
            previous.getPrivileges != current.getPrivileges,
        builder: (context, state) {
          return state.getPrivileges.when(
            success: (_) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: GroupedListView<PrivilegeModel, String>(
                  elements: _cubit.pageVariables.allList,
                  groupBy: (element) {
                    return PrivilegeType.fromString(element.typePrv).value;
                  },
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1.priority?.compareTo(item2.priority ?? '0') ?? 0,
                  order: GroupedListOrder.ASC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      value,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  itemBuilder: (context, element) {
                    return PrivilegeCard(privilegeModel: element);
                  },
                ),
              );
            },
            failure: (error, data) {
              return AppErrorWidget(
                message: error.toString(),
                onPressed: () {
                  _cubit.getPrivilegesByLevel(widget.levelModel.idLevel!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
