import 'package:crm_smart/features/sales/public_relations/participates/presentation/widgets/participate_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_state.dart';

class ParticipateInfo extends StatefulWidget {
  const ParticipateInfo({Key? key}) : super(key: key);

  @override
  State<ParticipateInfo> createState() => _ParticipateInfoState();
}

class _ParticipateInfoState extends State<ParticipateInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipateListBloc, ParticipateListState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: 10,
          top: 15,
        ),
        child: state.currentPaticipate != null
            ? Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      //color: AppColors.kMainColor,
                      decoration: BoxDecoration(
                          color: AppColors.kMainColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(state
                              .currentPaticipate!.mobile_participate
                              .toString());
                        },
                        icon: Icon(Icons.call),
                        iconSize: 15,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(state
                            .currentPaticipate!.mobile_participate
                            .toString());
                      },
                      child: Text(
                        state.currentPaticipate!.mobile_participate.toString(),
                        style: TextStyle(
                            fontFamily: kfontfamily2,
                            color: AppColors.kMainColor),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                CardRow(
                    title: "الاسم",
                    value: state.currentPaticipate!.name_participate),
                // cardRow(
                //           title: "رقم الهاتف",
                //           value: state.currentPaticipate!.mobile_participate),
                CardRow(
                    title: "اسم البنك",
                    value: state.currentPaticipate!.namebank_participate),
                CardRow(
                    title: "رقم البنك",
                    value: state.currentPaticipate!.numberbank_participate),
                CardRow(
                  title: "الموظف الذي أضاف",
                  value: state.currentPaticipate!.nameUserAdd,
                ),
                CardRow(
                  title: "تاريخ الاضافة",
                  value: state.currentPaticipate!.addDate,
                ),
                CardRow(
                    title: "آخر من عدل",
                    value: state.currentPaticipate!.nameUserUpdate.toString()),
                CardRow(
                  title: "تاريخ التعديل",
                  value: state.currentPaticipate!.updateDate.toString(),
                ),
                CardRow(
                    title: "المدينة", value: state.currentPaticipate!.nameCity),
                CardRow(
                  title: "الحالة",
                  value: state.currentPaticipate!.lastState?.state,
                ),
                CardRow(
                  title: "سبب تغيير الحالة",
                  value: state.currentPaticipate!.lastState?.reasonState,
                ),

                Spacer(),
                AppElevatedButton(
                  text: 'حالة المتعاون',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ParticipateStatusDialog(
                        idParticipate: state.currentPaticipate!.id_participate!,
                        stateParticipateModel:
                            state.currentPaticipate?.lastState,
                      ),
                    );
                  },
                ),
              ])
            : Center(child: Text('حدث خطاء')),
      );
    });
  }
}
