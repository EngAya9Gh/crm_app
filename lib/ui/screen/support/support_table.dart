import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/widgets/user_installation_calendar.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class support_table extends StatefulWidget {
  const support_table({Key? key}) : super(key: key);

  @override
  _support_tableState createState() => _support_tableState();
}

int isSelectedtypeinstall = 0;
late String iduser;
List<InvoiceModel> listfilter = [];

List<int> listval = [];
int idexist = -1;

late EventProvider _eventProvider;

class _support_tableState extends State<support_table> {
  @override
  Future<void> didChangeDependencies() async {
    context.read<MainCityProvider>().changeitemlist([], isInit: true);

    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      _eventProvider = context.read<EventProvider>();
      Provider.of<UserProvider>(context, listen: false)
        ..changevalueuser(null, true)
        ..getUsersVm();
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      _eventProvider
        ..resetFilter()
        ..setFkCountry(context.read<UserProvider>().currentUser.fkCountry!)
        ..getAppointments();

      // await Provider.of<invoice_vm>(context, listen: false).getfilter_maincity([], 'الكل');
      //
      // Provider.of<EventProvider>(context, listen: false)
      //     .setvalue(Provider.of<invoice_vm>(context, listen: false).listInvoicesAccept);
      //
      // Provider.of<EventProvider>(context,listen: false). getevent_vm();
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
          ' جدول التركيب للعملاء ',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child:
                      // Consumer<maincity_vm>(
                      //   builder: (context, cart, child) {
                      //     return
                      //       DropdownButton(
                      //         isExpanded: true,
                      //         hint: Text("المناطق"),
                      //         items: cart.listmaincity.map((level_one) {
                      //           return DropdownMenuItem(
                      //             child: Text(level_one.namemaincity),
                      //             //label of item
                      //             value: level_one
                      //                 .id_maincity, //value of item
                      //           );
                      //         }).toList(),
                      //         value: cart.selectedValuemanag,
                      //         onChanged: (value) {
                      //           //  setState(() {
                      //         cart.changevalue(value.toString());
                      //               Provider.of<EventProvider>(context, listen: false)
                      //                 .getevents(value.toString(),"regoin");
                      //         },
                      //       );
                      //     //);
                      //   },
                      // ),
                      Consumer<MainCityProvider>(
                    builder: (context, cart, child) {
                      return DropdownSearch<MainCityModel>.multiSelection(
                        mode: Mode.DIALOG,
                        filterFn: (user, filter) =>
                            user!.getfilteruser(filter!),
                        compareFn: (item, selectedItem) =>
                            item?.id_maincity == selectedItem?.id_maincity,
                        // itemAsString: (UserModel u) => u.userAsStringByName(),
                        items: cart.listmaincityfilter,
                        showSelectedItems: true,
                        selectedItems: cart.selectedRegions,
                        itemAsString: (u) => u!.userAsString(),
                        onChanged: (data) {
                          for (int i = 0; i < data.length; i++)

                            // selecteditemmaincity=data;

                            cart.changeitemlist(data);

                          if (data
                              .any((element) => element.id_maincity == '0')) {
                            _eventProvider.onChangeFkMainCity(cart
                                .listmaincityfilter
                                .where((element) => element.id_maincity != "0")
                                .map((e) => e.id_maincity)
                                .toList());
                          } else {
                            _eventProvider.onChangeFkMainCity(
                                data.map((e) => e.id_maincity).toList());
                          }
                          // Provider.of<EventProvider>(context, listen: false).getevents('', data, "regoin");
                        },
                        //selectedItem: cart.selecteduser,
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          //filled: true,
                          isCollapsed: true,
                          hintText: 'المنطقة',
                          alignLabelWithHint: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          //labelText: "choose a user",
                          contentPadding: EdgeInsets.all(0),
                          //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          // focusedBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //     borderSide: const BorderSide(color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey)),
                          // OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //     borderSide: const BorderSide( color: Colors.white)),
                        ),
                        // InputDecoration(border: InputBorder.none),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Consumer2<UserProvider, EventProvider>(
                    builder: (context, user, event, child) {
                      return Row(
                        children: [
                          if (event.selectedFkUser != null &&
                              event.appointmentsState.isSuccess) ...{
                            IconButton(
                              onPressed: () {
                                context
                                    .read<UserProvider>()
                                    .changevalueuser(null);
                                _eventProvider.onChangeFkUser('');
                              },
                              icon: Icon(Icons.highlight_off),
                            ),
                            SizedBox(width: 10),
                          },
                          Expanded(
                            child: DropdownSearch<UserModel>(
                              mode: Mode.DIALOG,
                              // label: " الموظف ",
                              //hint: 'الموظف',
                              //onFind: (String filter) => cart.getfilteruser(filter),
                              filterFn: (user, filter) =>
                                  user!.getfilteruser(filter!),
                              compareFn: (item, selectedItem) =>
                                  item?.idUser == selectedItem?.idUser,
                              showSelectedItems: true,
                              // itemAsString: (UserModel u) => u.userAsStringByName(),
                              items: user.usersSupportManagement,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                iduser = data!.idUser!;
                                context
                                    .read<UserProvider>()
                                    .changevalueuser(data);
                                _eventProvider.onChangeFkUser(iduser);
                                // Provider.of<EventProvider>(context, listen: false).getevents(iduser, [], "user");

                                // Provider.of<client_vm>(context, listen: false)
                                //     .getclientfilter_Local(iduser!,"user");
                              },
                              selectedItem: user.selectedUser,
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                //filled: true,
                                isCollapsed: true,
                                hintText: 'الموظف',
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
                //     // Expanded(
                //     //   child: Padding(
                //     //     padding: const EdgeInsets.only(
                //     //         top: 15,
                //     //         left: 8.0, right: 8),
                //     //     child: Consumer<regoin_vm>(
                //     //       builder: (context, cart, child) {
                //     //         return
                //     //           DropdownButton(
                //     //             isExpanded: true,
                //     //             hint: Text("الفرع"),
                //     //             items: cart.listregoinfilter.map((level_one) {
                //     //               return DropdownMenuItem(
                //     //
                //     //                 child: Text(level_one.name_regoin),
                //     //                 //label of item
                //     //                 value: level_one
                //     //                     .id_regoin, //value of item
                //     //               );
                //     //             }).toList(),
                //     //             value: cart.selectedValueLevel,
                //     //             onChanged: (value) {
                //     //               //  setState(() {
                //     //               cart.changeVal(value.toString());
                //     //               // Provider.of<client_vm>(context, listen: false)
                //     //               //     .getclientfilter_Local(value.toString(),"regoin");
                //     //               Provider.of<EventProvider>(context, listen: false)
                //     //                   .getevents(value.toString(),"regoin");
                //     //
                //     //             },
                //     //           );
                //     //         //);
                //     //       },
                //     //     ),
                //     //   ),
                //     // ),
                //
                //     //privilge.checkprivlge('15')==true|| privilge.checkprivlge('8')==true? //user
                //     // Expanded(
                //     //     child: Padding(
                //     //       padding: const EdgeInsets.only(left: 8.0,right: 8),
                //     //       child: Consumer<user_vm_provider>(
                //     //         builder: (context, cart, child){
                //     //           return  DropdownSearch<UserModel>(
                //     //             mode: Mode.DIALOG,
                //     //             label: " الموظف ",
                //     //
                //     //             //onFind: (String filter) => cart.getfilteruser(filter),
                //     //             filterFn: (user, filter) => user!.getfilteruser(filter!),
                //     //             //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                //     //             // itemAsString: (UserModel u) => u.userAsStringByName(),
                //     //             items: cart.userall,
                //     //             itemAsString:
                //     //                 ( u) => u!.userAsString(),
                //     //
                //     //             // selectedItem: cart.currentUser,
                //     //             onChanged: (data) {
                //     //               iduser=data!.idUser!;
                //     //               Provider.of<EventProvider>(context, listen: false)
                //     //                   .getevents(iduser,"user");
                //     //               // Provider.of<client_vm>(context, listen: false)
                //     //               //     .getclientfilter_Local(iduser!,"user");
                //     //             } ,
                //     //             showSearchBox: true,
                //     //             dropdownSearchDecoration:
                //     //             InputDecoration(
                //     //               fillColor:  Colors.grey.withOpacity(0.2),
                //     //               labelText: "choose a user",
                //     //               contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //     //               focusedBorder: OutlineInputBorder(
                //     //                   borderRadius: BorderRadius.circular(10),
                //     //                   borderSide: const BorderSide(color: Colors.white)),
                //     //               border:OutlineInputBorder(
                //     //                   borderRadius: BorderRadius.circular(10),
                //     //                   borderSide: const BorderSide(color: Colors.white)),
                //     //             ),
                //     //           );
                //     //
                //     //         },
                //     //       ),
                //     //     )
                //     // ),
                //     // :Container(),
                //   ],
                // ),
                SizedBox(height: 5),
                Selector<EventProvider, PageState<List<AppointmentModel>>>(
                  selector: (_, p1) => p1.appointmentsState,
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (value.isFailure) {
                      return Center(
                        child: IconButton(
                          onPressed: () => _eventProvider.getAppointments(),
                          icon: Icon(Icons.refresh),
                        ),
                      );
                    }
                    return Expanded(child: USerInstallationCalendar());
                  },
                ),

                // CalendarWidget_install(type: 'invoice'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
