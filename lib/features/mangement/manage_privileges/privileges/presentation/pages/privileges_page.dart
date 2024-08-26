import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../../core/common/enums/privilege_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../levels/data/models/level_model.dart';
import '../../data/models/privilege_model.dart';
import '../manager/levels_cubit/privileges_cubit.dart';
import '../widgets/filter_privilege_sheet.dart';
import '../widgets/privilege_card.dart';

class PrivilegesPage extends StatefulWidget {
  const PrivilegesPage({Key? key, required this.level}) : super(key: key);

  final LevelModel level;

  @override
  State<PrivilegesPage> createState() => _PrivilegesPageState();
}

class _PrivilegesPageState extends State<PrivilegesPage> {
  late PrivilegesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PrivilegesCubit>()
      ..pageVariables.currentLevel = widget.level
      ..getPrivileges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: widget.level.nameLevel,
        actions: [
          BlocBuilder<PrivilegesCubit, PrivilegesState>(
            builder: (context, state) {
              if (state.updatePrivilegesStatus.isLoading()) {
                return AppLoader(color: AppColors.white);
              }
              return AppTextButton(
                text: 'حفظ',
                onPressed: () => _cubit.updatePrivileges(),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: AppFonts.fontFamily2,
                ),
                appButtonStyle: AppButtonStyle.primary,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          10.height,
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.getPrivileges(isDebounced: true);
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterPrivilegeSheet(),
                    );
                    if (value != true) {
                      _cubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
          ),
          10.height,
          BlocBuilder<PrivilegesCubit, PrivilegesState>(
            buildWhen: (previous, current) {
              return previous.getPrivilegesStatus !=
                      current.getPrivilegesStatus ||
                  previous.refreshUi != current.refreshUi;
            },
            builder: (context, state) {
              return state.getPrivilegesStatus.when(
                success: (_) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                      child: GroupedListView<PrivilegeModel, String>(
                        elements: _cubit.pageVariables.tempList,
                        itemBuilder: (context, element) {
                          return PrivilegeCard(privilegeModel: element);
                        },
                        groupBy: (element) {
                          return PrivilegeTypeEnum.fromString(element.typePrv)
                              .value;
                        },
                        groupHeaderBuilder: (element) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            color: AppColors.grey.withOpacity(0.1),
                            child: AppText(
                              PrivilegeTypeEnum.fromString(element.typePrv)
                                  .value,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        useStickyGroupSeparators: true,
                        order: GroupedListOrder.ASC,
                        itemComparator: (item1, item2) =>
                            item1.priority?.compareTo(item2.priority ?? '0') ??
                            0,
                      ),
                    ),
                  );
                },
                failure: (error, data) {
                  return AppErrorWidget(
                    message: error.toString(),
                    onPressed: () {
                      _cubit.getPrivileges();
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
