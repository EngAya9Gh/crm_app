import 'package:crm_smart/ui/screen/care/care_clientaccept.dart';
import 'package:crm_smart/ui/screen/care/care_page_view.dart';
import 'package:crm_smart/ui/screen/care/view_installed.dart';
import 'package:crm_smart/ui/screen/care/view_welcome.dart';
import 'package:crm_smart/ui/screen/client/client_accept.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketclientview.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgethomeitem.dart';

class carepage extends StatefulWidget {
  const carepage({Key? key}) : super(key: key);

  @override
  _carepageState createState() => _carepageState();
}

class _carepageState extends State<carepage> {
  int lengthInstall=0;
  int lengthWelcome=0;
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {

      // await    Provider.of<communication_vm>(context, listen: false)
      //      .getCommunicationall('');
      Provider.of<privilge_vm>(context, listen: false).getprivlg_usercurrent();
      Provider.of<ticket_vm>(context,listen: false)
          .getclientticket_filter('جديدة');
     await Provider.of<communication_vm>(context, listen: false)
          .getCommunicationInstall();
     await Provider.of<communication_vm>(context, listen: false)
          .getCommunicationWelcome();
//////////////////////////////////////////////
//       Provider.of<communication_vm>(
//           context, listen: false)
//           .getCommunicationInstallednumber();
//
//       Provider.of<communication_vm>(
//           context, listen: false)
//           .getCommunicationwelcomenumber();


    });
    super.initState();
  }

  @override void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {


    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'العناية بالعملاء',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Column(

          children: [
            Provider.of<privilge_vm>(context,listen: true)
                .checkprivlge('44')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  //
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          Care_ClientAccept()));
                }, title: 'العملاء المشتركين'):Container(),//تاريخ الفاتورة جنبو اسم المؤسسة

            Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('9')==true?
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        care_page_view()));
          }, title: 'العناية بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('29')==true?
          buildSelectCategory(
            subtitle:   Provider.of<communication_vm>(
                context, listen: true).listwelcomenumber.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        View_welcomeClient()));
          }, title: 'الترحيب بالعملاء'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('30')==true?
          buildSelectCategory(
            subtitle:    Provider.of<communication_vm>(
                context, listen: true).listinstallnumber.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        View_installedClient()));
//View_installedClient
          }, title: ' جودة التركيب والتدريب'):Container(),

          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('33')==true?
          buildSelectCategory(
            subtitle: Provider.of<ticket_vm>(context,listen: true)
                .listticket_clientfilter.length.toString(),
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        ticketclientview()));
              }, title: 'تذاكر العملاء  '
              ):Container(),

        ],),

      ),
    );
  }
}
