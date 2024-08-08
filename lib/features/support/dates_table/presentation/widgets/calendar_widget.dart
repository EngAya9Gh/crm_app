import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/dates_table_cubit.dart';
import 'user_installation_calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      buildWhen: (previous, current) =>
          previous.getDateInstallationStatus !=
          current.getDateInstallationStatus,
      builder: (context, state) {
        if (state.getDateInstallationStatus.isLoading()) {
          return Expanded(child: AppLoader());
        } else if (state.getDateInstallationStatus.isFailed()) {
          return CustomErrorWidget(
            message: state.getDateInstallationStatus.error,
            onPressed: () {
              context.read<DatesTableCubit>().getDateInstallation(
                  fkCountry: AppConstants.currentCountry(context)!);
            },
          );
        }
        return Expanded(child: UserInstallationCalendar());
      },
    );
  }
}
