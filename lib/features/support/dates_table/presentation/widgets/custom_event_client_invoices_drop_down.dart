import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/date_invoice_model.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../manager/dates_table_cubit.dart';

class CustomEventClientInvoicesDropDown extends StatelessWidget {
  const CustomEventClientInvoicesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final _datesTableCubit = context.read<DatesTableCubit>();
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        if (state.getInvoicesByClientForDateStatus.isLoading()) {
          return AppLoader();
        } else if (state.getInvoicesByClientForDateStatus.isFailed()) {
          return AppErrorWidget(
            message: state.getInvoicesByClientForDateStatus.error,
            onPressed: () async {
              await _datesTableCubit.getInvoicesByClientForDate(
                GetInvoicesByClientForDateParams(
                    idClient: _datesTableCubit
                        .addEventFormVariables.selectedClient.value!.id),
              );
            },
          );
        } else if (state.getInvoicesByClientForDateStatus.data?.isEmpty ??
            true) {
          return SizedBox.shrink();
        }
        return BlocBuilder<DatesTableCubit, DatesTableState>(
          builder: (context, state) {
            return CustomSearchableDropDown<DateInvoiceModel>(
              hint: 'الفاتورة',
              items: state.getInvoicesByClientForDateStatus.data ?? [],
              itemAsString: (item) => item!.value,
              selectedItem:
                  _datesTableCubit.addEventFormVariables.selectedInvoice.value,
              onChanged: (value) async {
                _datesTableCubit.addEventFormVariables.selectedInvoice.value =
                    value;
              },
              validator: (value) {
                return InputValidator.requiredFiled(value);
              },
              filterFn: (item, filter) {
                return item.value.toLowerCase().contains(filter.toLowerCase());
              },
              itemBuilder: (context, item, isSelected) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    child: ListTile(
                      title: AppText(item.addressInvoice),
                      subtitle: AppText(item.value),
                      selected: isSelected,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
