import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/animated_dialog.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/config/theme/theme.dart';
import '../../../model/calendar/event.dart';
import '../../../view_model/datetime_vm.dart';
import '../../widgets/custom_widget/row_edit.dart';
import 'calendar_of_customer_visit_schedule.dart';

class calender_client extends StatefulWidget {
  calender_client({Key? key}) : super(key: key);

  @override
  _calender_clientState createState() => _calender_clientState();
}

late ClientModel? clientModel = null;
int isSelectedtypeinstall = 0;
late String idclient;
List<InvoiceModel> listfilter = [];

List<int> listval = [];
int idexist = -1;
DateTime _currentDate = DateTime.now();

class _calender_clientState extends State<calender_client> {
  @override
  Future<void> didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      context.read<ClientProvider>().changevalueclient(null);
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(DateTime(1,1,1));
      await Provider.of<UserProvider>(context, listen: false).getUsersVm();

      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      await Provider.of<ClientProvider>(context, listen: false).getClientDateTable_vm();
      Provider.of<EventProvider>(context, listen: false)
          .setvalueClient(Provider.of<ClientProvider>(context, listen: false).listClientAccept);
      Provider.of<EventProvider>(context, listen: false).getevent_AllClient();
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kMainColor,
      //   onPressed: () {
      //     Navigator.push(context, CupertinoPageRoute(
      //         builder: (context)=>
      //             EventEditingPage()));
      //     //Get.to(EventEditingPage());
      //   },
      //   tooltip: 'إضافة تقويم',
      //   child: Icon(Icons.add),
      // ),

      appBar: AppBar(
        title: Text(
          ' جدول زيارات العملاء ',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            child: Selector2<UserProvider, ClientProvider, bool>(
              selector: (_, p1, p2) => p1.isLoading || p2.isloading,
              builder: (context, value, child) {
                if (value) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientProvider>(
                        builder: (context, cart, child) {
                          return Row(
                            children: [
                              if (cart.selectedclient != null) ...{
                                IconButton(
                                  onPressed: () {
                                    context.read<ClientProvider>().changevalueclient(null);
                                    Provider.of<EventProvider>(context, listen: false).getevent_AllClient();
                                  },
                                  icon: Icon(Icons.highlight_off, color: Colors.grey.shade600),
                                ),
                                SizedBox(width: 10),
                              },
                              Expanded(
                                child: DropdownSearch<ClientModel>(
                                  mode: Mode.DIALOG,
                                  // label: " الموظف ",
                                  //hint: 'الموظف',
                                  //onFind: (String filter) => cart.getfilteruser(filter),
                                  filterFn: (user, filter) => user!.getfilteruser(filter!),
                                  //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                  // itemAsString: (UserModel u) => u.userAsStringByName(),
                                  items: cart.listClientAccept,
                                  // items: cart.listClient,
                                  compareFn: (item, selectedItem) => item?.idClients == selectedItem?.idClients,
                                  showSelectedItems: true,
                                  itemAsString: (u) => u!.userAsString(),
                                  onChanged: (data) {
                                    setState(() {
                                      clientModel = data!;
                                      idclient = data!.idClients!;


                                    });
                                    context.read<ClientProvider>().changevalueclient(data);
                                    Provider.of<EventProvider>(context, listen: false).getevent_Client(idclient);
                                    // Provider.of<client_vm>(context, listen: false)
                                    //     .getclientfilter_Local(iduser!,"user");
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
                                    border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                    // OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     borderSide: const BorderSide( color: Colors.white)),
                                  ),
                                  // InputDecoration(border: InputBorder.none),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //
                    //
                    //
                    //     // Expanded(
                    //     //   child: Padding(
                    //     //     padding: const EdgeInsets.only(left: 20.0,right: 8),
                    //     //     child: Consumer<user_vm_provider>(
                    //     //       builder: (context, cart, child){
                    //     //         return  DropdownSearch<UserModel>(
                    //     //           mode: Mode.DIALOG,
                    //     //           // label: " الموظف ",
                    //     //           //hint: 'الموظف',
                    //     //           //onFind: (String filter) => cart.getfilteruser(filter),
                    //     //           filterFn: (user, filter) => user!.getfilteruser(filter!),
                    //     //           //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                    //     //           // itemAsString: (UserModel u) => u.userAsStringByName(),
                    //     //           items: cart.userall,
                    //     //           itemAsString: (u) => u!.userAsString(),
                    //     //           onChanged: (data) {
                    //     //             iduser=data!.idUser!;
                    //     //             Provider.of<EventProvider>(context, listen: false)
                    //     //                 .getevents(iduser,[],"user");
                    //     //             // Provider.of<client_vm>(context, listen: false)
                    //     //             //     .getclientfilter_Local(iduser!,"user");
                    //     //
                    //     //           } ,
                    //     //           selectedItem: cart.selecteduser,
                    //     //           showSearchBox: true,
                    //     //           dropdownSearchDecoration:
                    //     //           InputDecoration(
                    //     //             //filled: true,
                    //     //             isCollapsed: true,
                    //     //             hintText: 'الموظف',
                    //     //             alignLabelWithHint: true,
                    //     //             fillColor:  Colors.grey.withOpacity(0.2),
                    //     //             //labelText: "choose a user",
                    //     //             contentPadding: EdgeInsets.all(0),
                    //     //             //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    //     //             // focusedBorder: OutlineInputBorder(
                    //     //             //     borderRadius: BorderRadius.circular(10),
                    //     //             //     borderSide: const BorderSide(color: Colors.white)),
                    //     //             border:
                    //     //             UnderlineInputBorder(
                    //     //                 borderSide: const BorderSide(  color: Colors.grey)
                    //     //             ),
                    //     //             // OutlineInputBorder(
                    //     //             //     borderRadius: BorderRadius.circular(10),
                    //     //             //     borderSide: const BorderSide( color: Colors.white)),
                    //     //           ),
                    //     //           // InputDecoration(border: InputBorder.none),
                    //     //
                    //     //         );
                    //     //
                    //     //       },
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    SizedBox(height: 25),
                    Expanded(child: CalendarOfCustomerVisitSchedule()),
                    // CalendarWidget(type: 'client', clientModel: clientModel),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<ClientProvider>(
        builder: (context, clientVm, _) {
          if (clientVm.selectedclient == null) {
            return const SizedBox.shrink();
          }
          return FloatingActionButton(
            onPressed: () =>
                AnimatedDialog.show(context, child: SizedBox(height: 250, child: dialog(clientVm.selectedclient!))),
            child: Icon(Icons.schedule_send_rounded,color: AppColors.white),
          );
        },
      ),
    );
  }

  Widget dialog(
    ClientModel client,
  ) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(child: Text('جدولة زيارات العميل', style: TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RowEdit(name: " تاريخ الزيارة ", des: '*'),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                        hintText: Provider.of<datetime_vm>(context, listen: true).valuedateTime.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          selectDate(context, _currentDate);
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      child: Center(
                        child: Consumer<ClientProvider>(builder: (context, clientVm, _) {
                          if (clientVm.isloading) {
                            return CircularProgressIndicator();
                          }

                          return ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              Provider.of<ClientProvider>(context, listen: false).updateclient_vm(
                                {
                                  "date_visit_Client": _currentDate.toString(), //DateTime.now().toString(),
                                },
                                client.idClients.toString(),
                                onSuccess: (value) {
                                  DateTime temp = DateTime.parse(value.date_visit_Client.toString()).hour >= 21
                                      ? DateTime.parse(value.date_visit_Client.toString()).subtract(Duration(hours: 3))
                                      : DateTime.parse(value.date_visit_Client.toString());

                                  final event = Event(
                                      fkIdClient: value.idClients,
                                      title: value.nameEnterprise.toString(),
                                      description: 'description',
                                      from: temp,
                                      to: temp.add(Duration(hours: 2)),
                                      idinvoice: null);

                                  Provider.of<EventProvider>(context, listen: false)
                                    ..setvalue_save()
                                    ..checkAndActionEvent(event);
                                  Navigator.of(context, rootNavigator: true).pop(false);
                                },
                              );
                            },
                            child: Text('حفظ موعد الزيارة'),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Future<void> selectDate(BuildContext context, DateTime currentDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null) {
      setState(() {
        _currentDate = pickedDate;
      });
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDate);
    }
  }
}
