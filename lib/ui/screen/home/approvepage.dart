import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/cardapprove.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class ApprovePage extends StatefulWidget {
   ApprovePage({ Key? key}) : super(key: key);

  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  String? regoin;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      Provider.of<regoin_vm>(context,listen: false).changeVal(null);
      // if( Provider.of<privilge_vm>(context,listen: false)
      //     .checkprivlge('7'))
      //   await Provider.of<invoice_vm>(context, listen: false)
      //       .get_invoicesbyRegoin([]);//getApprovebycountry
      // if( Provider.of<privilge_vm>(context,listen: false)
      //     .checkprivlge('2'))
      //   await
     // await   Provider.of<invoice_vm>(context, listen: false)
     //        .getinvoices();
///////////////////////////////////////////////////////
      if( Provider.of<privilge_vm>(context,listen: false)
          .checkprivlge('2')==true)
      Provider.of<invoice_vm>(context, listen: false)
          .getinvoice_Local('مشترك','not approved','country');
      else{
        if( Provider.of<privilge_vm>(context,listen: false)
            .checkprivlge('7')==true)
          Provider.of<invoice_vm>(context, listen: false)
              .getinvoice_Local('مشترك','not approved','regoin');
      }

    });
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() {

    Future.delayed(Duration(milliseconds: 10)).then((_) async {


     // if( Provider.of<privilge_vm>(context,listen: false)
     //      .checkprivlge('7'))
     //  await    Provider.of<approve_vm>(context, listen: false)
     //      .getApprovebyregoin();//getApprovebycountry
     // if( Provider.of<privilge_vm>(context,listen: false)
     //      .checkprivlge('2'))
     //  await    Provider.of<approve_vm>(context, listen: false)
     //      .getApprovebycountry();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'طلبات الموافقة',
        style:
      TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: ListView(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    // privilge.checkprivlge('1') == true ? //regoin
                    Provider.of<privilge_vm>(context,listen: true)
                        .checkprivlge('2')==true?
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Consumer<regoin_vm>(
                          builder: (context, cart, child) {
                            return
                              DropdownButton(
                                isExpanded: true,
                                hint: Text("الفرع"),
                                items: cart.listregoinfilter.map((level_one) {
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
                    ):Container(),// : Container(),
                  ],
                ),
                search_widget(
                  'wait',
                  hintnamefilter,''
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.73,
                  child:
                  Consumer<invoice_vm> (
                      builder: (context,value,child) {
                        return
                          value.isloading==true?
                          Center(child: CircularProgressIndicator()):
                          value.listInvoicesAccept.length==0?
                          Center(
                              child: Text(messageNoData)):
                          Column(
                              children: [
                                Expanded(
                                 //flex: 1,
                                  child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: value.listInvoicesAccept.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: cardapprove1(
                                            itemapprove :
                                            value.listInvoicesAccept[index],
                                            //data: widget.data,
                                          ),
                                        ));
                                  }),
                                ),
                              ],
                            );
                      } ),
                ),
              ],
            )  ),
      ),
    );
  }

  void filtershow() {
    Provider.of<invoice_vm>(context,listen: false).
    getfilterview(regoin,'not');

  }
}
