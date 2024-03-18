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

import '../../../../constants.dart';
import '../../../../core/common/enums/ticket_source_enum.dart';
import '../../client/profileclient.dart';

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
  TicketSourceEnums? ticketSource;

  @override
  void dispose() {
    problem_desc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ClientProvider>(context, listen: false)
          .getclient_Accept();
      Provider.of<ClientProvider>(context, listen: false)
          .changevalueclient(null);
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
        appBar: AppBar(),
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ticket_vm>(context, listen: true).addvalue,
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 50),
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
                        RowEdit(name: 'اسم العميل', des: '*'),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                          ),
                          child: Consumer<ClientProvider>(
                            builder: (context, cart, child) {
                              return DropdownSearch<ClientModel1>(
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
                                  name_enterprise = data.nameEnterprise!;
                                  name_regoin = data.name_regoin!;
                                  name_country = data.nameCountry!;
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
                        // RowEdit(name: 'بروفايل العميل', des: ''),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kMainColor)),
                          onPressed: () {
                            if (widget.fk_client != null)
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ProfileClient(
                                            idClient:
                                                widget.fk_client.toString(),
                                          )));
                          },
                          child: Text('ملف العميل'),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        RowEdit(name: 'نوع المشكلة', des: '*'),

                        Consumer<ClientTypeProvider>(
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

                        RowEdit(name: 'مصدر التذكرة', des: ''),
                        _ticketSourceDropDown(),

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
                          vaildator: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: problem_desc,
                          maxline: 4,
                        ),
                        SizedBox(height: 15),
                        CustomButton(
                            width: double.infinity,
                            //MediaQuery.of(context).size.width * 0.2,
                            text: 'حفظ',
                            onTap: () async {
                              print("sources => $ticketSource");
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                if (widget.fk_client != null) {
                                  bool isav = await Provider.of<ticket_vm>(
                                          context,
                                          listen: false)
                                      .addticket({
                                    'ticket_source': ticketSource?.name,
                                    'name_enterprise': name_enterprise,
                                    'fk_client': widget.fk_client.toString(),
                                    'type_problem':
                                        Provider.of<ClientTypeProvider>(context,
                                                listen: false)
                                            .selectedValueOut
                                            .toString(),
                                    'details_problem': problem_desc.text,
                                    //'notes_ticket': notes.text,
                                    'type_ticket': 'جديدة',
                                    'fk_user_open': Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .currentUser
                                        .idUser
                                        .toString(),
                                    'date_open': DateTime.now().toString(),
                                    'client_type': '0',
                                    'fk_regoin': '',
                                    'fkcountry': '',
                                    'nameUser': Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .currentUser
                                        .nameUser
                                        .toString(),
                                  }, widget.fk_client.toString()
                                          // : error(context)
                                          );
                                  if (isav) {
                                    clear(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'لا يمكن فتح تذكرة لعميل لديه تذكرة غير مغلقة')));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'من فضلك تأكد من عملية الإدخال')));
                                }
                              }
                            }
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

  SizedBox _ticketSourceDropDown() {
    return SizedBox(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: Colors.grey))),

        isExpanded: true,
        hint: Text("مصدر التذكرة"),
        items: TicketSourceEnums.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.name),
                  value: e.name,
                ))
            .toList(),
        // value: cart.selectedValueOut,
        onChanged: (value) {
          ticketSource =
              TicketSourceEnumsExtension.fromString(value.toString());
        },
      ),
    );
  }

  clear(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('تم إنشاء تذكرة جديد')));
    Navigator.pop(context);
    //
  }

  error(context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }
}
