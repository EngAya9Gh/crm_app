import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../function_global.dart';

//uplode 2023
class ParticipateCommenttCard extends StatelessWidget {
  ParticipateCommenttCard({required this.comment, Key? key}) : super(key: key);
  final ProfileCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 2,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(15)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Colors.white24 //.withOpacity(0.2),
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
                                  child: comment.imgImage
                                              .toString()
                                              .trim()
                                              .length ==
                                          0
                                      // ||usermodell.img_thumbnail.toString().trim().isEmpty
                                      ? comment.nameUser.toString().isEmpty ||
                                              comment.nameUser == null
                                          ? Icon(
                                              Icons.person,
                                              size: 50,
                                              color: Colors.lightBlueAccent,
                                            )
                                          : Text(comment.nameUser
                                              .toString()
                                              .substring(0, 1))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          child: CachedNetworkImage(
                                            width: 1000,
                                            height: 1000,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            imageUrl: comment.imgImage != ''
                                                ? EndPoints.baseUrls.urlimage +
                                                    comment.imgImage.toString()
                                                : '',
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextUtilis(
                                      color: Colors.black87,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                      textstring: getnameshort(
                                          comment.nameUser.toString()),
                                      underline: TextDecoration.none,
                                    ),
                                    TextUtilis(
                                      color: Colors.black87,
                                      fontSize: 7,
                                      fontWeight: FontWeight.normal,
                                      textstring: comment.dateComment != null
                                          ? Utils.toDateTime(DateTime.parse(
                                              comment.dateComment.toString()))
                                          : '',
                                      underline: TextDecoration.none,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                Clipboard.setData(new ClipboardData(
                                        text: comment.content ?? ''))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Copied to your clipboard !')));
                                });
                              },
                              child: Text(
                                comment.content ?? '',
                                // maxLines: 4,
                                //overflow: TextOverflow.ellipsis,
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
}
