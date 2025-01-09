import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../model/commentmodel.dart';

//uplode 2023
class cardcomment extends StatelessWidget {
  cardcomment({required this.commentmodel, Key? key}) : super(key: key);
  CommentModel commentmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 2),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.white24 //.withOpacity(0.2),
                              ),
                        ],
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  child: _prepareImage(),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      commentmodel.nameUser,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    2.height,
                                    AppText(
                                      commentmodel.type_comment,
                                      color: AppColors.primaryMain,
                                    ),
                                    2.height,
                                    AppText(
                                      HelperFunctions.dateTimeToString(DateTime.parse(
                                        commentmodel.date_comment,
                                      )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onLongPress: () async {
                                await HelperFunctions.copyToClipboard(commentmodel.content);
                                AppSnackbar.showSnakeBar('Copied to your clipboard!');
                              },
                              child: AppText(
                                commentmodel.content,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Icon(
                    //   Icons.arrow_back_ios_new_outlined,
                    //   color: Colors.black54,
                    // ),
                  ],
                ),
              ),
            ]));
  }

  Widget _prepareImage() {
    final imageUrl = commentmodel.imgImage ?? '';
    final name = commentmodel.nameUser ?? '';
    if (imageUrl.isEmpty) {
      if (name.isEmpty) {
        return Icon(
          Icons.person,
          size: 50,
          color: Colors.lightBlueAccent,
        );
      } else {
        return Text(name.substring(0, 1));
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: AppCachedNetworkImage(
        width: 1000,
        height: 1000,
        fit: BoxFit.fill,
        imageUrl: "${EndPoints.baseUrls.urlImage}$imageUrl",
      ),
    );
  }
}
