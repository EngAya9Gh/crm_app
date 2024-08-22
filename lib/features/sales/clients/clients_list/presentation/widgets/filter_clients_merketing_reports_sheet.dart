import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/utils/extensions/build_context.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../domain/use_cases/get_client_marketing_report_usecase.dart';
import '../manager/clients_list_bloc.dart';

class FilterClientsMarketingReportsSheet extends StatefulWidget {
  const FilterClientsMarketingReportsSheet({
    Key? key,
  });

  @override
  State<FilterClientsMarketingReportsSheet> createState() =>
      _FilterClientsMarketingReportsSheetState();
}

class _FilterClientsMarketingReportsSheetState
    extends State<FilterClientsMarketingReportsSheet> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  late ClientsListBloc _clientsListBloc;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();

    fromController.text =
        _clientsListBloc.state.getClientMarketingReportParams?.from ?? '';
    toController.text =
        _clientsListBloc.state.getClientMarketingReportParams?.to ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  (() {
                    return "فلترة التقارير:";
                  }()),
                  style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
                ),
                ListenableBuilder(
                  listenable: Listenable.merge([
                    fromController,
                    toController,
                  ]),
                  builder: (context, child) => AppTextButton(
                    onPressed: fromController.text.isNotEmpty ||
                            toController.text.isNotEmpty
                        ? () {
                            fromController.text = '';
                            toController.text = '';
                          }
                        : null,
                    text: "إعادة الافتراضي",
                    appButtonStyle: AppButtonStyle.secondary,
                  ),
                )
              ],
            ),
            10.verticalSpace,
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomDateTimePicker(
                        hintText: 'من تاريخ',
                        dateTimeType: DateTimeEnum.date,
                        dateTimeController: fromController,
                        style2: true,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomDateTimePicker(
                        hintText: 'الي تاريخ',
                        dateTimeType: DateTimeEnum.date,
                        dateTimeController: toController,
                        style2: true,
                      ),
                    ),
                  ],
                );
              },
            ),
            20.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();

                  final GetClientMarketingReportParams? params =
                      GetClientMarketingReportParams(
                    from: fromController.text,
                    to: toController.text,
                  );

                  _clientsListBloc
                      .add(GetClientMarketingReportEvent(params: params));
                },
                child: AppText("فلترة"),
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
