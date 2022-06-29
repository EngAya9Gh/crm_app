import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ticketAdd extends StatefulWidget {
  ticketAdd({this.fk_client, Key? key}) : super(key: key);
  String? fk_client;
  @override
  _ticketAddState createState() => _ticketAddState();
}

class _ticketAddState extends State<ticketAdd> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController problem_desc = TextEditingController();
  //final TextEditingController notes = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  late String name_enterprise;
  late String name_regoin;
  late String name_country;

  @override
  void dispose() {
    problem_desc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<client_vm>(context,listen: false).getclient_Local('مشترك');
      Provider.of<client_vm>(context,listen: false).changevalueclient(null);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   Provider.of<typeclient>(context,listen: false).getreasons('ticket');
    //});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ticket_vm>(context, listen: true).addvalue,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 150, right: 20, left: 20, bottom: 150),
                  child: ContainerShadows(
                    width: double.infinity,
                    //height: 400,
                    margin: EdgeInsets.only(),
                    padding: EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        RowEdit(name: 'اسم العميل', des: 'REQUIRED'),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                          ),
                          child: Consumer<client_vm>(
                            builder: (context, cart, child) {
                              return DropdownSearch<ClientModel>(
                                mode: Mode.DIALOG,
                                // label: " الموظف ",
                                //hint: 'الموظف',
                                //onFind: (String filter) => cart.getfilteruser(filter),
                                filterFn: (user, filter) =>
                                    user!.getfilteruser(filter!),
                                //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                // itemAsString: (UserModel u) => u.userAsStringByName(),
                                items: cart.listClientAccept,
                                itemAsString: (u) => u!.userAsString(),
                                onChanged: (data) {
                                  widget.fk_client = data!.idClients;
                                  cart.changevalueclient(data);
                                  name_enterprise=data.nameEnterprise!;
                                  name_regoin=data.name_regoin!;
                                  name_country=data.nameCountry!;
                                  //filtershow();
                                },
                                selectedItem: cart.selectedclient,
                                showSearchBox: true,
                                dropdownSearchDecoration: InputDecoration(
                                  //filled: true,
                                  isCollapsed: true,
                                  hintText: 'العميل',
                                  alignLabelWithHint: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  //labelText: "choose a user",
                                  contentPadding: EdgeInsets.all(0),
                                  //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  // focusedBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     borderSide: const BorderSide(color: Colors.white)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  // OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     borderSide: const BorderSide( color: Colors.white)),
                                ),
                                // InputDecoration(border: InputBorder.none),
                              );
                            },
                          ),
                        ),
                        RowEdit(name: 'نوع المشكلة', des: 'REQUIRED'),

                        Consumer<typeclient>(
                          builder: (context, cart, child) {
                            return SizedBox(
                              //width: 240,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey))),

                                isExpanded: true,
                                //hint: Text("حدد حالة العميل"),
                                items: cart.type_of_out.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(
                                        level_one.nameReason), //label of item
                                    value: level_one.nameReason, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedValueOut,
                                onChanged: (value) {
                                  //  setState(() {
                                  cart.changevalueOut(value.toString());
                                  // });
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // RowEdit(name: 'ملاحظات ', des: ''),
                        //
                        // EditTextFormField(
                        //   vaild: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'الحقل فارغ';
                        //     }
                        //   },
                        //   hintText: '',
                        //   controller: notes,
                        //   maxline: 3,
                        // ),
                        //SizedBox(height: 15,),
                        RowEdit(name: 'وصف المشكلة', des: ''),
                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: problem_desc,
                          maxline: 4,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                            width: double.infinity,
                            //MediaQuery.of(context).size.width * 0.2,
                            text: 'حفظ',
                            onTap: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                if (widget.fk_client != null) {
                                  bool isav= await Provider.of<ticket_vm>(context, listen: false)
                                      .addticket({
                                    'name_enterprise': name_enterprise,
                                    'fk_client': widget.fk_client.toString(),
                                    'type_problem': Provider
                                        .of<typeclient>(
                                        context,
                                        listen: false)
                                        .selectedValueOut
                                        .toString(),
                                    'details_problem': problem_desc.text,
                                    //'notes_ticket': notes.text,
                                    'type_ticket': 'جديدة',
                                    'fk_user_open':
                                    Provider
                                        .of<user_vm_provider>(context,
                                        listen: false)
                                        .currentUser
                                        .idUser
                                        .toString(),
                                    'date_open': DateTime.now().toString(),
                                    'client_type': '0',
                                    'fk_regoin': '',
                                    'fkcountry': '',
                                    'nameUser': Provider
                                        .of<user_vm_provider>
                                      (context, listen: false)
                                        .currentUser
                                        .nameUser
                                        .toString(),

                                  },widget.fk_client.toString()
                                    // : error(context)
                                  );
                                  if(isav) {clear(context);}else{
                                  _scaffoldKey.currentState!.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                           'لا يمكن فتح تذكرة لعميل لديه تذكرة غير مغلقة')));
                                }
                                } else {
                                  _scaffoldKey.currentState!.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'من فضلك تأكد من عملية الإدخال')));

                              }}}
                              //child: Text(" حفظ"),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  clear(BuildContext context) {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text('تم إنشاء تذكرة جديد')));
    Navigator.pop(context);
    // print("succ");
  }

  error(context) {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
    print("error");
  }
}
