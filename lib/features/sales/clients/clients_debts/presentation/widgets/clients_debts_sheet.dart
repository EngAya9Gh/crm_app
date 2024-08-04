import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/invoice_status_enum.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/regions/presentation/pages/regions_searchable_drop_down.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/clients_debts_cubit.dart';

class ClientsDebtsSheet extends StatefulWidget {
  const ClientsDebtsSheet({super.key});

  @override
  State<ClientsDebtsSheet> createState() => _ClientsDebtsSheetState();
}

class _ClientsDebtsSheetState extends State<ClientsDebtsSheet> {
  late final ClientsDebtsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsDebtsCubit>();

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
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            RegionSearchableDropDown(
              hint: "الفرع",
              selectedRegionId:
                  _cubit.filterEntity.regionNotifier.value?.regionId,
              onSelected: (region) {
                return _cubit.filterEntity.regionNotifier.value = region;
              },
            ),
            10.height,
            CustomDropDown<InvoiceStatusEnum>(
              hint: "الحالة",
              items: InvoiceStatusEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.invoiceStateNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.invoiceStateNotifier.value = value;
              },
              height: 135.h,
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateToController,
                    style2: true,
                  ),
                ),
              ],
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
    _cubit.getPendingInvoices();
    AppNavigator.pop(result: true);
  }
}
