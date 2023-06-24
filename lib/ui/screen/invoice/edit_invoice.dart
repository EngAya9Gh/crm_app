import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/datetime_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/RowWidget.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/custom_widget/text_form.dart';
import 'dart:ui' as ii;
class edit_invoice extends StatefulWidget {
  edit_invoice({required this.invoiceModel, Key? key}) : super(key: key);
  InvoiceModel invoiceModel;

  @override
  State<edit_invoice> createState() => _edit_invoiceState();
}

class _edit_invoiceState extends State<edit_invoice> {
  String? iduser;

  String? regoin;
  DateTime? _currentDateApprove;
  DateTime _currentDateCreate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3000));
    if (pickedDate != null) //&& pickedDate != currentDate)
    {
      setState(() {
        _currentDateApprove = pickedDate;
      });
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDateApprove!);
    }
  }

  Future<void> _selectDate2(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3000));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDateCreate = pickedDate;
      });
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalue2(_currentDateCreate);
  }

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    iduser = widget.invoiceModel.fkIdUser.toString();
    regoin = widget.invoiceModel.fk_regoin.toString();

    if (widget.invoiceModel.date_approve != null) {
      _currentDateApprove = DateTime.parse(widget.invoiceModel.date_approve.toString());
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDateApprove!);
    }
    _currentDateCreate = DateTime.parse(widget.invoiceModel.dateCreate.toString());
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalue2(_currentDateCreate);
    Provider.of<regoin_vm>(context, listen: false).changeVal(regoin);
    Provider.of<user_vm_provider>(context, listen: false).changeValUserID(iduser);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<invoice_vm>(context, listen: true).isloadingdone,
        child: Directionality(
          textDirection: ii.TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.only(top: 100, right: 20, left: 20),
              child: Column(
                children: [
                  Text(
                    'تغيير بيانات الفاتورة',
                    style: TextStyle(fontFamily: kfontfamily2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: 'الموظف', des: ''),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                    ),
                    child: Consumer<user_vm_provider>(
                      builder: (context, cart, child) {
                        return DropdownSearch<UserModel>(
                          mode: Mode.DIALOG,
                          // label: " الموظف ",
                          //hint: 'الموظف',
                          //onFind: (String filter) => cart.getfilteruser(filter),
                          filterFn: (user, filter) => user!.getfilteruser(filter!),
                          //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          // itemAsString: (UserModel u) => u.userAsStringByName(),
                          items: cart.userall,
                          itemAsString: (u) => u!.userAsString(),
                          onChanged: (data) {
                            iduser = data!.idUser;
                            cart.changeValUserID(data.idUser);
                          },
                          selectedItem: cart.selecteduser,
                          showSearchBox: true,
                          dropdownSearchDecoration: InputDecoration(
                            //filled: true,
                            isCollapsed: true,
                            hintText: 'الموظف',
                            alignLabelWithHint: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            //labelText: "choose a user",
                            contentPadding: EdgeInsets.all(0),
                            border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                          ),
                          // InputDecoration(border: InputBorder.none),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: 'الفرع', des: ''),
                  Consumer<regoin_vm>(
                    builder: (context, cart, child) {
                      return
                          //   Container(
                          //   height: 57,
                          //   decoration: BoxDecoration(
                          //
                          //        border:Border.all(
                          //
                          //          color: Colors.grey.withOpacity(0.9)
                          //          //width: 1,
                          //        ),
                          //     borderRadius: BorderRadius.all(
                          //       Radius.circular(6.0) //                 <--- border radius here
                          // ),
                          //   ),
                          //   child:
                          //   Container(
                          //     height: 57,
                          //     child:
                          //     DropdownButtonFormField(
                          //
                          //       decoration:InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(10),
                          //               borderSide: BorderSide(
                          //                   width: 1,
                          //                   color: Colors.grey)
                          //           )
                          //       ) ,
                          DropdownButton(
                        isExpanded: true,
                        hint: Text("الفرع"),
                        items: cart.listregoinfilter.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.name_regoin), //label of item
                            value: level_one.id_regoin, //value of item
                          );
                        }).toList(),
                        value: cart.selectedValueLevel,
                        onChanged: (value) {
                          //  setState(() {
                          cart.changeVal(value.toString());
                          regoin = value.toString();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RowEdit(name: 'تاريخ عقد الإشتراك', des: ''),
                  //widget date
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: kMainColor,
                      ),
                      hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                      hintText: //_currentDate.toString(),
                          Provider.of<datetime_vm>(context, listen: true).valuedateTime2.toString(),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        _selectDate2(context, _currentDateCreate);
                      });
                    },
                  ),
                  RowEdit(name: 'تاريخ اعتماد الفاتورة', des: ''),
                  //widget date
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: kMainColor,
                      ),
                      hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                      hintText: //_currentDate.toString(),
                          Provider.of<datetime_vm>(context, listen: true).valuedateTime.toString(),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        _selectDate(context, _currentDateApprove ??
                            DateTime.now());
                      });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  cardRow(title: 'تاريخ عقد الإشتراك', value: widget.invoiceModel.dateCreate.toString()),

                  cardRow(title: 'تاريخ اعتماد الفاتورة', value: widget.invoiceModel.date_approve.toString()),
                  cardRow(title: 'تاريخ التركيب', value: widget.invoiceModel.dateinstall_task.toString()),

                  SizedBox(
                    height: 10,
                  ),

                  CustomButton(
                    text: 'تعديل',
                    onTap: () async {
                      if (_globalKey.currentState!.validate()) {
                        Provider.of<invoice_vm>(context, listen: false)
                            .update_invoiceclient_vm({
                          "name_enterprise": widget.invoiceModel.name_enterprise,
                          "name_client": widget.invoiceModel.nameClient.toString(),
                          'date_create': _currentDateCreate.toString(),
                          'date_approve': _currentDateApprove.toString(),
                          'fk_idUser': iduser.toString(),
                          'fk_regoin_invoice': regoin.toString(),
                          'fk_regoin': regoin.toString(),
                          'fkcountry': widget.invoiceModel.fk_country.toString(),

                          "lastuserupdate":
                              Provider.of<user_vm_provider>(context, listen: false).currentUser.idUser.toString(),
                          "lastnameuser":
                              Provider.of<user_vm_provider>(context, listen: false).currentUser.nameUser.toString(),

                          "id_invoice": widget.invoiceModel.idInvoice,

                          'date_lastuserupdate': DateTime.now().toString(),
                          //"date_changetype":,
                        }, widget.invoiceModel.idInvoice, null, null).then((value) => value != false ? clear() : error());
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

  void clear() {}

  void error() {}
}
