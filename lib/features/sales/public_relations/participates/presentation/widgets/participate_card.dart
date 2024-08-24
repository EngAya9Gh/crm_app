import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/extensions/build_context.dart';
import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
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
      child: AppCardContainer(
        onTap: () {
          context
              .read<ParticipateListBloc>()
              .add(ChanageCurrentParticipate(widget.participate));
          AppNavigator.push(ParticipateProfilePage(
            participateId: widget.participate.id_participate,
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                      widget.participate.name_participate,
                      fontSize: 16,
                      fontFamily: AppFonts.fontFamily2,
                    ),
                  ),
                  AppText(
                    _getDate(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.fontFamily2,
                    color: AppColors.primaryColor,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDate() {
    return widget.participate.addDate != null
        ? DateTime.tryParse(widget.participate.addDate.toString()) != null
            ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                .format(DateTime.parse(widget.participate.addDate!))
            : widget.participate.addDate.toString()
        : '';
  }
}
