import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import 'cardcommAlltype.dart';
import 'install_add.dart';

class View_welcomeClient extends StatefulWidget {
  const View_welcomeClient({Key? key}) : super(key: key);

  @override
  _View_welcomeClientState createState() => _View_welcomeClientState();
}

class _View_welcomeClientState extends State<View_welcomeClient> {
  List<CommunicationModel> listCommunicationwelcome = [];
  bool isload = false;
  String? regoin;
  String? typeclientvalue;
  late UserModel user;
  late String userId;

  @override
  void initState() {
    user = context.read<UserProvider>().currentUser;
    userId = user.idUser!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false).changelisttype_welcome('الكل');
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      await Provider.of<communication_vm>(context, listen: false).getCommunicationWelcome("");
    });
    super.initState();
  }

  bool isMyClients = false;

  @override
  Widget build(BuildContext context) {
    listCommunicationwelcome = Provider.of<communication_vm>(context, listen: true).listCommunicationWelcome;
    isload = Provider.of<communication_vm>(context, listen: true).isloading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الترحيب بالعملاء ',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // privilge.checkprivlge('1') == true ? //regoin
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Consumer<RegionProvider>(
                        builder: (context, cart, child) {
                          return DropdownButton(
                            isExpanded: true,
                            hint: Text("الفرع"),
                            items: cart.listRegionFilter.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.regionName),
                                //label of item
                                value: level_one.regionId, //value of item
                              );
                            }).toList(),
                            value: cart.selectedRegionId,
                            onChanged: (value) {
                              //  setState(() {
                              cart.changeVal(value.toString());
                              regoin = value.toString();
                              filtershow();
                            },
                          );
                          //);
                        },
                      ),
                    ),
                  ), // : Container(),
                  // Consumer<typeclient>(
                  //     builder: (context, selectedProvider, child){
                  //       return  GroupButton(
                  //           controller: GroupButtonController(
                  //             selectedIndex:selectedProvider.selectedinstall,
                  //
                  //           ),
                  //           options: GroupButtonOptions(
                  //               selectedColor: kMainColor,
                  //
                  //               buttonWidth: 110,
                  //               borderRadius: BorderRadius.circular(10)),
                  //           buttons: ['الكل','بالإنتظار','تم التركيب'],
                  //           onSelected: (index,isselected){
                  //
                  //             //setState(() {
                  //             typepayController=index.toString();
                  //             selectedProvider.changeinstall(index);
                  //             filtershow();
                  //             //});
                  //           }
                  //       );
                  //     }
                  //
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientTypeProvider>(builder: (context, cart, child) {
                        return DropdownButton(
                          isExpanded: true,
                          hint: Text('الحالة'),
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_welcome.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                          value: cart.selectedwelcome,
                          onChanged: (value) {
                            //namemanage=value.toString();
                            cart.changelisttype_welcome(value.toString());
                            typeclientvalue = value.toString();



                            filtershow();
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
              search_widget('welcome', hintnamefilter, 'welcome',
                  myClientsParams: isMyClients ? '&fk_user=$userId' : ''),
              SizedBox(
                height: 5,
              ),
              SwitchListTile(
                value: isMyClients,
                onChanged: (value) {
                  setState(() => isMyClients = value);
                  String myClientsParam = '';
                  if (isMyClients) {
                    myClientsParam = '&fk_user=$userId';
                  }
                  filtershow(myClientsParam);
                },
                title: Text("عملائي"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عدد العملاء',
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      listCommunicationwelcome.length.toString(),
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<communication_vm>(builder: (context, value, child) {
                    return value.isloading == true
                        ? Center(child: CircularProgressIndicator())
                        : value.listCommunicationWelcome.length == 0
                            ? Center(child: Text(messageNoData))
                            : Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: value.listCommunicationWelcome.length,
                                        itemBuilder: (context, index) {
                                          return SingleChildScrollView(
                                              child: Container(
                                                  child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: cardcommalltype(
                                                itemcom: value.listCommunicationWelcome[index], tabCareIndex: 0),
                                            // child: Column(
                                            //   children: [
                                            //     ListTile(
                                            //       onTap: () {
                                            //         Navigator.push(
                                            //             context,
                                            //             CupertinoPageRoute(
                                            //                 builder:
                                            //                     (
                                            //                     context) =>
                                            //                     installAdd(
                                            //                       com: value.listCommunicationWelcome[index],
                                            //                     )));
                                            //       },
                                            //       title: Text(
                                            //         value.listCommunicationWelcome[index].nameEnterprise
                                            //             .toString(),
                                            //         style: TextStyle(
                                            //             fontFamily: kfontfamily2
                                            //         ),),
                                            //       // leading:
                                            //       trailing: Text(
                                            //        value.listCommunicationWelcome[index]
                                            //             .date_approve
                                            //             .toString(),
                                            //         style: TextStyle(
                                            //             fontFamily: kfontfamily2
                                            //         ),),
                                            //     ),
                                            //     // const MySeparator(color: Colors.grey),
                                            //     Divider(thickness: 2,),
                                            //   ],
                                            // ),
                                          )));
                                        }),
                                  ),
                                ],
                              );
                  }),
                ),
              ),
            ],
          )

              // GroupedListView<CommunicationModel, String>(
              //   elements:  listCommunicationwelcome,
              //   groupBy: (element) {
              //     if(element.fkUser==null)
              //       return 'لم يتم الترحيب';
              //     else if(element.fkUser!=null)
              //       return ' تم الترحيب بالعميل';
              //     return '';
              //   },
              //   groupComparator: (value1, value2) => value2.compareTo(value1),
              //   itemComparator: (item1, item2) => item1.fkUser.toString().
              //   compareTo(item2.fkUser.toString()),
              //   order: GroupedListOrder.DESC,
              //   useStickyGroupSeparators: true,
              //   groupSeparatorBuilder: (String value) => Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text(
              //       value,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //   itemBuilder: (c, element) {
              //     return Container(
              //         child:
              //         Padding(
              //           padding: const EdgeInsets.all(
              //               2),
              //           child: Column(
              //             children: [
              //               ListTile(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       CupertinoPageRoute(
              //                           builder:
              //                               (
              //                               context) =>
              //                               installAdd(
              //                                 com: element,
              //                               )));
              //                 },
              //                 title: Text(
              //                   element.nameEnterprise
              //                       .toString(),
              //                   style: TextStyle(
              //                       fontFamily: kfontfamily2
              //                   ),),
              //                 // leading:
              //                 trailing: Text(
              //                   element
              //                       .date_approve
              //                       .toString(),
              //                   style: TextStyle(
              //                       fontFamily: kfontfamily2
              //                   ),),
              //               ),
              //               // const MySeparator(color: Colors.grey),
              //               Divider(thickness: 2,),
              //             ],
              //           ),
              //         )
              //     );
              //   },
              // ),
              //],
              ),
        ),
      ),
    );
  }

  void filtershow([String? myClientsParam]) {



    Provider.of<communication_vm>(context, listen: false).getcommtype_filter(typeclientvalue, regoin, myClientsParam);

    // }
  }
}
