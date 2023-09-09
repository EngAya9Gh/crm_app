import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/communication_modle.dart';
import '../../../model/configmodel.dart';
import '../../../provider/config_vm.dart';
import '../../../view_model/communication_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/RowWidget.dart';
import '../../widgets/custom_widget/card_expansion.dart';
import 'edit_care_communication_sheet.dart';

class communcation_view_widget extends StatefulWidget {
  communcation_view_widget({required this.element, required this.initiallyExpanded, Key? key}) : super(key: key);
  CommunicationModel element;
  final bool initiallyExpanded;

  @override
  State<communcation_view_widget> createState() => _communcation_view_widgetState();
}

class _communcation_view_widgetState extends State<communcation_view_widget> {
  double rate = 0.0;
  bool typepayController = false;
  bool numberwrong = false;
  bool repeat = false;
  bool isdone = false;
  late ConfigModel peroid;
  bool isRecommendation = false;
  bool isVisit = false;
  bool isSuspend = false;

  @override
  Widget build(BuildContext context) {
    String? dateinvoice = widget.element.date_create;
    String val = dateinvoice != null ? '(فاتورة ${dateinvoice})' : '';

    return widget.element.idCommunication != ''
        ? buildcardExpansion(
            get_title_care(widget.element.typeCommuncation.toString()) + val,
            '',
            widget.element.dateCommunication != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget.element.typeCommuncation == 'ترحيب'
                            ? cardRow(
                                title: 'تم الترحيب من قبل',
                                value: getnameshort(widget.element.nameUser.toString()),
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'ترحيب'
                            ? cardRow(
                                title: 'تاريخ الترحيب بالعميل',
                                value: widget.element.dateCommunication.toString(),
                              )
                            : Container(),
                        // widget.element.typeCommuncation == 'تركيب'
                        //     ? cardRow(
                        //         title: 'تم التأكد من جودة التركيب من قبل',
                        //         value: getnameshort(widget.element.nameUser.toString()),
                        //       )
                        //     : Container(),
                        // widget.element.typeCommuncation == 'تركيب'
                        //     ? cardRow(
                        //         title: 'تاريخ التأكد من التركيب للعميل',
                        //         value: widget.element.dateCommunication.toString(),
                        //       )
                        //     : Container(),
                        // element.typeCommuncation=='تركيب'?
                        // cardRow(title:' نتيجة التواصل' ,value:
                        // element.result.toString()=='1'?'راضي':'غير راضي',): Container(),

                        widget.element.typeCommuncation == 'دوري' || widget.element.typeCommuncation == 'تركيب'
                            ? cardRow(
                                title: 'موظف التقييم',
                                value: getnameshort(widget.element.nameUser.toString()),
                              )
                            : Container(),

                        widget.element.typeCommuncation == 'دوري' || widget.element.typeCommuncation == 'تركيب'
                            ? cardRow(
                                title: 'تاريخ التقييم',
                                value: widget.element.dateCommunication.toString(),
                              )
                            : Container(),

                        widget.element.typeCommuncation == 'دوري'&& widget.element.result.toString() != 'false'
                            ? cardRow(
                                title: ' نتيجة التواصل',
                                value: widget.element.result.toString() == 'true' ? 'لايستخدم النظام' : 'يستخدم النظام',
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري' && widget.element.clientRepeat.toString() != 'false'
                            ? cardRow(
                                title: ' نتيجة التواصل',
                                value: widget.element.clientRepeat.toString() == 'false' ? '' : 'العميل متكرر',
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري' && widget.element.number_wrong.toString() != 'false'
                            ? cardRow(
                                title: ' نتيجة التواصل',
                                value: widget.element.number_wrong.toString() == 'false' ? '' : 'الرقم خاطئ',
                              )
                            : Container(),

                        widget.element.typeCommuncation == 'دوري' &&
                                widget.element.isRecommendation.toString() == 'true'
                            ? cardRow(
                                title: ' نتيجة التواصل',
                                value: 'وصى بالنظام',
                              )
                            : Container(),

                        widget.element.typeCommuncation == 'دوري' && widget.element.is_visit.toString() == 'true'
                            ? cardRow(
                                title: ' نتيجة التواصل',
                                value: 'يحتاج زيارة ميدانية',
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري' && widget.element.is_suspend.toString() == 'true'
                            ? cardRow(
                          title: ' نتيجة التواصل',
                          value: 'معلق',
                        )
                            : Container(),
                        widget.element.typeCommuncation == 'تركيب'
                            ? cardRow(
                                title: ' نوع التركيب',
                                value: widget.element.type_install.toString() == '1' ? 'جودة أول' : 'جودة ثاني',
                              )
                            : Container(),

                        widget.element.typeCommuncation == 'دوري' || widget.element.typeCommuncation == 'تركيب'
                            ? Row(
                                children: [
                                  Text('مستوى التقييم'),
                                  RatingBar.builder(
                                    initialRating: num.tryParse(widget.element.rate.toString())?.toDouble() ?? 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    // glow: true,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                ],
                              )
                            : Container(),

                        // if (context.read<privilge_vm>().checkprivlge('125') == true &&
                        //     widget.element.typeCommuncation != 'ترحيب')
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => EditCareCommunicationSheet(communicationModel: widget.element),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                ),
                                isScrollControlled: true,
                              );
                            },
                            child: Text(
                              'تعديل',
                              style: TextStyle(color: kWhiteColor),
                            )),
                      ],
                    ),
                  )
                : Provider.of<communication_vm>(context,listen: true).isload?
                   Center(child: CircularProgressIndicator()) :Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('لا يستخدم النظام'),
                                value: typepayController, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    print(value);
                                    typepayController = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        // widget.element.typeCommuncation == 'دوري'
                        //     ? SizedBox(
                        //         height: 20,
                        //       )
                        //     : Container(),
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('لايوجد رقم هاتف-أو الرقم خاطئ'),
                                value: numberwrong, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    print(value);
                                    numberwrong = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('العميل متكرر'),
                                value: repeat, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    print(value);
                                    repeat = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('وصى بالنظام'),
                                value: isRecommendation, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    print(value);
                                    isRecommendation = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('يحتاج زيارة ميدانية'),
                                value: isVisit, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    print(value);
                                    isVisit = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                          title: new Text('معلق'),
                          value: isSuspend, // as bool,
                          onChanged: (bool? value) {
                            setState(() {
                              print(value);
                              isSuspend = value!;
                              //values[key] = value;
                            });
                          },
                        )
                            : Container(),
                        widget.element.typeCommuncation == 'تركيب' || widget.element.typeCommuncation == 'دوري'
                            ? Row(
                                children: [
                                  Text('التقييم 1/5'),
                                  RatingBar.builder(
                                    initialRating: 0.0,
                                    minRating: 0.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                      setState(() {
                                        rate = rating;
                                        print(rate);
                                      });
                                    },
                                  ),
                                ],
                              )
                            : Container(),
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              if (widget.element.typeCommuncation != 'دوري') {
                                Provider.of<communication_vm>(context,listen: false).setload(true);
                                Provider.of<communication_vm>(context, listen: false).addcommmuncation(
                                    {
                                      //'fk_client':widget.com.fkClient.toString(),
                                      'fk_user': Provider.of<user_vm_provider>(context, listen: false)
                                          .currentUser
                                          .idUser
                                          .toString(),
                                      'date_communication': DateTime.now().toString(),
                                      'result': '0',
                                      //
                                      'nameUser': Provider.of<user_vm_provider>(context, listen: false)
                                          .currentUser
                                          .nameUser
                                          .toString(),
                                      'type_install': widget.element.type_install.toString(),
                                      'id_invoice': widget.element.id_invoice.toString(),
                                      'rate': rate.toString(),
                                    },
                                    widget.element.idCommunication,
                                    widget.element.type_install == null
                                        ? 1
                                        : int.parse(widget.element.type_install.toString())).then(
                                    (value) => clear(value));
                              }
                              else {
                                Provider.of<communication_vm>(context, listen: false).isloadval(true);
                                await Provider.of<config_vm>(context, listen: false).getAllConfig();
                                List<ConfigModel> _listconfg =
                                    Provider.of<config_vm>(context, listen: false).listofconfig;

                                peroid =
                                    _listconfg.firstWhere((element) => element.name_config == 'period_commincation3');

                                DateTime datanext = DateTime.now();

                                int peroidtime = int.parse(peroid.value_config);
                                datanext = Jiffy().add(days: peroidtime).dateTime;
                                print(datanext.toString());
                                // datanext.add(Duration(days: peroidtime));
                                print(datanext);
                                print(widget.element.dateCommunication.toString());
                                print(widget.element.idCommunication);
                                if (widget.element.dateCommunication == null) {
                                  //datanext.add( Duration(days: day+ pp));
                                  // int peroidtime= int.parse(peroid.value_config);
                                  // datanext=Jiffy().add(days: peroidtime).dateTime;
                                  // print(datanext.toString());
                                  // datanext.add(Duration(days: peroidtime));
                                  // print(datanext);
                                  if(isSuspend.toString()=='true')
                                    rate=0.0;

                                  await Provider.of<communication_vm>(context, listen: false).updatecarecommuncation({
                                    'type': 'دوري',
                                    'fk_user': Provider.of<user_vm_provider>(context, listen: false)
                                        .currentUser
                                        .idUser
                                        .toString(),
                                    'date_communication': DateTime.now().toString(),
                                    'result': typepayController.toString(), //use or not using
                                    'rate': rate.toString(),
                                    'number_wrong': numberwrong.toString(),
                                    'client_repeat': repeat.toString(),
                                    'date_next': datanext.toString(),
                                    'isRecommendation': isRecommendation.toString(),
                                    'is_visit': isVisit.toString(),
                                    'is_suspend': isSuspend.toString(),
                                  }, widget.element.idCommunication);
                                  // clear(val);
                                }
                              }
                              Provider.of<communication_vm>(context,listen: false).setload(false);

                            },
                            child: Text(
                              ' تم التواصل ',
                              style:
                                  TextStyle(color: widget.element.dateCommunication == null ? kWhiteColor : kMainColor),
                            )),
                      ],
                    ),
                  ),
            initiallyExpanded: widget.initiallyExpanded,
          )
        : Container();
  }

  clear(value) {
    // Navigator.pop(context);
    setState(() {
      widget.element = value;
    });
  }
}
