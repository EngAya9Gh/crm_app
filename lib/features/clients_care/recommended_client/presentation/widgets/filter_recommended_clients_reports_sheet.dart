import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/clients_care/recommended_client/presentation/manager/recommended_client_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';

class FilterRecommendedClientReportsSheet extends StatefulWidget {
  const FilterRecommendedClientReportsSheet({super.key});

  @override
  State<FilterRecommendedClientReportsSheet> createState() => _FilterRecommendedClientReportsSheetState();
}

class _FilterRecommendedClientReportsSheetState extends State<FilterRecommendedClientReportsSheet> {
  late final RecommendedClientReportsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<RecommendedClientReportsBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _bloc.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _bloc.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _bloc.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeController: _bloc.filterEntity.dateFromController,
                      dateTimeType: DateTimeEnum.date,
                      hintText: 'وقت البداية',
                      style2: true,
                    ),
                  ),
                  10.width,
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeController: _bloc.filterEntity.dateToController,
                      dateTimeType: DateTimeEnum.date,
                      hintText: 'وقت النهاية',
                      style2: true,
                    ),
                  ),
                ],
              ),
            ),
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _bloc.add(GetRecommendedClientReportsEvent());
    AppNavigator.pop(result: true);
  }
}
