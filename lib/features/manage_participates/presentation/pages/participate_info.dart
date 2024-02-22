import 'package:crm_smart/common/widgets/text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: state.currentPaticipate != null
            ? Column(children: [
                TextRow(
                    title: "الاسم",
                    data: state.currentPaticipate!.name_participate),
                TextRow(
                    title: "رقم الهاتف",
                    data: state.currentPaticipate!.mobile_participate),
                TextRow(
                    title: "اسم البنك",
                    data: state.currentPaticipate!.namebank_participate),
                TextRow(
                    title: "رقم البنك",
                    data: state.currentPaticipate!.numberbank_participate)
              ])
            : Center(child: Text('حدث خطاء')),
      );
    });
  }
}
