import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../manager/dates_table_cubit.dart';
import 'user_installation_calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        if (state.getDateInstallationStatus.isLoading()) {
          return Expanded(child: AppLoader());
        } else if (state.getDateInstallationStatus.isFailed()) {
          return CustomErrorWidget(
            message: state.getDateInstallationStatus.error,
            onPressed: () {
              context
                  .read<DatesTableCubit>()
                  .getDateInstallation(GetDateInstallationParams(
                    fkCountry: AppConstants.currentCountry(context)!,
                  ));
            },
          );
        }
        return Expanded(child: USerInstallationCalendar());
      },
    );
  }
}
