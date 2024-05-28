import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/ui/widgets/user_installation_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        if (state.getDateInstallationStatus.isLoading()) {
          return Expanded(child: CustomLoadingIndicator());
        } else if (state.getDateInstallationStatus.isFail()) {
          return CustomErrorWidget(
            message: state.getDateInstallationStatus.error,
            onPressed: () {
              context
                  .read<SupportTabCubit>()
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
