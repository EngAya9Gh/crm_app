import 'package:crm_smart/core/common/widgets/text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui/widgets/custom_widget/RowWidget.dart';
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
          cardRow(
                    title: "الاسم",
                    value: state.currentPaticipate!.name_participate),
          cardRow(
                    title: "رقم الهاتف",
                    value: state.currentPaticipate!.mobile_participate),
          cardRow(
                    title: "اسم البنك",
                    value: state.currentPaticipate!.namebank_participate),
          cardRow(
                    title: "رقم البنك",
                    value: state.currentPaticipate!.numberbank_participate),
          state.currentPaticipate!.nameUserAdd!=null?
          cardRow(
                    title: "الموظف الذي أضاف",
                    value: state.currentPaticipate!.nameUserAdd.toString()):Container(),
          state.currentPaticipate!.addDate!=null? cardRow(
                    title: "تاريخ الاضافة",
                    value: state.currentPaticipate!.addDate.toString()):Container(),
          state.currentPaticipate!.nameUserUpdate!=null?cardRow(
                    title: "آخر من عدل",
                    value: state.currentPaticipate!.nameUserUpdate.toString()):Container(),
          state.currentPaticipate!.updateDate!=null? cardRow(
                    title: "تاريخ التعديل",
                    value: state.currentPaticipate!.updateDate.toString()):Container(),
              ])
            : Center(child: Text('حدث خطاء')),
      );
    });
  }
}
