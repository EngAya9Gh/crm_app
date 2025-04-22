import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../view_model/ticket_vm.dart';
import '../../data/models/ticket_category_model.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/ticket_sub_category_model.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

class TicketCloseDialog extends StatefulWidget {
  const TicketCloseDialog({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  State<TicketCloseDialog> createState() => _TicketCloseDialogState();
}

class _TicketCloseDialogState extends State<TicketCloseDialog> {
  late final TicketsCubit ticketsCubit;
  late final TicketVM ticketVm;
  final closeTicketFormKey = GlobalKey<FormState>();
  final notesController = TextEditingController();
  late final bool isClosedBefore;
  late bool isfromSystem;
  @override
  void initState() {
    ticketsCubit = context.read<TicketsCubit>();
    isfromSystem =
        ((widget.ticketModel.ticketSource == 'تقييم عبر النظام / المنتج') || (widget.ticketModel.ticketSource == 'تقييم عبر النظام / خدمة الدعم'));
    if (isfromSystem) {
      ticketsCubit.getSubCategories();
    }
    isClosedBefore = widget.ticketModel.status?.any((element) {
          return element.stateName == TicketTypesEnum.close.nameEn;
        }) ??
        false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'اغلاق التذكرة',
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: closeTicketFormKey,
            child: Column(
              children: [
                AppTextField(
                  controller: notesController,
                  labelText: 'ملاحظات',
                  maxLines: 5,
                  contentPadding: EdgeInsets.all(10),
                  validator: InputValidator.requiredFiled,
                ),
                10.height,
                if (!isClosedBefore) ...[
                  CustomMultiSelectionDropdown<TicketCategoryModel>(
                    items: ticketsCubit.pageVariables.allCategoriesList,
                    selectedItems: [],
                    hint: 'التصنيف',
                    isRequired: true,
                    onSave: (data) {
                      ticketsCubit.pageVariables.selectedCategoriesList = data;
                      ticketsCubit.filterSubCategories();
                    },
                    itemAsString: (item) => item!.categoryAr,
                    compareFn: (category, value) {
                      return category.id == value.id;
                    },
                  ),
                  10.height,
                  BlocBuilder<TicketsCubit, TicketsState>(
                    buildWhen: (previous, current) {
                      return previous.subCategoriesStatus != current.subCategoriesStatus;
                    },
                    builder: (context, state) {
                      if (isfromSystem) {
                        return state.SubCategoriesSystem.when(
                          success: (data) => CustomMultiSelectionDropdown<TicketSubCategoryModel>(
                            items: data ?? [],
                            selectedItems: ticketsCubit.pageVariables.selectedSubCategoriesList,
                            hint: 'التصنيف الفرعي',
                            isRequired: true,
                            onSave: (data) {
                              ticketsCubit.pageVariables.selectedSubCategoriesList = data;
                            },
                            itemAsString: (item) => item!.subCategoryAr,
                            compareFn: (category, value) {
                              return category.id == value.id;
                            },
                          ),
                          failure: (error, data) => SizedBox.shrink(),
                        );
                      }
                      if (ticketsCubit.pageVariables.filteredSubCategoriesByCategories.isEmpty) {
                        return SizedBox.shrink();
                      }
                      return CustomMultiSelectionDropdown<TicketSubCategoryModel>(
                        items: ticketsCubit.pageVariables.filteredSubCategoriesByCategories,
                        selectedItems: [],
                        hint: 'التصنيف الفرعي',
                        isRequired: true,
                        onSave: (data) {
                          ticketsCubit.pageVariables.selectedSubCategoriesList = data;
                        },
                        itemAsString: (item) => item!.subCategoryAr,
                        compareFn: (category, value) {
                          return category.id == value.id;
                        },
                      );
                    },
                  ),
                ],
                SizedBox(height: 10),
                BlocBuilder<EditTicketCubit, EditTicketState>(
                  builder: (context, state) {
                    if (state is EditTicketError) {
                      return AppErrorWidget(
                        onPressed: () async {
                          await _onCloseDialog(ticketsCubit, context);
                        },
                      );
                    }
                    return AppElevatedButton(
                      text: 'تثبيت',
                      isLoading: state is EditTicketLoading,
                      onPressed: () async {
                        await _onCloseDialog(ticketsCubit, context);
                        await ticketsCubit.getTickets();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onCloseDialog(TicketsCubit ticketCubit, BuildContext context) async {
    if (closeTicketFormKey.currentState!.validate()) {
      closeTicketFormKey.currentState!.save();

      await context.read<EditTicketCubit>().editTicketType(EditTicketTypeParams(
            idTicket: widget.ticketModel.idTicket,
            notesTicket: notesController.text,
            notes: notesController.text,
            typeTicket: TicketTypesEnum.close.nameEn,
            categoriesTicketFk: "[${ticketsCubit.pageVariables.selectedCategoriesList.map((e) => e.id).toList().join(',')}]",
            subcategoriesTicket: "[${ticketsCubit.pageVariables.selectedSubCategoriesList.map((e) => e.id).toList().join(',')}]",
          ));
      AppNavigator.pop();
    }
  }
}
