import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';
import 'card_comment.dart';
import 'care_page_view.dart';

class careAdd extends StatefulWidget {
  careAdd({required this.com, Key? key}) : super(key: key);
 CommunicationModel com;

  @override
  _careAddState createState() => _careAddState();
}

class _careAddState extends State<careAdd> {
   bool typepayController=false;
  bool numberwrong=false;
  bool repeat=false;
  bool isdone=false;
  double rate=0.0;
  late ConfigModel peroid;
  @override void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      // Provider.of<comment_vm>(context, listen: false)
      //     .getComment(widget.com.fkClient);
      //period_commincation3


    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.com.nameEnterprise.toString()),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<communication_vm>(context,listen: true).isload,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [

                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      //color: kMainColor,
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: IconButton(
                        onPressed: ()async{
                          await FlutterPhoneDirectCaller.callNumber(widget.com.mobile.toString());
                        },
                        icon: Icon(Icons.call),iconSize: 15,color: kWhiteColor,
                      ),
                    ),
                    TextButton(
                      onPressed: ()async{
                        await FlutterPhoneDirectCaller.callNumber(widget.com.mobile.toString());
                      },
                      child:
                      Text(widget.com.mobile.toString(),
                        style: TextStyle(
                            fontFamily: kfontfamily2,
                            color: kMainColor
                        ),
                      ),

                    ),
                    // Text(widget.com.mobile.toString(),
                    //   style: TextStyle(
                    //       fontFamily: kfontfamily2,
                    //       color: kMainColor
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                  Text('التقييم 1/5'),
            RatingBar.builder(
              initialRating: 0.0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {

                setState(() {
                  rate=rating;

                });
              },
            ),
                ],),
                widget.com.typeCommuncation=='دوري'&& widget.com.dateCommunication==null?
                // Consumer<communication_vm>(
                //     builder: (context, selectedProvider, child){
                //       return  GroupButton(
                //           controller: GroupButtonController(
                //             selectedIndex:selectedProvider.selectedtypeinstall,
                //
                //           ),
                //           options: GroupButtonOptions(
                //               selectedColor: kMainColor,
                //               buttonWidth: 120,
                //               borderRadius: BorderRadius.circular(10)),
                //           buttons: ['لا يستخدم النظام','يستخدم النظام'],
                //           onSelected: (_,index,isselected){
                //
                //             //setState(() {
                //             typepayController=index.toString();
                //             selectedProvider.changeinstall(index);
                //             //});
                //           }
                //       );
                //     }
                //
                // )
                //     :Container(),
                CheckboxListTile(
                  title: new Text('لا يستخدم النظام'),
                  value:   typepayController,// as bool,
                  onChanged: (bool? value) {
                    setState(() {

                      typepayController=value!;
                      //values[key] = value;
                    });
                  },
                ):Container(),
                SizedBox(height: 20,),
                CheckboxListTile(
                  title: new Text('لايوجد رقم هاتف-أو الرقم خاطئ'),
                  value: numberwrong,// as bool,
                  onChanged: (bool? value) {
                    setState(() {

                      numberwrong=value!;
                      //values[key] = value;
                    });
                  },
                ),

                CheckboxListTile(
                  title: new Text('العميل متكرر'),
                  value:   repeat,// as bool,
                  onChanged: (bool? value) {
                    setState(() {

                      repeat=value!;
                      //values[key] = value;
                    });
                  },
                ),
               widget.com.dateCommunication==null?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all(
                                  kMainColor
                              )),
                          onPressed: () async{
                            Provider.of<communication_vm>(context,
                                listen: false).isloadval(true);
                           await Provider.of<config_vm>(context, listen: false).getAllConfig();
                            List<ConfigModel> _listconfg =
                             Provider.of<config_vm>(context, listen: false)
                                .listofconfig;

                            peroid =
                                _listconfg.firstWhere((element) =>
                                element.name_config == 'period_commincation3');

                            DateTime datanext=DateTime.now();

                            int peroidtime= int.parse(peroid.value_config);
                            datanext=Jiffy().add(days: peroidtime).dateTime;

                            // datanext.add(Duration(days: peroidtime));



                            if(widget.com.dateCommunication==null) {
                              //datanext.add( Duration(days: day+ pp));
                              // int peroidtime= int.parse(peroid.value_config);
                              // datanext=Jiffy().add(days: peroidtime).dateTime;
                              //
                              // datanext.add(Duration(days: peroidtime));
                              //

                            await  Provider.of<communication_vm>
                                (context,listen: false).updatecarecommuncation({
                                 'type':'دوري',
                                 'fk_user':Provider.of<UserProvider>
                                  (context,listen: false).
                                   currentUser.idUser.toString(),
                                 'date_communication':DateTime.now().toString(),
                                 'result':typepayController.toString(),//
                                 'rate':rate.toString(),
                                 'number_wrong':numberwrong.toString(),
                                 'client_repeat':repeat.toString(),
                                 'date_next':datanext.toString(),
                              },widget.com.idCommunication);
                               clear();
                            }},
                          child: Text(' تم التواصل ',

                            style: TextStyle(
                                // color:widget.com.dateCommunication==null?
                         color:   kWhiteColor),)),
                    ),
                  ],
                ):Container() ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  kMainColor)),
                          onPressed: () async{
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context)=>
                                    ProfileClient(
                                      idClient: widget.com.fkClient ,
                                    )));
                          },
                          child: Text(' ملف العميل')),
                    ) ,
                ],
                ),
                SizedBox(height: 10,),
                RowEdit(name: 'البيانات', des: ''),
                (widget.com.typeCommuncation=='تركيب'&&widget.com.dateCommunication!=null)
                    ||( widget.com.typeCommuncation=='ترحيب'&&widget.com.dateCommunication!=null)?
                cardRow(
                    title: 'تاريخ عقد الإشتراك',
                    value: widget.com.date_approve.toString()):Container(),
                SizedBox(height: 10,),
                widget.com.typeCommuncation=='تركيب'&&widget.com.dateCommunication!=null?
                cardRow(
                    title: 'تاريخ التركيب',
                    value:widget.com.dateinstall_done.toString()):Container(),

                widget.com.typeCommuncation=='ترحيب'&&widget.com.dateCommunication!=null?
                cardRow(
                    title: 'تاريخ الترحيب',
                    value:widget.com.dateCommunication.toString()):
                // cardRow(
                //     title: 'تاريخ التدريب',
                //     value:widget.com.dateCommunication.toString()),
                SizedBox(height: 10,),
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
      ),
    );
  }

  clear() {
   //  setState(() {
   //    isdone=true;
   //    widget.com=value;
   //  });
   // Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);

    // Navigator.push(context,
    //     CupertinoPageRoute(builder: (context)=>
    //         care_page_view()),
    //        // (route) => false
    // );
  }

}
