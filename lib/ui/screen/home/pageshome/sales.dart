import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/client_wating.dart';
import 'package:crm_smart/ui/screen/client/myclient.dart';
import 'package:crm_smart/ui/screen/client/outClient.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/screen/target/target_page.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  bool checkvalue=false;

  @override void didChangeDependencies() async{

    // Future.delayed(Duration(milliseconds: 3)).then((_) async {
    //   //checkvalue = await privilge.checkprivlge('8');
    //  // print(checkvalue);
    // });
    super.didChangeDependencies();
  }
  @override void initState() {
    Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();

       //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context)  {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   var privilge= Provider.of<privilge_vm>(context,listen: true);
    // });

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
         'المبيعات',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: 
      // Consumer<privilge_vm>(
      // builder: (context, privilge, child){
       Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
            children: [
              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('36')==true?
              buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context)=>
                            tabclients()));
              }, title: ' قائمة العملاء') :Container(),
              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('39')==true?
              buildSelectCategory(
                  colorbag:   Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                            invoicesAcceptclient() //AcceptPage()   // support_view(type: 'client',)
                    ));
                  }, title:'فواتير العملاء' ):Container(),//تاريخ الفاتورة جنبو اسم المؤسسة

              buildSelectCategory(
                  colorbag:   Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                            TransferPage() //AcceptPage()   // support_view(type: 'client',)
                    ));
                  }, title:'موافقات تحويل العملاء' ),//تاريخ الفاتورة جنبو اسم المؤسسة


              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('40')==true?
    buildSelectCategory(
        colorbag: Colors.white,
        colortitle: Colors.black,
        colorarrow: Colors.black,
        onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      ApprovePage()));
            }, title:  ' طلبات الموافقة '):Container(),

              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('5')==true?
              buildSelectCategory(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        TargetPage()));
              }, title:  'تاركيت الموظف ',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,):Container(),

              Provider.of<privilge_vm>(context,listen: true)
                .checkprivlge('14')==true?
    buildSelectCategory(
        colorbag: Colors.white,
        colortitle: Colors.black,
        colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                     deletedinvoice()));
                     },
                      title:  'الفواتير المحذوفة'):Container(),

              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('35')==true?
              buildSelectCategory(
                  colorbag: Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                            OutClient() //AcceptPage()   // support_view(type: 'client',)
                    ));
                  }, title:'الفواتير المنسحبة' ):Container(),//تاريخ الفاتورة جنبو اسم المؤسسة

          ],),
      ),
     // },),
    );
  }
}
