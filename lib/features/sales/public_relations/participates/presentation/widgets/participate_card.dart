import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../constants.dart';
import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/utils/extensions/build_context.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../pages/action_participate_page.dart';
import '../pages/participate_profile_page.dart';

class ParticipateCard extends StatefulWidget {
  const ParticipateCard({
    super.key,
    required this.participate,
  });

  final ParticipateModel participate;

  @override
  State<ParticipateCard> createState() => _ParticipateCardState();
}

class _ParticipateCardState extends State<ParticipateCard> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: context.read<PrivilegeCubit>().checkPrivilege('202'),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: context.colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.edit_rounded,
            label: 'تعديل',
            onPressed: (context) {
              AppNavigator.push(
                ActionParticipate(participate: widget.participate),
              );
            },
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context
              .read<ParticipateListBloc>()
              .add(ChanageCurrentParticipate(widget.participate));
          AppNavigator.push(ParticipateProfilePage(
            participateId: widget.participate.id_participate,
          ));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Colors.black87.withOpacity(0.2),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),

              //color: AppColors.kMainColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.participate.name_participate,
                          style:
                              TextStyle(fontSize: 14, fontFamily: kfontfamily2),
                        ),
                      ),
                      Text(
                        widget.participate.addDate != null
                            ? DateTime.tryParse(widget.participate.addDate
                                        .toString()) !=
                                    null
                                ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                                    .format(DateTime.parse(
                                        widget.participate.addDate!))
                                : widget.participate.addDate.toString()
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: kfontfamily2,
                            color: AppColors.kMainColor),
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
