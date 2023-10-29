import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../model/communication_modle.dart';
import '../../../model/configmodel.dart';
import '../../../provider/config_vm.dart';
import '../../../view_model/communication_vm.dart';

class EditCareCommunicationSheet extends StatefulWidget {
  EditCareCommunicationSheet({Key? key, required this.communicationModel}) : super(key: key);

  CommunicationModel communicationModel;

  @override
  State<EditCareCommunicationSheet> createState() => _EditCareCommunicationSheetState();
}

class _EditCareCommunicationSheetState extends State<EditCareCommunicationSheet> {
  double rate = 0.0;
  bool typepayController = false;
  bool numberwrong = false;
  bool repeat = false;
  bool isRecommendation = false;
  bool isVisit = false;
  bool isSuspend = false;
  late ConfigModel peroid;

  @override
  void initState() {
    rate = num.tryParse(widget.communicationModel.rate ?? '0')?.toDouble() ?? 0;
    typepayController = widget.communicationModel.result.toString() == 'true';
    numberwrong = widget.communicationModel.number_wrong.toString() != 'false';
    repeat = widget.communicationModel.clientRepeat.toString() != 'false';
    isRecommendation = widget.communicationModel.isRecommendation.toString() == 'true';
    isVisit = widget.communicationModel.is_visit.toString() == 'true';
    isSuspend = widget.communicationModel.is_suspend.toString() == 'true';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 75,
                height: 5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.grey),
              ),
              SizedBox(height: 20),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('لا يستخدم النظام'),
                      value: typepayController, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          typepayController = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('لايوجد رقم هاتف-أو الرقم خاطئ'),
                      value: numberwrong, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          numberwrong = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('العميل متكرر'),
                      value: repeat, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          repeat = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('وصى بالنظام'),
                      value: isRecommendation, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          isRecommendation = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('يحتاج زيارة ميدانية'),
                      value: isVisit, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          isVisit = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'دوري'
                  ? CheckboxListTile(
                      title: new Text('معلق'),
                      value: isSuspend, // as bool,
                      onChanged: (bool? value) {
                        setState(() {
                          isSuspend = value!;
                        });
                      },
                    )
                  : Container(),
              widget.communicationModel.typeCommuncation == 'تركيب' ||
                      widget.communicationModel.typeCommuncation == 'دوري'
                  ? Row(
                      children: [
                        SizedBox(width: 8),
                        Text('التقييم 1/5'),
                        RatingBar.builder(
                          initialRating: rate,
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

                            setState(() {
                              rate = rating;

                            });
                          },
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: 20),
              Consumer<communication_vm>(builder: (context, communicationVm, _) {
                if (communicationVm.isload) {
                  return Center(child: CircularProgressIndicator());
                }

                return SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                      onPressed: () async {
                        final user = context.read<UserProvider>().currentUser;
                        final fkUser = user.idUser.toString();
                        final nameUser = user.nameUser.toString();
                        final communicationVm = context.read<communication_vm>();
                        final configVm = context.read<config_vm>();

                        if (widget.communicationModel.typeCommuncation != 'دوري') {
                          communicationVm.addcommmuncation(
                            {
                              'user_update': fkUser,
                              // 'date_communication': DateTime.now().toString(),
                              'result': '0',
                              'nameUser': nameUser,
                              'type_install': widget.communicationModel.type_install.toString(),
                              'id_invoice': widget.communicationModel.id_invoice.toString(),
                              'rate': rate.toString(),
                              'updated': '1',
                            },
                            widget.communicationModel.idCommunication,
                            widget.communicationModel.type_install == null
                                ? 1
                                : int.parse(widget.communicationModel.type_install.toString()),
                            onSuccess: () => Navigator.pop(context),
                          ).then((value) => clear(value));
                        } else {
                          communicationVm.isloadval(true);
                          await Provider.of<config_vm>(context, listen: false).getAllConfig();
                          List<ConfigModel> _listConfig = configVm.listofconfig;

                          peroid = _listConfig.firstWhere((element) => element.name_config == 'period_commincation3');

                          DateTime dateNext = DateTime.now();

                          int periodTime = int.parse(peroid.value_config);
                          dateNext = Jiffy().add(days: periodTime).dateTime;

                          await communicationVm.updatecarecommuncation(
                            {
                              'type': 'دوري',
                              'user_update': fkUser,
                              // 'date_communication': DateTime.now().toString(),
                              'result': typepayController.toString(), //
                              'rate': rate.toString(),
                              'number_wrong': numberwrong.toString(),
                              'client_repeat': repeat.toString(),
                              'date_next': dateNext.toString(),
                              'isRecommendation': isRecommendation.toString(),
                              'is_visit': isVisit.toString(),
                              'updated': '1',
                            },
                            widget.communicationModel.idCommunication,
                            onSuccess: () => Navigator.pop(context),
                          );
                        }
                      },
                      child: Text(
                        'حفــــظ',
                        style: TextStyle(color: kWhiteColor),
                      )),
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  clear(value) {
    // Navigator.pop(context);
    setState(() {
      widget.communicationModel = value;
    });
  }
}
