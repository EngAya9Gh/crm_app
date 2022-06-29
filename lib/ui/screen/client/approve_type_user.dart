

import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/cardapprove.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'clients.dart';
class TransferPage extends StatefulWidget {
  TransferPage({ Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? regoin;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      Provider.of<client_vm>(context,listen: false)
          .getallclientTransfer();
    });
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() {

    Future.delayed(Duration(milliseconds: 10)).then((_) async {

    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'موافقات تحويل العملاء',
        style:
        TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: ListView(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.73,
                  child:
                  Consumer<client_vm> (
                      builder: (context,value,child) {
                        return
                          value.isloading==true?
                          Center(child: CircularProgressIndicator()):
                          value.listClientAprroveTransfer.length==0?
                          Center(
                              child: Text(messageNoData)):
                          Column(
                            children: [
                              Expanded(
                                //flex: 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.listClientAprroveTransfer.length,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child:  Container(
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                                            boxShadow: <BoxShadow>[
                                            BoxShadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 8.0,
                                            color: Colors.black87.withOpacity(0.2),
                                            ),
                                            ],
                                            color: Colors.white30,
                                            ),
                                            child: Center(
                                            child: InkWell(
                                            onTap: (){//pushReplacement
                                            Navigator.push(context,
                                            MaterialPageRoute(builder:
                                            (context) =>
                                                ProfileClient(
                                                  clienttransfer: 'transfer',
                                                  idclient:
                                                  value.listClientAprroveTransfer[index]
                                                  .idClients,
                                                )));
                                            },
                                            child: Container(
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
                                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text(
                                        value.listClientAprroveTransfer[index].nameusertransfer.toString(),
                                      style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: kfontfamily2,
                                      color: kMainColor),
                                      ),
                                      Text(
                                        value.listClientAprroveTransfer[index].dateTransfer.toString(),
                                      style: TextStyle(
                                      fontSize: 12,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: kfontfamily2,
                                      color: kMainColor),
                                      ),
                                      ],
                                      ),
                                      Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                      Text(
                                      value.listClientAprroveTransfer[index].nameEnterprise.toString(),
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: kfontfamily2,
                                      ),
                                      ),

                                      ],
                                      ),
                                      ],
                                      )
                                      ],
                                      ),
                                      ),
                                            ),
                                            ),
                                            ),
                                            )
                                          ));
                                    }),),],
                          );
                      } ),
                ),
              ],
            )  ),
      ),
    );
  }

}



