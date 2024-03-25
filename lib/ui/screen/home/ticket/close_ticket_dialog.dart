import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../features/app/presentation/widgets/app_elvated_button.dart';
import '../../../../features/clients_care/clients_tickets/data/models/TicketModel.dart';
import '../../../../features/clients_care/clients_tickets/data/models/ticket_category_model.dart';
import '../../../../features/clients_care/clients_tickets/data/models/ticket_sub_category_model.dart';
import '../../../../view_model/ticket_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/text_form.dart';

class CloseTicketDialog extends StatefulWidget {
  const CloseTicketDialog({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  State<CloseTicketDialog> createState() => _CloseTicketDialogState();
}

class _CloseTicketDialogState extends State<CloseTicketDialog> {
  final closeTicketFormKey = GlobalKey<FormState>();
  final notesController = TextEditingController();
  List<TicketCategoryModel> selectedCategories = [];
  List<TicketSubCategoryModel> selectedSubCategories = [];

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
                      // CustomMultiSelectionDropdown<CategoryModel>(
                      //   items: Provider.of<ticket_vm>(context, listen: false)
                      //       .categoriesList,
                      //   selectedItems: [],
                      //   hint: 'التصنيف',
                      //   isRequired: true,
                      //   onChanged: (data) {
                      //     selectedCategories = data;
                      //   },
                      //   itemAsString: (item) => item!.categoryAr,
                      // ),
                      // CustomMultiSelectionDropdown<SubCategoryModel>(
                      //   items: Provider.of<ticket_vm>(context, listen: false)
                      //       .subCategoriesList,
                      //   selectedItems: [],
                      //   hint: 'التصنيف الفرعي',
                      //   isRequired: true,
                      //   onChanged: (data) {
                      //     selectedSubCategories = data;
                      //   },
                      //   itemAsString: (item) => item!.subCategoryAr,
                      // ),
                      SizedBox(height: 10),
                      Consumer<ticket_vm>(
                        builder: (context, ticketVM, child) {
                          return AppElevatedButton(
                            text: 'تثبيت',
                            isLoading: ticketVM.isloading,
                            onPressed: () async {
                              // todo : add category and sub category
                              if (closeTicketFormKey.currentState!.validate()) {
                                closeTicketFormKey.currentState!.save();
                                Provider.of<ticket_vm>(context, listen: false)
                                    .updateTicketvm({
                                  'notes_ticket': notesController.text,
                                  'fk_user_close': Provider.of<UserProvider>(
                                          context,
                                          listen: false)
                                      .currentUser
                                      .idUser,
                                  'date_close': DateTime.now(),
                                  'type_ticket': 'مغلقة'
                                }, widget.ticketModel.idTicket);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                Navigator.pop(context);
                              }
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
}
