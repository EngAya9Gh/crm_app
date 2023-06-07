import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/calendar/Event_editing_page.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/calendar_widget.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:group_button/group_button.dart';

class calender_client extends StatefulWidget {
  calender_client({Key? key}) : super(key: key);

  @override
  _calender_clientState createState() => _calender_clientState();
}
late ClientModel clientModel;
int isSelectedtypeinstall=0;
late  String idclient;
List<InvoiceModel> listfilter=[];

List<int> listval=[];
int idexist=-1;
class _calender_clientState extends State<calender_client> {
  @override
  Future<void> didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await Provider.of<user_vm_provider>(context,listen: false)
          .getuser_vm();
      print(Provider.of<user_vm_provider>(context,listen: false)
          .userall.length);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);

      Provider.of<EventProvider>(context,listen: false). getevent_vm();
    }
    );

    super.didChangeDependencies();
  }
  @override void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kMainColor,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //         builder: (context)=>
      //             EventEditingPage()));
      //     //Get.to(EventEditingPage());
      //   },
      //   tooltip: 'إضافة تقويم',
      //   child: Icon(Icons.add),
      // ),

      appBar: AppBar(
        title: Text(' جدول زيارات العملاء ',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child:
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 8),
                            child: Consumer<client_vm>(
                              builder: (context, cart, child){
                                return  DropdownSearch<ClientModel>(
                                  mode: Mode.DIALOG,
                                  // label: " الموظف ",
                                  //hint: 'الموظف',
                                  //onFind: (String filter) => cart.getfilteruser(filter),
                                  filterFn: (user, filter) => user!.getfilteruser(filter!),
                                  //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                  // itemAsString: (UserModel u) => u.userAsStringByName(),
                                  items: cart.listClient,
                                  itemAsString: (u) => u!.userAsString(),
                                  onChanged: (data) {
                                    clientModel=data!;
                                    idclient=data!.idClients!;
                                    Provider.of<EventProvider>(context, listen: false)
                                        .getevent_Client(idclient);
                                    // Provider.of<client_vm>(context, listen: false)
                                    //     .getclientfilter_Local(iduser!,"user");

                                  } ,
                                  selectedItem: cart.selectedclient,
                                  showSearchBox: true,
                                  dropdownSearchDecoration:
                                  InputDecoration(
                                    //filled: true,
                                    isCollapsed: true,
                                    hintText: 'العميل',
                                    alignLabelWithHint: true,
                                    fillColor:  Colors.grey.withOpacity(0.2),
                                    //labelText: "choose a user",
                                    contentPadding: EdgeInsets.all(0),
                                    //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     borderSide: const BorderSide(color: Colors.white)),
                                    border:
                                    UnderlineInputBorder(
                                        borderSide: const BorderSide(  color: Colors.grey)
                                    ),
                                    // OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     borderSide: const BorderSide( color: Colors.white)),
                                  ),
                                  // InputDecoration(border: InputBorder.none),

                                );

                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 20.0,right: 8),
                    //     child: Consumer<user_vm_provider>(
                    //       builder: (context, cart, child){
                    //         return  DropdownSearch<UserModel>(
                    //           mode: Mode.DIALOG,
                    //           // label: " الموظف ",
                    //           //hint: 'الموظف',
                    //           //onFind: (String filter) => cart.getfilteruser(filter),
                    //           filterFn: (user, filter) => user!.getfilteruser(filter!),
                    //           //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                    //           // itemAsString: (UserModel u) => u.userAsStringByName(),
                    //           items: cart.userall,
                    //           itemAsString: (u) => u!.userAsString(),
                    //           onChanged: (data) {
                    //             iduser=data!.idUser!;
                    //             Provider.of<EventProvider>(context, listen: false)
                    //                 .getevents(iduser,[],"user");
                    //             // Provider.of<client_vm>(context, listen: false)
                    //             //     .getclientfilter_Local(iduser!,"user");
                    //
                    //           } ,
                    //           selectedItem: cart.selecteduser,
                    //           showSearchBox: true,
                    //           dropdownSearchDecoration:
                    //           InputDecoration(
                    //             //filled: true,
                    //             isCollapsed: true,
                    //             hintText: 'الموظف',
                    //             alignLabelWithHint: true,
                    //             fillColor:  Colors.grey.withOpacity(0.2),
                    //             //labelText: "choose a user",
                    //             contentPadding: EdgeInsets.all(0),
                    //             //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    //             // focusedBorder: OutlineInputBorder(
                    //             //     borderRadius: BorderRadius.circular(10),
                    //             //     borderSide: const BorderSide(color: Colors.white)),
                    //             border:
                    //             UnderlineInputBorder(
                    //                 borderSide: const BorderSide(  color: Colors.grey)
                    //             ),
                    //             // OutlineInputBorder(
                    //             //     borderRadius: BorderRadius.circular(10),
                    //             //     borderSide: const BorderSide( color: Colors.white)),
                    //           ),
                    //           // InputDecoration(border: InputBorder.none),
                    //
                    //         );
                    //
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 25,),
                CalendarWidget(type: 'client',clientModel: clientModel),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
