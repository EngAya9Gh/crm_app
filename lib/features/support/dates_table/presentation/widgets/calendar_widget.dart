import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import 'package:crm_smart/features/support/dates_table/presentation/widgets/user_installation_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        if (state.getDateInstallationStatus.isLoading()) {
          return Expanded(child: CustomLoadingIndicator());
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
