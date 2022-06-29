

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
class ClientAccept extends StatefulWidget {
  ClientAccept({Key? key}) : super(key: key);

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<ClientAccept> {
  String? regoin;
  String? typeclientvalue;
  late List<MainCityModel>? selecteditemmaincity=[];
  // late String typepayController;
  @override void didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      Provider.of<client_vm>(context, listen: false).clear();
    });
    super.didChangeDependencies();
  }
  @override void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      // only
      await Provider.of<privilge_vm>(context,listen: false)
          .getprivlg_usercurrent();
      List<PrivilgeModel> list=
         Provider.of<privilge_vm>(context,listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);
      //Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);
      Provider.of<client_vm>(context, listen: false).listClientAccept=[];
        // Provider.of<client_vm>(context, listen: false)
        //   .getallclient();
      // Provider.of<client_vm>(context, listen: false). getclient_Local('مشترك');

      // Provider.of<maincity_vm>
      //   (context,listen: false).changevalue(null);
      await Provider.of<client_vm>(context,listen: false)
          .getallclientAccept();

      Provider.of<client_vm>(context,listen: false)
          .getfilterviewSupport(selecteditemmaincity);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العملاء المشتركين',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: Consumer<privilge_vm>(
          builder: (context, privilge, child) {
            return SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Consumer<maincity_vm>(
                                  builder: (context, cart, child){
                                    return  DropdownSearch<MainCityModel>.multiSelection(
                                      showFavoriteItems: true,
                                      mode: Mode.DIALOG,
                                      filterFn: (user, filter) => user!.getfilteruser(filter!),
                                      compareFn: (item, selectedItem) => item?.id_maincity == selectedItem?.id_maincity,
                                      // itemAsString: (UserModel u) => u.userAsStringByName(),
                                      items: cart.listmaincityfilter,
                                      // showSelectedItems: true,
                                      selectedItems: cart.selecteditemmaincity,
                                      itemAsString: (u) => u!.userAsString(),
                                      onChanged: (data) {
                                        for(int i=0;i<data.length;i++)
                                          print(data[i].id_maincity);
                                        print(data);
                                        selecteditemmaincity=data;
                                        cart.changeitemlist(data);
                                        filtershow();
                                      } ,
                                      //selectedItem: cart.selecteduser,
                                      showSearchBox: true,
                                      dropdownSearchDecoration:
                                      InputDecoration(
                                        //filled: true,
                                        isCollapsed: true,
                                        hintText: 'المنطقة',
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

                          ],
                        ),
                        search_widget(
                          'accept',
                          hintnamefilter,''
                          // Provider
                          //     .of<invoice_vm>(context, listen: true)
                          //     .listInvoicesAccept,
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عدد العملاء',style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                              Text(
                                Provider.of<client_vm>(context,listen: true).listClientAccept.length.toString(),style: TextStyle(
                                  fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                              ),),
                            ],),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.73,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<client_vm>(
                                builder: (context, value, child) {
                                  return value.isloading==true?
                                  Center(
                                      child: CircularProgressIndicator()
                                  ) :
                                  value.listClientAccept.length == 0 ?
                                  Center(
                                      child: Text(messageNoData)
                                  )  : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: value.listClientAccept.length,
                                            itemBuilder: (context, index) {
                                              return SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        2),
                                                    child:
                                                    cardAccept(
                                                      itemClient: value.listClientAccept[index],
                                                    ),
                                                  )
                                              );
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
            );
          }),
    );
  }

  void filtershow(){
    print(regoin);
    // print(typeclientvalue);
    //   Provider.of<invoice_vm>(context,listen: false)
    //       .getclienttype_filter(typeclientvalue!,regoin,'only');
    Provider.of<client_vm>(context,listen: false)
        .getfilterviewSupport(selecteditemmaincity);
    //   if(regoin==null)
    //  Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    // else {
    //
    //   Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    //
    // }
  }
}
