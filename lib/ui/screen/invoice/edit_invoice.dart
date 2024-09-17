import 'dart:ui' as ii;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/enums.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/location/branch_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/custom_dropdown.dart';
import '../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/datetime_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/app_separator_dots_line.dart';
import '../../widgets/custom_widget/card_row.dart';

class EditInvoice extends StatefulWidget {
  const EditInvoice({
    required this.invoiceModel,
    Key? key,
  }) : super(key: key);
  final InvoiceModel invoiceModel;

  @override
  State<EditInvoice> createState() => _EditInvoiceState();
}

class _EditInvoiceState extends State<EditInvoice> {
  String? iduser;

  String? regoin;
  String? regoininvoice;
  DateTime? _currentDateApprove;
  DateTime _currentDateCreate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _handleApprovingInvoiceDate(
      BuildContext context, DateTime? pickedDate) async {
    if (pickedDate != null) //&& pickedDate != currentDate)
    {
      setState(() {
        _currentDateApprove = pickedDate;
      });
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(_currentDateApprove!);
    }
  }

  void _handleCreatingInvoiceDate(BuildContext context, DateTime? pickedDate) {
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDateCreate = pickedDate;
      });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue2(_currentDateCreate);
  }

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    iduser = widget.invoiceModel.fkIdUser.toString();
    regoin = widget.invoiceModel.fk_regoin.toString();
    regoininvoice = widget.invoiceModel.fk_regoin_invoice.toString();

    if (widget.invoiceModel.date_approve != null) {
      _currentDateApprove =
          DateTime.parse(widget.invoiceModel.date_approve.toString());
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(_currentDateApprove!);
    }
    _currentDateCreate =
        DateTime.parse(widget.invoiceModel.dateCreate.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue2(_currentDateCreate);
      Provider.of<RegionProvider>(context, listen: false).changeVal(regoin);
      Provider.of<UserProvider>(context, listen: false).changeValUserID(iduser);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تغيير بيانات الفاتورة'),
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<InvoiceVm>(context, listen: true).isloadingdone,
        child: Directionality(
          textDirection: ii.TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('الموظف'),
                  5.height,
                  Consumer<UserProvider>(
                    builder: (context, cart, child) {
                      return CustomSearchableDropDown<UserModel>(
                        hint: 'الموظف',
                        items: cart.usersSalesManagement,
                        itemAsString: (u) => u!.userAsString(),
                        onChanged: (data) {
                          iduser = data!.idUser;
                          cart.changeValUserID(data.idUser);
                        },
                        selectedItem: cart.selectedUser,
                        filterFn: (user, filter) => user.getfilteruser(filter),
                      );
                    },
                  ),
                  10.height,
                  AppText('الفرع'),
                  5.height,
                  Consumer<RegionProvider>(
                    builder: (context, cart, child) {
                      return CustomDropDown<BranchModel>(
                        hint: 'الفرع',
                        items: cart.listRegionFilter,
                        itemAsString: (branch) => branch!.branchName,
                        selectedItem: cart.listRegionFilter.firstWhereOrNull(
                          (element) => element.branchId == regoin,
                        ),
                        onChanged: (data) {
                          cart.changeVal(data!.branchId);
                          regoininvoice = data.branchId;
                        },
                      );
                    },
                  ),
                  10.height,
                  AppText('تاريخ عقد الإشتراك'),
                  5.height,
                  CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: TextEditingController(
                        text: HelperFunctions.formatDate(
                            widget.invoiceModel.dateCreate)),
                    onDateChange: (dateTime, formattedDate) {
                      _handleCreatingInvoiceDate(context, dateTime);
                    },
                    style2: true,
                  ),
                  10.height,
                  AppText('تاريخ اعتماد الفاتورة'),
                  5.height,
                  CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: TextEditingController(
                        text: HelperFunctions.formatDate(
                            widget.invoiceModel.date_approve)),
                    onDateChange: (dateTime, formattedDate) {
                      _handleApprovingInvoiceDate(context, dateTime);
                    },
                    style2: true,
                  ),
                  10.height,
                  AppSeparatorDotsLine(),
                  20.height,
                  CardRow(
                      title: 'تاريخ عقد الإشتراك',
                      value: widget.invoiceModel.dateCreate.toString()),
                  widget.invoiceModel.date_approve != null
                      ? CardRow(
                          title: 'تاريخ اعتماد الفاتورة',
                          value: widget.invoiceModel.date_approve.toString())
                      : Container(),
                  widget.invoiceModel.dateinstall_task != null
                      ? CardRow(
                          title: 'تاريخ التركيب',
                          value:
                              widget.invoiceModel.dateinstall_task.toString())
                      : Container(),
                  10.height,
                  AppElevatedButton(
                    text: 'تعديل',
                    width: double.infinity,
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        Provider.of<InvoiceVm>(context, listen: false)
                            .edit_invoice({
                          "name_enterprise":
                              widget.invoiceModel.name_enterprise,
                          "name_client":
                              widget.invoiceModel.nameClient.toString(),
                          "fk_client":
                              widget.invoiceModel.fkIdClient.toString(),
                          'date_create': _currentDateCreate.toString(),
                          'date_approve': _currentDateApprove.toString(),
                          'fk_idUser': iduser.toString(),
                          'fk_regoin_invoice': regoininvoice.toString(),
                          'fk_regoin': regoin.toString(),
                          'fkcountry':
                              widget.invoiceModel.fk_country.toString(),

                          "lastuserupdate":
                              Provider.of<UserProvider>(context, listen: false)
                                  .currentUser
                                  .idUser
                                  .toString(),
                          "lastnameuser":
                              Provider.of<UserProvider>(context, listen: false)
                                  .currentUser
                                  .nameUser
                                  .toString(),

                          "id_invoice": widget.invoiceModel.idInvoice,

                          'date_lastuserupdate': DateTime.now().toString(),
                          //"date_changetype":,
                        }, widget.invoiceModel.idInvoice);
                      }
                      ;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
