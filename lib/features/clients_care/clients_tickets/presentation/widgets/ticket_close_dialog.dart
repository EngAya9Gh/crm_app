import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/ticket_vm.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../../data/models/ticket_category_model.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/ticket_sub_category_model.dart';

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
  late final ticket_vm ticketVm;
  final closeTicketFormKey = GlobalKey<FormState>();
  final notesController = TextEditingController();

  @override
  void initState() {
    ticketsCubit = context.read<TicketsCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        titlePadding: const EdgeInsets.all(15),
        contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          'إغلاق التذكرة',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: kfontfamily2),
        ),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: closeTicketFormKey,
                  child: Column(
                    children: [
                      Flexible(
                        child: EditTextFormField(
                          maxline: 10,
                          paddcustom: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          hintText: 'ملاحظات الإغلاق',
                          obscureText: false,
                          controller: notesController,
                          vaildator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return AppStrings.messageEmpty;
                            }
                            return null;
                          },
                        ),
                      ),
                      CustomMultiSelectionDropdown<TicketCategoryModel>(
                        items: ticketsCubit.allCategoriesList,
                        selectedItems: [],
                        hint: 'التصنيف',
                        isRequired: true,
                        onChanged: (data) {
                          ticketsCubit.selectedCategoriesList = data;
                          ticketsCubit.filterSubCategories();
                        },
                        itemAsString: (item) => item!.categoryAr,
                      ),
                      BlocBuilder<TicketsCubit, TicketsState>(
                        buildWhen: (previous, current) {
                          return current is SubCategoriesLoaded ||
                              current is SubCategoriesLoading ||
                              current is SubCategoriesError;
                        },
                        builder: (context, state) {
                          if (ticketsCubit
                              .filteredSubCategoriesByCategories.isEmpty) {
                            return SizedBox.shrink();
                          }
                          return CustomMultiSelectionDropdown<
                              TicketSubCategoryModel>(
                            items:
                                ticketsCubit.filteredSubCategoriesByCategories,
                            selectedItems: [],
                            hint: 'التصنيف الفرعي',
                            isRequired: true,
                            onChanged: (data) {
                              ticketsCubit.selectedSubCategoriesList = data;
                            },
                            itemAsString: (item) => item!.subCategoryAr,
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      BlocBuilder<TicketsCubit, TicketsState>(
                        buildWhen: (previous, current) {
                          return current is EditTicketTypeLoading ||
                              current is EditTicketTypeLoaded ||
                              current is EditTicketTypeError;
                        },
                        builder: (context, state) {
                          if (state is EditTicketTypeError) {
                            return CustomErrorWidget(
                              onPressed: () async {
                                await _onCloseDialog(ticketsCubit, context);
                              },
                            );
                          }
                          return AppElevatedButton(
                            text: 'تثبيت',
                            isLoading: state is EditTicketTypeLoading,
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
            ),
          ),
        ]);
  }

  Future<void> _onCloseDialog(
      TicketsCubit ticketCubit, BuildContext context) async {
    if (closeTicketFormKey.currentState!.validate()) {
      closeTicketFormKey.currentState!.save();
      await ticketCubit.editTicketType(EditTicketTypeParams(
        idTicket: widget.ticketModel.idTicket,
        notesTicket: notesController.text,
        notes: notesController.text,
        typeTicket: TicketTypesEnum.close.name,
        categoriesTicketFk:
            "[${ticketsCubit.selectedCategoriesList.map((e) => e.id).toList().join(',')}]",
        subcategoriesTicket:
            "[${ticketsCubit.selectedSubCategoriesList.map((e) => e.id).toList().join(',')}]",
      ));
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    }
  }
}
