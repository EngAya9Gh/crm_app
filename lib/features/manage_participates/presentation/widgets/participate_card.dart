

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/action_participate_page.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';

class ParticipateCard extends StatefulWidget {
  final ParticipateModel participate;
  const ParticipateCard({required this.participate,Key? key}) : super(key: key);

  @override
  State<ParticipateCard> createState() => _ParticipateCardState();
}

class _ParticipateCardState extends State<ParticipateCard> {
  @override
  Widget build(BuildContext context) {
     
    return  Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: context.colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.edit_rounded,
            label: 'تعديل',
            onPressed: (context)=> Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ActionParticipate(
                participate: widget.participate)))
          ),
         
        ],
      ),
      child: InkWell(
        onTap: () {
      context.read<ParticipateListBloc>().add(ChanageCurrentParticipate(widget.participate));
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ParticipateProfilePage()));

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
    
          //color: kMainColor,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Center(
              child: Text(
                widget.participate.name_participate,
                style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
              ),
            ),
          ),
        ),
      ),
      ),
    ),
    );
                                  
  }

  
}