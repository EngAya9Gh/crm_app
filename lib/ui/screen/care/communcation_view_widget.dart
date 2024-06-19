import 'package:crm_smart/core/common/enums/installation_type_enum.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/add_date_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/communication_modle.dart';
import '../../../model/configmodel.dart';
import '../../../view_model/communication_vm.dart';
import '../../widgets/custom_widget/card_expansion.dart';
import '../../widgets/custom_widget/card_row.dart';
import 'edit_care_communication_sheet.dart';

class CommunicationExpandedWidget extends StatefulWidget {
  CommunicationExpandedWidget({
    super.key,
    required this.element,
    required this.initiallyExpanded,
  });

  CommunicationModel element;
  final bool initiallyExpanded;

  @override
  State<CommunicationExpandedWidget> createState() =>
      _CommunicationExpandedWidgetState();
}

class _CommunicationExpandedWidgetState
    extends State<CommunicationExpandedWidget> {
  bool typepayController = false;
  bool numberwrong = false;
  bool repeat = false;
  bool isdone = false;
  late ConfigModel peroid;
  bool isRecommendation = false;
  bool isVisit = false;
  bool isSuspend = false;
  late final communication_vm watchCommunicationVm;
  late final communication_vm listenCommunicationVm;
  double rateSalesValue = 0.0;
  double rateSupportValue = 0.0;
  double rateProductValue = 0.0;

  @override
  void initState() {
    listenCommunicationVm = context.read<communication_vm>();
    watchCommunicationVm = context.read<communication_vm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? dateinvoice = widget.element.date_create;
    String val = dateinvoice != null ? '(فاتورة ${dateinvoice})' : '';

    if (widget.element.idCommunication != '') {
      return buildcardExpansion(
        get_title_care(widget.element.typeCommuncation.toString()) + val,
        '',
        widget.element.dateCommunication != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    widget.element.typeCommuncation == 'ترحيب'
                        ? CardRow(
                            title: 'تم الترحيب من قبل',
                            value: getnameshort(
                                widget.element.nameUser.toString()),
                          )
                        : Container(),
                    widget.element.typeCommuncation == 'ترحيب'
                        ? CardRow(
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

                    widget.element.typeCommuncation == 'دوري' ||
                            widget.element.typeCommuncation == 'تركيب'
                        ? CardRow(
                            title: 'موظف التقييم',
                            value: getnameshort(
                                widget.element.nameUser.toString()),
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' ||
                            widget.element.typeCommuncation == 'تركيب'
                        ? CardRow(
                            title: 'تاريخ التقييم',
                            value: widget.element.dateCommunication.toString(),
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.result.toString() == 'true'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: widget.element.result.toString() == 'true'
                                ? 'لايستخدم النظام'
                                : 'يستخدم النظام',
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.clientRepeat.toString() != 'false'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: widget.element.clientRepeat.toString() ==
                                    'false'
                                ? ''
                                : 'العميل متكرر',
                          )
                        : Container(),
                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.number_wrong.toString() != 'false'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: widget.element.number_wrong.toString() ==
                                    'false'
                                ? ''
                                : 'الرقم خاطئ',
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.isRecommendation.toString() == 'true'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: 'وصى بالنظام',
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.is_visit.toString() == 'true'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: 'يحتاج زيارة ميدانية',
                          )
                        : Container(),
                    widget.element.typeCommuncation == 'دوري' &&
                            widget.element.is_suspend.toString() == 'true'
                        ? CardRow(
                            title: ' نتيجة التواصل',
                            value: 'معلق',
                          )
                        : Container(),
                    widget.element.typeCommuncation == 'تركيب'
                        ? CardRow(
                            title: ' نوع التركيب',
                            value: widget.element.type_install.toString() == '1'
                                ? 'جودة أول'
                                : 'جودة ثاني',
                          )
                        : Container(),

                    widget.element.typeCommuncation == 'دوري' ||
                            widget.element.typeCommuncation == 'تركيب'
                        ? Row(
                            children: [
                              Text('مستوى التقييم'),
                              RatingBar.builder(
                                initialRating:
                                    num.tryParse(widget.element.rate.toString())
                                            ?.toDouble() ??
                                        0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                // glow: true,
                                ignoreGestures: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
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
                    AppElevatedButton(
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => EditCareCommunicationSheet(
                                communicationModel: widget.element),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
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
            // : Provider.of<communication_vm>(context,listen: true).isload?
            //    Center(child: CircularProgressIndicator())
            : watchCommunicationVm.isload
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget.element.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: new Text('لا يستخدم النظام'),
                                value: typepayController, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
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
                                title:
                                    new Text('لايوجد رقم هاتف-أو الرقم خاطئ'),
                                value: numberwrong, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
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
                                    isSuspend = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        if (widget.element.typeCommuncation == 'تركيب' ||
                            widget.element.typeCommuncation == 'دوري') ...[
                          _buildRatingRow(
                            title: 'التقييم',
                            rateValue: rateSalesValue,
                            onRatingUpdate: (value) {
                              setState(() {
                                rateSalesValue = value;
                              });
                            },
                          ),
                        ],
                        if (widget.element.typeCommuncation == 'دوري') ...[
                          _buildRatingRow(
                            title: 'تقييم المنتج',
                            rateValue: rateProductValue,
                            onRatingUpdate: (value) {
                              setState(() {
                                rateProductValue = value;
                              });
                            },
                          ),
                          _buildRatingRow(
                            title: 'تقييم الدعم الفني (الشات)',
                            rateValue: rateSupportValue,
                            onRatingUpdate: (value) {
                              setState(() {
                                rateSupportValue = value;
                              });
                            },
                          ),
                        ],
                        AppElevatedButton(
                          isLoading: listenCommunicationVm.isload,
                          text: 'تم التواصل',
                          onPressed: () async {
                            await _onDoneCommunication(context);
                            if (widget.element.typeCommuncation == 'ترحيب')
                              _addDateInstall(context).then((value) async {
                                if (value == true) {}
                              });
                          },
                        ),
                      ],
                    ),
                  ),
        initiallyExpanded: widget.initiallyExpanded,
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildRatingRow({
    required String title,
    required double rateValue,
    required void Function(double) onRatingUpdate,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppText(
            '${title}',
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
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
          onRatingUpdate: onRatingUpdate,
        ),
      ],
    );
  }

  Future<bool?> _addDateInstall(BuildContext context) async {
    return await showDialog<bool?>(
      context: context,
      builder: (context) {
        return AddDateDialog(
          list_installation_type:
              InstallationTypeEnum.values.map((e) => e.value).toList(),
          invoiceId: widget.element.id_invoice,
          idClient: widget.element.fkClient,
          datesInstallation: null,
        );
      },
    );
  }

  Future<void> _onDoneCommunication(BuildContext context) async {
    Provider.of<communication_vm>(context, listen: false).isloadval(true);

    if (widget.element.typeCommuncation != 'دوري') {
      Provider.of<communication_vm>(context, listen: false).addCommunication(
          {
            'rate': rateSalesValue.toString(),
            'rate_product': rateProductValue.toString(),
            'rate_support': rateSupportValue.toString(),
            'result': '0',
            'type_install': widget.element.type_install.toString(),
            'id_invoice': widget.element.id_invoice.toString(),
          },
          widget.element.idCommunication,
          widget.element.type_install == null
              ? 1
              : int.parse(widget.element.type_install.toString())).then(
          (value) => clear(value));
    } else {
      if (widget.element.dateCommunication == null) {
        if (isSuspend.toString() == 'true') rateSalesValue = 0.0;

        await Provider.of<communication_vm>(context, listen: false)
            .updateCareCommunication(
          body: {
            'rate': rateSalesValue.toString(),
            'number_wrong': numberwrong.toString(),
            'client_repeat': repeat.toString(),
            'type': 'دوري',
            'result': typepayController.toString(), //use or not using
            'isRecommendation': isRecommendation.toString(),
            'is_visit': isVisit.toString(),
            'is_suspend': isSuspend.toString(),
          },
          id_communication: widget.element.idCommunication,
        );
        // clear(val);
      }
    }
  }

  clear(value) {
    // Navigator.pop(context);
    setState(() {
      widget.element = value;
    });
  }
}
