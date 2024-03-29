import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/clients_care/clients_tickets/data/models/ticket_model.dart';
import '../../../widgets/custom_widget/text_form.dart';
import '../../care/card_comment.dart';

class ticket_rate extends StatefulWidget {
  ticket_rate({required this.ticket_model, Key? key}) : super(key: key);
  TicketModel ticket_model;

  @override
  _ticket_rateState createState() => _ticket_rateState();
}

class _ticket_rateState extends State<ticket_rate> {
  String? typepayController = '0';
  bool numberwrong = false;
  bool repeat = false;
  bool isdone = false;
  double rate = 1.0;
  TextEditingController _textnotes = TextEditingController();

  late ConfigModel peroid;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.ticket_model.fkClient.toString());
      //period_commincation3
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.ticket_model.nameEnterprise.toString()),
      ),
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<communication_vm>(context, listen: true).isload,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                EditTextFormField(
                  maxline: 4,
                  paddcustom: EdgeInsets.all(10),
                  hintText: 'ملاحظات التقييم  ',
                  obscureText: false,
                  controller: _textnotes,
                  vaildator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return 'الحقل فارغ';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('التقييم 1/5'),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
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
                          rate = rating;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                widget.ticket_model.dateRate == null
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kMainColor)),
                        onPressed: () async {
                          Provider.of<ticket_vm>(context, listen: false)
                              .updateTicketvm({
                            'notes_rate': _textnotes.text,
                            'fkuser_rate': Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser
                                .idUser
                                .toString(),
                            'date_rate': DateTime.now().toString(),
                            'rate': rate.toString(),
                            'type_ticket': 'تم التقييم'
                          }, widget.ticket_model.idTicket);
                          Navigator.of(context, rootNavigator: true).pop(false);
                          // Navigator.pop(context);
                        },
                        child: Text(
                          ' تم التقييم ',
                          style: TextStyle(
                              // color:widget.com.dateCommunication==null?
                              color: kWhiteColor),
                        ))
                    : Container(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //         style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(
                //                 kMainColor)),
                //         onPressed: () async{
                //           Navigator.push(context,
                //               CupertinoPageRoute(builder: (context)=>
                //                   ProfileClient(
                //                     idclient: widget.ticket_model.fkClient ,
                //                   )));
                //         },
                //         child: Text(' ملف العميل')) ,
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                // RowEdit(name: 'البيانات', des: ''),
                // (widget.ticket_model.typeCommuncation=='تركيب'&&widget.ticket_model.dateCommunication!=null)
                //     ||( widget.ticket_model.typeCommuncation=='ترحيب'&&widget.ticket_model.dateCommunication!=null)?
                // cardRow(
                //     title: 'تاريخ عقد الإشتراك',
                //     value: widget.ticket_model.date_approve.toString()):Container(),
                // SizedBox(height: 10,),
                // widget.ticket_model.typeCommuncation=='تركيب'&&widget.ticket_model.dateCommunication!=null?
                // cardRow(
                //     title: 'تاريخ التركيب',
                //     value:widget.ticket_model.dateinstall_done.toString()):Container(),
                // widget.ticket_model.typeCommuncation=='ترحيب'&&widget.ticket_model.dateCommunication!=null?
                // cardRow(
                //     title: 'تاريخ الترحيب',
                //     value:widget.ticket_model.dateCommunication.toString()):
                // // cardRow(
                // //     title: 'تاريخ التدريب',
                // //     value:widget.com.dateCommunication.toString()),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 10.0, bottom: 5),
                    child:
                        Consumer<comment_vm>(builder: (context, value, child) {
                      return value.filteredComments.length == 0
                          ? Text('')
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: value.filteredComments.length,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child:
                                                    //Text(''),
                                                    cardcomment(
                                                  commentmodel: value
                                                      .filteredComments[index],
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
  }
}
