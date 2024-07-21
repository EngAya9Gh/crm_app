import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';

class LevelsSearchableDropdown extends StatefulWidget {
  const LevelsSearchableDropdown({
    super.key,
    required this.levelNotifier,
    this.onChanged,
  });

  final ValueNotifier<LevelModel?> levelNotifier;
  final void Function(LevelModel?)? onChanged;

  @override
  State<LevelsSearchableDropdown> createState() =>
      _LevelsSearchableDropdownState();
}

class _LevelsSearchableDropdownState extends State<LevelsSearchableDropdown> {
  @override
  void initState() {
    context
        .read<PrivilegeCubit>()
        .getLevels(AppConstants.currentUser(context)!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivilegeCubit, PrivilegeState>(
      builder: (context, state) {
        if (state.levelsStatus.isLoading) {
          return CustomLoadingIndicator();
        } else if (state.levelsStatus.isError) {
          return const Center(child: Text('حدث خطأ ما'));
        } else if (state.levelsList.isEmpty) {
          return const Center(child: Text('لا يوجد بيانات'));
        }
        return CustomSearchableDropDown<LevelModel>(
          hint: "حدد المستوى",
          items: state.levelsList,
          itemAsString: (item) => item!.nameLevel ?? '',
          selectedItem: widget.levelNotifier.value,
          onChanged: widget.onChanged,
          filterFn: (item, str) {
            return item.nameLevel
                .toString()
                .toLowerCase()
                .contains(str.toLowerCase());
          },
        );
      },
    );
  }
}
