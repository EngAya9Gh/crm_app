

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../data/models/participate_invoice_model.dart';


class InvoiceCard extends StatefulWidget {
  final ParticipateInvoiceModel invoice;
  const InvoiceCard({required this.invoice,Key? key}) : super(key: key);

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
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
            onPressed:(context){}
          //   onPressed: (context)=> Navigator.push(
          // context,
          // CupertinoPageRoute(
          //     builder: (context) => ActionParticipate(
          //       participate: widget.cli)))
          ),
         
        ],
      ),
      child: InkWell(
        onTap: () {
     
      // Navigator.push(
      //     context,
      //     CupertinoPageRoute(
      //         builder: (context) => ParticipateProfilePage()));

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
                widget.invoice.nameUser??'',
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