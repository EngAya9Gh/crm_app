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
import 'cardcommAlltype.dart';
import 'install_add.dart';

class View_installedClient extends StatefulWidget {
  const View_installedClient({Key? key}) : super(key: key);

  @override
  _View_installedClientState createState() => _View_installedClientState();
}

class _View_installedClientState extends State<View_installedClient> {
  List<CommunicationModel> listCommunicationinstall = [];
  bool isload = false;
  String? regoin;
  String? typeclientvalue;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Provider.of<typeclient>(context, listen: false)
          .changelisttype_install_iso('الكل');
      Provider.of<regoin_vm>(context, listen: false).changeVal(null);
     await Provider.of<communication_vm>(context, listen: false)
          .getCommunicationInstall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listCommunicationinstall =
        Provider.of<communication_vm>(context, listen: true)
            .listCommunicationInstall;
    isload = Provider.of<communication_vm>(context, listen: true).isloading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'جودة التركيب والتدريب',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: isload == true
          ? Center(child: CircularProgressIndicator())
          : listCommunicationinstall.length == 0
              ? Center(child: Text(messageNoData))
              : Padding(
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
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Consumer<regoin_vm>(
                                  builder: (context, cart, child) {
                                    return DropdownButton(
                                      isExpanded: true,
                                      hint: Text("الفرع"),
                                      items: cart.listregoinfilter
                                          .map((level_one) {
                                        return DropdownMenuItem(
                                          child: Text(level_one.name_regoin),
                                          //label of item
                                          value: level_one
                                              .id_regoin, //value of item
                                        );
                                      }).toList(),
                                      value: cart.selectedValueLevel,
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
                            //             print(index);
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
                                padding:
                                    const EdgeInsets.only(left: 20.0, right: 8),
                                child: Consumer<typeclient>(
                                    builder: (context, cart, child) {
                                  return DropdownButton(
                                    isExpanded: true,
                                    hint: Text('الحالة'),
                                    //hint: Text("حدد حالة العميل"),
                                    items:
                                        cart.type_of_install_iso.map((level_one) {
                                      return DropdownMenuItem(
                                        child: Text(level_one), //label of item
                                        value: level_one, //value of item
                                      );
                                    }).toList(),
                                    value: cart.selectedinstall_iso,
                                    onChanged: (value) {
                                      //namemanage=value.toString();
                                      cart.changelisttype_install_iso(
                                          value.toString());
                                      typeclientvalue = value.toString();
                                      print('filter state' + value.toString());
                                      print(typeclientvalue);

                                      filtershow();
                                    },
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        search_widget('welcome', hintnamefilter, 'install'),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عدد العملاء',style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                              Text(listCommunicationinstall.length.toString(),style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                            ],),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.73,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<communication_vm>(
                                builder: (context, value, child) {
                              return value.isloading == true
                                  ? Center(child: CircularProgressIndicator())
                                  : value.listCommunicationInstall.length == 0
                                      ? Center(child: Text(messageNoData))
                                      : Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: value
                                                      .listCommunicationInstall
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return SingleChildScrollView(
                                                        child: Container( child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: cardcommalltype(
                                                          itemcom:
                                                          value.listCommunicationInstall[index]),
                                                    )));
                                                  }),
                                            ),
                                          ],
                                        );
                            }),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
    );
  }

  void filtershow() {
    print(regoin);
    print(typeclientvalue);

    Provider.of<communication_vm>(context, listen: false)
        .getinstalltype_filter(typeclientvalue, regoin, 'only');


    // }
  }
}
