import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants.dart';
import 'package:provider/provider.dart';

import '../../../labeltext.dart';
import 'card_comment.dart';
import 'comment_view.dart';

class installAdd extends StatefulWidget {
   installAdd({required this.com, Key? key}) : super(key: key);
   CommunicationModel com;

  @override
  _installAddState createState() => _installAddState();
}

class _installAddState extends State<installAdd> {
  final _globalKey = GlobalKey<FormState>();
  TextEditingController _comment = TextEditingController();

  String? typepayController='0';

  String?  titleWelcom='هذا عميل مشترك جديد , قم بالتواصل مع العميل والترحيب به ثم اكتب تعليق وانقر على زر تم الترحيب بالعميل';

  String?  titleInstall='هذا العميل مشترك جديد , قم بالتواصل مع العميل والتأكد من جودة التركيب والتدريب له , ثم اكتب تعليق وانقر على زر تم التواصل';

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.com.fkClient);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body:  ModalProgressHUD(
        inAsyncCall: Provider.of<communication_vm>(context,listen: true).isload,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                widget.com.dateCommunication==null?
                Text(widget.com.typeCommuncation=='تركيب'?
                     titleInstall.toString()
                    :titleWelcom.toString() ):Container(),
                Divider(thickness: 1,color: Colors.grey,),
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
                widget.com.typeCommuncation=='تركيب'&& widget.com.dateCommunication==null?
                RowEdit(name: 'هل العميل راضي عن خدمة التركيب والتدريب', des: 'required'):Container(),

                widget.com.typeCommuncation=='تركيب'&& widget.com.dateCommunication==null?
                // Container(
                //   padding: EdgeInsets.only(left: 2,right: 2),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all( Radius.circular(12)),
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //         offset: Offset(1.0, 1.0),
                //         blurRadius: 8.0,
                //         color: Colors.black87.withOpacity(0.2),
                //       ),
                //     ],
                //     color: Colors.white38,
                //   ),
                //   child:
                  Consumer<communication_vm>(
                      builder: (context, selectedProvider, child){
                        return  GroupButton(
                            controller: GroupButtonController(
                              selectedIndex:selectedProvider.selectedtypeinstall,

                            ),
                            options: GroupButtonOptions(
                                selectedColor: kMainColor,
                                buttonWidth: 120,
                                borderRadius: BorderRadius.circular(10)),
                            buttons: ['غير راضي','راضي'],
                            onSelected: (index,isselected){
                              print(index);
                              //setState(() {
                              typepayController=index.toString();
                              selectedProvider.changeinstall(index);
                              //});
                            }
                        );
                      }

                  )
               // )
                    :Container(),
                SizedBox(height: 20,),

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
                                    idclient: widget.com.fkClient ,
                                  )));
                        },
                        child: Text(' ملف العميل')) ,

    ElevatedButton(
                          style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all(
                               widget.com.dateCommunication==null?kMainColor:kWhiteColor
                              )),
                          onPressed: () async{
                            if(widget.com.dateCommunication==null) {
                              Provider.of<communication_vm>
                            (context,listen: false).addcommuncation({
                            'fk_user':Provider.of<user_vm_provider>
                               (context,listen: false).currentUser.idUser.toString(),
                            'date_communication':DateTime.now().toString(),
                            'result':typepayController,//
                                'nameUser':Provider.of<user_vm_provider>
                                  (context,listen: false).currentUser.nameUser.toString(),
                            // 'rate':widget.com.rate.toString(),
                            // 'number_wrong':widget.com.number_wrong.toString(),
                            // 'client_repeat':widget.com.clientRepeat.toString(),
                            // 'date_next':widget.com.dateNext.toString(),
                          },widget.com.idCommunication).then((value) =>

                           clear(value)
                          );
                          }},
                          child: Text(' تم التواصل ',

                            style: TextStyle(color:widget.com.dateCommunication==null?kWhiteColor: kMainColor),)) ,
                  ],
                ),
                SizedBox(height: 10,),
                RowEdit(name: 'البيانات', des: ''),
                cardRow(
                    title: 'تاريخ عقد الإشتراك',
                    value: widget.com.date_approve.toString()),
                SizedBox(height: 10,),
                widget.com.typeCommuncation=='تركيب'&&widget.com.dateCommunication!=null?
                cardRow(
                    title: 'تاريخ التركيب',
                    value:widget.com.dateinstall_done.toString()):Container(),
                  SizedBox(height: 10,),
                widget.com.typeCommuncation=='تركيب'&&widget.com.dateCommunication!=null?
                cardRow(
                    title: 'تاريخ التركيب',
                    value:widget.com.dateCommunication.toString()):Container(),

                widget.com.typeCommuncation=='ترحيب'&&widget.com.dateCommunication!=null?
                cardRow(
                    title: 'تاريخ الترحيب',
                    value:widget.com.dateCommunication.toString()):
                // cardRow(
                //     title: 'تاريخ التدريب',
                //     value:widget.com.dateCommunication.toString()),
                SizedBox(height: 10,),

                widget.com.nameUser!=null?
                cardRow(
                    title: 'تم التواصل من قبل  ',
                    value:widget.com.nameUser.toString()):Container(),

                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Form(
                        key: _globalKey,
                        child: EditTextFormField(
                          vaild:  (value) {
                            if (value!.toString().trim().isEmpty) {
                              return label_empty;
                            }
                          },
                          maxline: 3,
                          paddcustom: EdgeInsets.only(top: 20,left: 3,right: 3,bottom: 3),
                          controller: _comment, hintText: 'إضافة تعليق',
                          // keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          if(_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();

                            Provider.of<comment_vm>(context, listen: false)
                                .addComment_vm({
                              'content': _comment.text,
                              'fk_user': await Provider
                                  .of<user_vm_provider>(context,
                                  listen: false)
                                  .currentUser
                                  .idUser
                                  .toString(),
                              'fk_client': widget.com.fkClient,
                              'fkuser_client': widget.com.fkUser.toString(), //صتحب العميل
                              'nameUser': widget.com.nameUser.toString(),
                              'date_comment':
                              //Utils.toDateTime(
                              DateTime.now().toString(),
                              //),
                              'nameUser': Provider
                                  .of<user_vm_provider>(context,
                                  listen: false)
                                  .currentUser
                                  .nameUser,
                              'img_image': '',
                              'name_enterprise': widget.com.nameEnterprise
                            }, Provider
                                .of<user_vm_provider>(context,
                                listen: false)
                                .currentUser
                                .img_image,);
                            _comment.text = '';
                          }},
                        icon: Icon(Icons.send, color: kMainColor)),

                  ],
                ),
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
                // commentView(client: widget.com.fkClient.toString(),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clear(value) {

   // Navigator.pop(context);
    setState(() {
      widget.com=value;
    });
  }

}
