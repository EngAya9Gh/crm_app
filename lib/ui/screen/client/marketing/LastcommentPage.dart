import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/lastCommentClientModel.dart';
import '../../../../view_model/comment.dart';
import '../../../widgets/custom_widget/RowWidget.dart';
import '../../care/card_comment.dart';

class lastcomment_page extends StatelessWidget {
   lastcomment_page({Key? key,
     required
   this.LastcommentClient}) : super(key: key);
   LastcommentClientModel LastcommentClient;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          cardRow(
              title: 'تاريخ عقد الإشتراك',
              value: LastcommentClient.client_obj!.nameEnterprise.toString()) ,

          cardRow(
              title: 'المبلغ المدفوع',
              value:  LastcommentClient.client_obj!.amountPaid.toString()),
          Container(
            height: MediaQuery.of(context).size.height* 0.45,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8, right: 8, top: 10.0, bottom: 5),
              child: Consumer<comment_vm>(builder: (context, value, child) {
                return value.listComments.length == 0
                    ? Text('')
                    : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: LastcommentClient.allComment!.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child:
                                    //Text(''),
                                    cardcomment(
                                      commentmodel:
                                      LastcommentClient.allComment![index],
                                    )));
                          }),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
