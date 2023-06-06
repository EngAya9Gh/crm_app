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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  cardRow(
                      title: 'المؤسسة',
                      value: LastcommentClient.client_obj!.nameEnterprise.toString()) ,

                  cardRow(
                      title: 'اسم العميل',
                      value:  LastcommentClient.client_obj!.nameClient.toString()),
                  cardRow(
                      title: 'الفرع',
                      value:  LastcommentClient.client_obj!.name_regoin.toString()),
                  cardRow(
                      title: 'حالة العميل',
                      value:  LastcommentClient.client_obj!.typeClient.toString()),
                  cardRow(
                      title: 'اسم الموظف',
                      value:  LastcommentClient.client_obj!.nameUser.toString()),
                  cardRow(
                      title: 'آخر تعليق',
                      value:  LastcommentClient.hoursLastComment.toString()=='-1'?'لا بوجد تعليقات':LastcommentClient.hoursLastComment.toString()),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height* 0.45,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 10.0, bottom: 5),
                child: Consumer<comment_vm>(builder: (context, value, child) {
                  return LastcommentClient.allComment.length == 0
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
      ),
    );
  }
}
