import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/widgets/cardapprove.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class MyClientPage extends StatefulWidget {
  const MyClientPage({Key? key}) : super(key: key);

  @override
  _MyClientPageState createState() => _MyClientPageState();
}
class _MyClientPageState extends State<MyClientPage> {
  @override
  void initState() {
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() async{
    List<ClientModel> list= Provider.of<client_vm>(context,listen: false).listClient;
    await    Provider.of<client_vm>(context, listen: false)
        .getclientByIdUser_vm(list);
    // Future.delayed(Duration(milliseconds: 10)).then((_) async {
    //   await    Provider.of<invoice_vm>(context, listen: false)
    //       .getinvoice_Local("مشترك");
    // }
    // );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'عملائي ',
        style:
        TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Center(
              child:
              Consumer<client_vm> (
                  builder: (context,value,child) {
                    return value.listClientbyCurrentUser.length==0?
                    CircularProgressIndicator()
                        :ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.listClientbyCurrentUser.length,
                        itemBuilder: (context, index) {

                          return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child:
                               //if(value.listClient[index].fkUser!=value.usercurrent!.idUser)
                                cardClient(
                                     itemClient:
                                  value.listClientbyCurrentUser[index],
                                  iduser: '1',
                                ),
                              ));
                        });
                  } ),
            )  ),
      ),
    );
  }
}
