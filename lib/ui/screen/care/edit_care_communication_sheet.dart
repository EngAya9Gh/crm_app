import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../core/common/models/config_model.dart';
import '../../../core/common/widgets/custom_dropdown.dart';
import '../../../model/communication_modle.dart';
import '../../../model/communication_withdrawal_reason_model.dart';
import '../../../provider/config_vm.dart';
import '../../../view_model/communication_vm.dart';
import 'communication_withdrawal_reasons_drop_down.dart';
import 'rate_widget.dart';

class EditCareCommunicationSheet extends StatefulWidget {
  const EditCareCommunicationSheet({Key? key, required this.communicationModel})
      : super(key: key);

  final CommunicationModel communicationModel;

  @override
  State<EditCareCommunicationSheet> createState() =>
      _EditCareCommunicationSheetState();
}

class _EditCareCommunicationSheetState
    extends State<EditCareCommunicationSheet> {
  late CommunicationModel communicationModel;
  double rate = 0.0;
  bool typepayController = false;
  bool numberwrong = false;
  bool repeat = false;
  bool isRecommendation = false;
  bool isVisit = false;
  bool isSuspend = false;
  late ConfigModel peroid;
  double rateSupportValue = 0.0;
  double rateProductValue = 0.0;

  ValueNotifier<PeriodicCommunicationClientTypeEnum?> clientTypeNotifier =
      ValueNotifier<PeriodicCommunicationClientTypeEnum?>(null);
  ValueNotifier<CommunicationWithdrawalReasonModel?> withdrawalReasonNotifier =
      ValueNotifier<CommunicationWithdrawalReasonModel?>(null);

  @override
  void initState() {
    communicationModel = widget.communicationModel;
    rate = num.tryParse(communicationModel.rate ?? '0')?.toDouble() ?? 0;
    rateSupportValue =
        num.tryParse(communicationModel.rateSupportValue ?? '0')?.toDouble() ??
            0;
    rateProductValue =
        num.tryParse(communicationModel.rateProductValue ?? '0')?.toDouble() ??
            0;
    typepayController = communicationModel.result.toString() == 'true';
    numberwrong = communicationModel.number_wrong.toString() != 'false';
    repeat = communicationModel.clientRepeat.toString() != 'false';
    isRecommendation = communicationModel.isRecommendation.toString() == 'true';
    isVisit = communicationModel.is_visit.toString() == 'true';
    isSuspend = communicationModel.is_suspend.toString() == 'true';
    if (communicationModel.details.isNotEmpty) {
      clientTypeNotifier.value = PeriodicCommunicationClientTypeEnum.fromString(
          communicationModel.details.last.state);
    }

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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey),
              ),
              SizedBox(height: 20),
              communicationModel.typeCommuncation == 'دوري'
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
              communicationModel.typeCommuncation == 'دوري'
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
              communicationModel.typeCommuncation == 'دوري'
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
              communicationModel.typeCommuncation == 'دوري'
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
              communicationModel.typeCommuncation == 'دوري'
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
              communicationModel.typeCommuncation == 'دوري'
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
              SizedBox(height: 10),
              if (communicationModel.typeCommuncation == 'تركيب' ||
                  communicationModel.typeCommuncation == 'دوري')
                RateWidget(
                  context: context,
                  title: 'تقييم عام',
                  initialRating: rate,
                  rateValue: rateSupportValue,
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating;
                    });
                  },
                ),
              if (communicationModel.typeCommuncation == 'دوري') ...[
                RateWidget(
                  context: context,
                  title: 'تقييم المنتج',
                  initialRating: rateProductValue,
                  rateValue: rateSupportValue,
                  onRatingUpdate: (rating) {
                    setState(() {
                      rateProductValue = rating;
                    });
                  },
                ),
                RateWidget(
                  context: context,
                  title: 'تقييم الدعم الفني (الشات)',
                  initialRating: rateSupportValue,
                  rateValue: rateSupportValue,
                  onRatingUpdate: (rating) {
                    setState(() {
                      rateSupportValue = rating;
                    });
                  },
                ),
              ],
              10.height,
              CustomDropDown<PeriodicCommunicationClientTypeEnum>(
                hint: "نوع العميل",
                items: PeriodicCommunicationClientTypeEnum.values,
                itemAsString: (item) => item!.value,
                selectedItem: clientTypeNotifier.value,
                onChanged: (value) => clientTypeNotifier.value = value,
                height: 105.h,
              ),
              10.height,
              ListenableBuilder(
                listenable: clientTypeNotifier,
                builder: (context, child) {
                  if (clientTypeNotifier.value?.isWithdrawn ?? false) {
                    return CommunicationWithdrawalReasonsDropDown(
                      initialValue: communicationModel.details.last.reason,
                      withdrawalReason: withdrawalReasonNotifier.value,
                      onChanged: (value) {
                        withdrawalReasonNotifier.value = value;
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              20.height,
              SizedBox(height: 20),
              Consumer<communication_vm>(
                  builder: (context, communicationVm, _) {
                if (communicationVm.isload) {
                  return Center(child: CircularProgressIndicator());
                }

                return SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kMainColor)),
                      onPressed: () async {
                        final communicationVm =
                            context.read<communication_vm>();
                        context.read<config_vm>();

                        if (communicationModel.typeCommuncation != 'دوري') {
                          communicationVm.addCommunication(
                            {
                              'result': '0',
                              'type_install': widget
                                  .communicationModel.type_install
                                  .toString(),
                              'id_invoice':
                                  communicationModel.id_invoice.toString(),
                              'rate': rate.toString(),
                              'rate_product': rateProductValue.toString(),
                              'rate_chat': rateSupportValue.toString(),
                              'updated': '1',
                              if (clientTypeNotifier.value != null)
                                'state': clientTypeNotifier.value!.value,
                              if (withdrawalReasonNotifier.value != null)
                                'reason_id':
                                    withdrawalReasonNotifier.value!.idReason,
                            },
                            communicationModel.idCommunication,
                            communicationModel.type_install == null
                                ? 1
                                : int.parse(widget
                                    .communicationModel.type_install
                                    .toString()),
                            onSuccess: () => Navigator.pop(context),
                          ).then((value) => clear(value));
                        } else {
                          communicationVm.isloadval(true);

                          await communicationVm.updateCareCommunication(
                            body: {
                              'type': 'دوري',
                              'result': typepayController.toString(),
                              'rate': rate.toString(),
                              'rate_product': rateProductValue.toString(),
                              'rate_chat': rateSupportValue.toString(),
                              'number_wrong': numberwrong.toString(),
                              'client_repeat': repeat.toString(),
                              'isRecommendation': isRecommendation.toString(),
                              'is_visit': isVisit.toString(),
                              'updated': '1',
                              if (clientTypeNotifier.value != null)
                                'state': clientTypeNotifier.value!.value,
                              if (withdrawalReasonNotifier.value != null)
                                'reason_id':
                                    withdrawalReasonNotifier.value!.idReason,
                            },
                            id_communication:
                                communicationModel.idCommunication,
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
      if (value != null) communicationModel = value;
    });
  }
}
