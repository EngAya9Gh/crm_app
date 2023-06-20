import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/selected_button_provider.dart';
import '../../../../view_model/lastcommentclient_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../profileclient.dart';
import 'LastcommentPage.dart';

class getLastCommentClient extends StatefulWidget {
  const getLastCommentClient({Key? key}) : super(key: key);

  @override
  _getLastCommentClientState createState() => _getLastCommentClientState();
}

class _getLastCommentClientState extends State<getLastCommentClient> {

  String type='تفاوض';
  String? idUser='';
  @override  initState() {
    super.initState();
    Provider.of<lastcommentclient_vm>(context,listen: false).getLastcommentClientModel();

    // scheduleMicrotask(() {
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child: Text( 'آخر التعليقات'))),
      body:
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ModalProgressHUD(
          inAsyncCall:  Provider.of<lastcommentclient_vm>(context,listen: true).isload,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('عدد العملاء',style: TextStyle(
                        fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                    ),),
                    Text(
                      Provider.of<lastcommentclient_vm>(context,listen: true).list_LastcommentClientModel.length.toString(),style: TextStyle(
                        fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                    ),),
                  ],),
              ),
              Consumer<selected_button_provider>(
                  builder: (context, selectedProvider, child) {
                    return GroupButton(
                        controller: GroupButtonController(
                          selectedIndex: selectedProvider.isbarsales,
                        ),
                        options: GroupButtonOptions(
                            buttonWidth: 75, borderRadius: BorderRadius.circular(10)),
                        buttons: ['تفاوض', 'مشترك','منسحب','عرض سعر' ],
                        onSelected: (_,index, isselected) {
                          print(index);
                          switch(index){
                            case 0:
                              type='تفاوض';
                              break;

                            case 1:
                              type='مشترك';
                              break;

                              case 2:
                              type='مستبعد';
                              break;

                              case 3:
                              type='عرض سعر';
                              break;

                          }

                          selectedProvider.selectValuebarsales(index);
                          Provider.of<lastcommentclient_vm>(context,listen: false)
                              .getData(type, idUser);

                        });
                  }),

              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,),
                child: Consumer<user_vm_provider>(
                  builder: (context, cart, child){
                    return  DropdownSearch<UserModel>(
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
                        idUser=data!.idUser;
                        cart.changevalueuser(data);
                        Provider.of<lastcommentclient_vm>(context,listen: false)
                            .getData(type, idUser);
                      } ,
                      selectedItem: cart.selecteduser,
                      showSearchBox: true,
                      dropdownSearchDecoration:
                      InputDecoration(
                        //filled: true,
                        isCollapsed: true,
                        hintText: 'الموظف',
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

              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Provider.of<lastcommentclient_vm>(context,listen: false)
                        .list_LastcommentClientModel.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.all(
                                  2),
                              child:
                              Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0)
                                  ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 8.0,
                                      color: Colors.black87.withOpacity(0.2),
                                    ),
                                  ],
                                  color:  Colors.white30,
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>
                                          ProfileClient(
                                            tabindex: 2,
                                              idclient: Provider.of<lastcommentclient_vm>(context,listen: false)
                                                  .list_LastcommentClientModel[index].client_obj.idClients)));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         lastcomment_page(
                                      //           LastcommentClient:
                                      //             Provider.of<lastcommentclient_vm>(context,listen: false)
                                      //             .list_LastcommentClientModel[index])
                                      //     ));
                                    },
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                      //height: 70,//MediaQuery.of(context).size.height*0.15,
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Flex(
                                          direction: Axis.vertical,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      Provider.of<lastcommentclient_vm>(context,listen: false)
                                                          .list_LastcommentClientModel[index].client_obj!.name_regoin.toString(),
                                                      style: TextStyle(
                                                        //fontWeight: FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily: kfontfamily2,
                                                          color: kMainColor),
                                                    ),

                                                    Text(
                                                      int.parse(Provider.of<lastcommentclient_vm>(context,listen: false)
                                                          .list_LastcommentClientModel[index].hoursLastComment.toString())<0?
                                                    '0':
                                                      Provider.of<lastcommentclient_vm>(context,listen: false)
                                                          .list_LastcommentClientModel[index].hoursLastComment.toString()+' يوم '
                                                      ,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          //fontWeight: FontWeight.bold,
                                                          fontFamily: kfontfamily2,
                                                          color: kMainColor),
                                                    )
                                                  ],
                                                ),
                                                Row(

                                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      Provider.of<lastcommentclient_vm>(context,listen: false)
                                                          .list_LastcommentClientModel[index].client_obj!.nameEnterprise.toString(),
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12,
                                                        fontFamily: kfontfamily2,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   itemapprove.nameUser.toString(),
                                                    //   style: TextStyle(fontFamily: kfontfamily2),
                                                    // ),
                                                  ],
                                                ),
                                                // type=='wait'?
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                //   children: [
                                                //     Text(
                                                //       'تاريخ التواصل القادم',
                                                //       style: TextStyle(
                                                //         fontWeight: FontWeight.bold,
                                                //         fontSize: 12,
                                                //         fontFamily: kfontfamily2,
                                                //       ),
                                                //     ), Text(
                                                //       listCommunication[index].dateNext.toString(),
                                                //       style: TextStyle(
                                                //         fontWeight: FontWeight.bold,
                                                //         fontSize: 12,
                                                //         fontFamily: kfontfamily2,
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ):Container(),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            // cardAccept(
                            //   itemClient: value.listClientAccept[index],
                            // ),
                          )
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
