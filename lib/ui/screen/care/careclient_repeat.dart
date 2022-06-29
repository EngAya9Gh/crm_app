import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/care/widgetcare.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group_button/group_button.dart';

import '../../../constants.dart';
import 'package:provider/provider.dart';

import 'card_comment.dart';
import 'careAdd.dart';

class careRepeat extends StatefulWidget {
  careRepeat({required this.idclient, Key? key}) : super(key: key);
  ClientModel idclient;

  @override
  _careRepeatState createState() => _careRepeatState();
}

class _careRepeatState extends State<careRepeat> {
  String? typepayController='0';
  bool numberwrong=false;
  bool repeat=false;
  double rate=0;
  List<CommunicationModel> listCommunication=[];
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.idclient.idClients.toString());


      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationclientrepeat(widget.idclient.idClients.toString());

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listCommunication=Provider.of<communication_vm>(context, listen: true)
        .listCommunicationClient;
    return Scaffold(

      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

              SizedBox(height: 10,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () async{
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                ProfileClient(
                                  idclient: widget.idclient.idClients ,
                                )));
                      },
                      child: Text(' ملف العميل')) ,

                  ElevatedButton(
                      style: ButtonStyle(

                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () async{
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                careAdd(
                                  com:
                                  listCommunication.firstWhere  (
                                          (element) => element.fkUser==null
                                         ,orElse: ()=>listCommunication[0]),                              )));
                        },
                      child: Text(' خدمة العميل ',)),
                ],
              ),
              SizedBox(height: 10,),
              for(int i=0;i<listCommunication.length;i++)
                if(listCommunication[i].typeCommuncation=='دوري'&&listCommunication[i].fkUser!=null)
                  commview(listCommunication[i]) ,

              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height* 0.45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 10.0, bottom: 5),
                  child: Consumer<comment_vm>(builder: (context, value, child) {
                    return value.listComments.length == 0
                        ? Text('')
                        : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.listComments.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child:
                                        //Text(''),
                                        cardcomment(
                                          commentmodel:
                                          value.listComments[index],
                                        )));
                              }),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  clear(value) {

    Navigator.pop(context);
    // setState(() {
    //   widget.com=value;
    // });
  }

}
