import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../data/models/ticket_category_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

class FilterTicketsSheet extends StatefulWidget {
  const FilterTicketsSheet({super.key});

  @override
  State<FilterTicketsSheet> createState() => _FilterTicketsSheetState();
}

class _FilterTicketsSheetState extends State<FilterTicketsSheet> {
  late final TicketsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<TicketsCubit>();

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
            CustomDropDown<TicketTypesEnum>(
              hint: "حالة التذكرة",
              items: TicketTypesEnum.values,
              itemAsString: (e) => e!.nameAr,
              selectedItem: _cubit.filterEntity.ticketTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.ticketTypeNotifier.value = value!;
              },
              height: (265.0).scaleHeight,
            ),
            10.height,
            Consumer<UserProvider>(
              builder: (context, cart, child) {
                return CustomSearchableDropDown<UserModel>(
                  hint: 'اختر الموظف',
                  items: cart.allUsers,
                  itemAsString: (u) => u!.userAsString(),
                  selectedItem: _cubit.filterEntity.userNotifier.value,
                  onChanged: (data) {
                    _cubit.filterEntity.userNotifier.value = data;
                  },
                  filterFn: (user, filter) => user.getfilteruser(filter),
                  compareFn: (user, value) => user.id == value.id,
                  validator: InputValidator.requiredFiled,
                );
              },
            ),
            10.height,
            CustomDropDown<TicketSourceEnum>(
              hint: 'مصدر التذكرة',
              items: TicketSourceEnum.values,
              itemAsString: (e) => e!.value,
              selectedItem: _cubit.filterEntity.ticketSourceListNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.ticketSourceListNotifier.value = value!;
              },
            ),
            10.height,
            BlocBuilder<TicketsCubit, TicketsState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return AppLoader();
                } else if (state is CategoriesError) {
                  return AppErrorWidget(
                    onPressed: () => _cubit.getTickets(),
                  );
                }
                return CustomMultiSelectionDropdown<TicketCategoryModel>(
                  items: _cubit.pageVariables.allCategoriesList,
                  selectedItems:
                      _cubit.filterEntity.ticketCategoryNotifier.value,
                  hint: 'التصنيف',
                  isRequired: true,
                  onSave: (data) {
                    _cubit.filterEntity.ticketCategoryNotifier.value = data;
                  },
                  itemAsString: (item) => item!.categoryAr,
                  filterFn: (category, filter) =>
                      category.categoryAr.contains(filter),
                  compareFn: (category, value) => category.id == value.id,
                );
              },
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 2),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText('تاريخ التقييم'),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'إلى تاريخ',
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
    _cubit.getTickets();
    AppNavigator.pop(result: true);
  }
}
