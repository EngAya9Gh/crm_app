import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../manager/users_cubit.dart';

class LevelsSearchableDropdown extends StatelessWidget {
  const LevelsSearchableDropdown({
    super.key,
    required this.level,
    this.onChanged,
    this.isRequired = false,
  });

  final LevelModel? level;
  final void Function(LevelModel?)? onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state.levelsStatus.isLoading()) {
          return AppLoader();
        } else if (state.levelsStatus.isFailed()) {
          return CustomErrorWidget(
            message: state.levelsStatus.error,
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        } else if (state.levelsStatus.data?.isEmpty ?? true) {
          return CustomErrorWidget(
            message: "لا يوجد مستويات",
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        }
        return CustomSearchableDropDown<LevelModel>(
          hint: "حدد المستوى",
          items: state.levelsStatus.data!,
          itemAsString: (item) => item!.nameLevel!,
          selectedItem: level,
          onChanged: onChanged,
          filterFn: (item, str) {
            return item.nameLevel
                .toString()
                .toLowerCase()
                .contains(str.toLowerCase());
          },
          isRequired: isRequired,
        );
      },
    );
  }
}
