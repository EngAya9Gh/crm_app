import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'careAdd.dart';

class careRepeat extends StatefulWidget {
  careRepeat({required this.type, required this.comobj, required this.idclient, Key? key}) : super(key: key);
  ClientModel1 idclient;
  CommunicationModel comobj;
  String type;

  @override
  _careRepeatState createState() => _careRepeatState();
}

class _careRepeatState extends State<careRepeat> {
  String? typepayController = '0';
  bool numberwrong = false;
  bool repeat = false;
  double rate = 0;
  List<CommunicationModel> listCommunication = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false).getComment(widget.idclient.idClients.toString());

      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationclientrepeat(widget.idclient.idClients.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listCommunication = Provider.of<communication_vm>(context, listen: true).listCommunicationClient;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.comobj.nameEnterprise.toString()),
        //comobj
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ProfileClient(
                                        idClient: widget.idclient.idClients,
                                      )));
                        },
                        child: Text(' ملف العميل')),
                  ),

                  // Provider.of<communication_vm>(context, listen: true)
                  //     .valuebutton==false
                  if (widget.type == 'wait') ...{
                    20.horizontalSpace,
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => careAdd(com: widget.comobj
                                      // listCommunication.firstWhere  (
                                      //         (element) => element.fkUser==null
                                      //        ,orElse: ()=>listCommunication[0]
                                      ),
                                ));
                          },
                          child: Text(
                            ' خدمة العميل ',
                          )),
                    ),
                  },
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Provider.of<communication_vm>(context, listen: true).isloading == true
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              // for(int i=0;i<listCommunication.length;i++)
              //   if(listCommunication[i].typeCommuncation=='دوري'&&listCommunication[i].fkUser!=null)
              //     commview(listCommunication[i]) ,
              //
              // SizedBox(height: 10,),
              // Container(
              //   height: MediaQuery.of(context).size.height* 0.45,
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         left: 8, right: 8, top: 10.0, bottom: 5),
              //     child: Consumer<comment_vm>(builder: (context, value, child) {
              //       return value.listComments.length == 0
              //           ? Text('')
              //           : Column(
              //         children: [
              //           Expanded(
              //             child: ListView.builder(
              //                 scrollDirection: Axis.vertical,
              //                 itemCount: value.listComments.length,
              //                 itemBuilder: (context, index) {
              //                   return SingleChildScrollView(
              //                       child: Padding(
              //                           padding: const EdgeInsets.all(2),
              //                           child:
              //                           //Text(''),
              //                           cardcomment(
              //                             commentmodel:
              //                             value.listComments[index],
              //                           )));
              //                 }),
              //           ),
              //         ],
              //       );
              //     }),
              //   ),
              // ),
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
