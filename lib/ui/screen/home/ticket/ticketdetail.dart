import 'package:crm_smart/core/common/enums/ticket_source_enum.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/model/category_model.dart';
import 'package:crm_smart/model/sub_category_model.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticket_rate.dart';
import 'package:crm_smart/ui/widgets/custom_widget/rowdivided.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../function_global.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({
    this.type,
    Key? key,
    required this.ticketModel,
  }) : super(key: key);
  final String? type;
  final TicketModel ticketModel;

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  late final ticket_vm ticketVm;

  @override
  void initState() {
    ticketVm = context.read<ticket_vm>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ticketVm.getCategories();
      ticketVm.getSubCategories();
    });

    super.initState();
  }

  Widget _tranferall(
      String nameto, String namefrom, String date, String resoan) {
    return Column(
      children: [
        cardRowDivided(
          title: 'قام بتحويل التذكرة ',
          value: getnameshort(namefrom),
        ),
        cardRowDivided(
          title: 'الشخص المحول له ',
          value: getnameshort(nameto),
        ),

        cardRowDivided(title: 'تاريخ تحويل التذكرة ', value: date.toString()),
        cardRowDivided(
          title: ' سبب التحويل ',
          value: resoan,
          isExpanded: true,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        // Row(
        //
        //   children: [
        //     //Expanded flex 1
        //     Text(name,
        //       style: TextStyle(fontFamily: kfontfamily2),),
        //     Spacer(),
        //     Text( price,style: TextStyle(fontFamily: kfontfamily2),),
        //   ],
        // ),
        // Divider(thickness: 1,color: Colors.grey,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.ticketModel.typeTicket.toString() +
              ' ' +
              '#' +
              widget.ticketModel.idTicket,
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                widget.type == null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.ticketModel.dateRecive == null
                                ? context
                                        .read<PrivilegeCubit>()
                                        .checkPrivilege('71')
                                    ? Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          kMainColor)),
                                              onPressed: () async {
                                                Provider.of<ticket_vm>(context,
                                                        listen: false)
                                                    .updateTicketvm({
                                                  'fk_user_recive':
                                                      Provider.of<UserProvider>(
                                                              context,
                                                              listen: false)
                                                          .currentUser
                                                          .idUser
                                                          .toString(),
                                                  'date_recive':
                                                      DateTime.now().toString(),
                                                  'type_ticket': 'قيد التنفيذ'
                                                }, widget.ticketModel.idTicket);
                                                Navigator.pop(context);
                                              },
                                              child: Text('استلام التذكرة')),
                                        ),
                                      )
                                    : Container()
                                : Container(),
                            widget.ticketModel.dateClose == null
                                ? context
                                        .read<PrivilegeCubit>()
                                        .checkPrivilege('72')
                                    ? Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          kMainColor)),
                                              onPressed: () async {
                                                await showDialog<void>(
                                                    context: context,
                                                    builder: (context) =>
                                                        CloseTicketDialog(
                                                          ticketModel: widget
                                                              .ticketModel,
                                                        ));
                                              },
                                              child: Text('اغلاق التذكرة')),
                                        ),
                                      )
                                    : Container()
                                : Container(),
                            // SizedBox(width: 2,),
                            widget.ticketModel.dateRecive != null &&
                                    widget.ticketModel.dateClose == null
                                ? context
                                        .read<PrivilegeCubit>()
                                        .checkPrivilege('75')
                                    ? Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kMainColor)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          transferClient(
                                                            name_enterprise: widget
                                                                .ticketModel
                                                                .nameEnterprise
                                                                .toString(),
                                                            idclient: widget
                                                                .ticketModel
                                                                .fkClient
                                                                .toString(),
                                                            idticket: widget
                                                                .ticketModel
                                                                .idTicket,
                                                            type: "ticket",
                                                          ),
                                                      fullscreenDialog: true));
                                            },
                                            child: Text('تحويل التذكرة'),
                                          ),
                                        ),
                                      )
                                    : Container()
                                : Container(),
                            SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kMainColor)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => ProfileClient(
                                                idClient: widget
                                                    .ticketModel.fkClient
                                                    .toString(),
                                              )));
                                },
                                child: Text('ملف العميل'),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            widget.ticketModel.dateClose != null &&
                                    widget.ticketModel.date_rate == null
                                ? Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kMainColor)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    ticket_rate(
                                                      ticket_model:
                                                          widget.ticketModel,
                                                    )));
                                      },
                                      child: Text('تقييم بعد الإغلاق'),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )
                    : Container(),

                widget.ticketModel.dateClose != null
                    ? cardRowDivided(
                        title: 'قام بإغلاق التذكرة ',
                        value: getnameshort(
                            widget.ticketModel.nameuserclose.toString()))
                    : Container(),

                widget.ticketModel.dateClose != null
                    ? cardRowDivided(
                        title: 'تاريخ إغلاق التذكرة ',
                        value: widget.ticketModel.dateClose.toString())
                    : Container(),

                widget.ticketModel.dateClose != null
                    ? cardRowDivided(
                        title: '  ملاحظات إغلاق التذكرة ',
                        value: widget.ticketModel.notesTicket.toString(),
                        isExpanded: true,
                      )
                    : Container(),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                for (int i = 0;
                    i < widget.ticketModel.transferticket!.length;
                    i++)
                  _tranferall(
                      widget.ticketModel.transferticket![i]!.nameuserto
                          .toString(),
                      widget.ticketModel.transferticket![i]!.nameuserfrom
                          .toString(),
                      widget.ticketModel.transferticket![i]!.date_assigntr
                          .toString(),
                      widget
                          .ticketModel.transferticket![i]!.resoantransfer_ticket
                          .toString()),

                widget.ticketModel.dateRecive != null
                    ? cardRowDivided(
                        title: 'قام باستلام التذكرة ',
                        value: getnameshort(
                            widget.ticketModel.nameuserrecive.toString()))
                    : Container(),
                widget.ticketModel.dateRecive != null
                    ? cardRowDivided(
                        title: 'تاريخ استلام التذكرة ',
                        value: widget.ticketModel.dateRecive.toString())
                    : Container(),

                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                cardRowDivided(
                    title: 'قام بفتح التذكرة ',
                    value: getnameshort(
                        widget.ticketModel.nameuseropen.toString())),
                cardRowDivided(
                    title: 'تاريخ فتح التذكرة ',
                    value: widget.ticketModel.dateOpen.toString()),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                cardRowDivided(
                    title: 'نوع التذكرة',
                    value: widget.ticketModel.typeProblem.toString()),
                cardRowDivided(
                    title: 'مصدر التذكرة',
                    value: widget.ticketModel.ticketSource?.text),
                cardRowDivided(
                  title: 'تفاصيل التذكرة',
                  value: widget.ticketModel.detailsProblem.toString(),
                  isExpanded: true,
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                //cardRowDivided( title: 'تقييم بعد الإغلاق',value:  ticketModel.rate.toString()),
                widget.ticketModel.date_rate != null
                    ? Row(
                        children: [
                          Text('تقييم بعد الإغلاق'),
                          RatingBar.builder(
                            initialRating: double.parse(
                                widget.ticketModel.rate.toString()),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            // glow: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      )
                    : Container(),

                widget.ticketModel.date_rate != null
                    ? cardRowDivided(
                        title: 'قام بالتقييم',
                        value: widget.ticketModel.nameuserrate.toString())
                    : Container(),

                widget.ticketModel.date_rate != null
                    ? cardRowDivided(
                        title: 'تاريخ التقييم',
                        value: widget.ticketModel.date_rate.toString())
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
  List<CategoryModel> selectedCategories = [];
  List<SubCategoryModel> selectedSubCategories = [];

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
                            if (value.toString().trim().isEmpty) {
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
                                      .idUser
                                      .toString(),
                                  'date_close': DateTime.now().toString(),
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
