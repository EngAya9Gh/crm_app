import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../function_global.dart';

Widget commview(CommunicationModel element) {
  if(element.idCommunication!=''){
    String? dateinvoice=element.date_create;
    String val=dateinvoice!=null? '(فاتورة ${dateinvoice})':'';
    return buildcardExpansion(

        get_title_care(element.typeCommuncation.toString())+val, '',
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              element.typeCommuncation=='ترحيب'?
              cardRow(title:'تم الترحيب من قبل' ,
                value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='ترحيب'?
              cardRow(title:'تاريخ الترحيب بالعميل' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:'تم التأكد من جودة التركيب من قبل' ,
                value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:'تاريخ التأكد من التركيب للعميل' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='تركيب'?
              cardRow(title:' نتيجة التواصل' ,value:
              element.result.toString()=='1'?'راضي':'غير راضي',):Container(),


              element.typeCommuncation=='دوري'?
              cardRow(title:'موظف التقييم' ,value:getnameshort(element.nameUser.toString()) ,):Container(),
              element.typeCommuncation=='دوري'?
              cardRow(title:'تاريخ التقييم' ,value: element.dateCommunication.toString(),):Container(),
              element.typeCommuncation=='دوري'?
              Row(children: [
                Text('مستوى التقييم'),
                RatingBar.builder(
                  initialRating:double.parse(element.rate.toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ), onRatingUpdate: (double value) {  },
                ),
              ],):Container(),


            ],
          ),
        )
    );}
  else return Container();
}