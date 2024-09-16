import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/end_points.dart';
import '../helpers/helper_functions.dart';
import 'app_cached_network_image.dart';
import 'app_icon.dart';
import 'profile_comments_model.dart';

//uplode 2023
class AppCommentCard extends StatelessWidget {
  AppCommentCard({
    super.key,
    required this.comment,
  });

  final ProfileCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  color: Colors.white24 //.withOpacity(0.2),
                  ),
            ],
            color: Colors.black12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.scaleIconsSize,
                    child: comment.imgImage.toString().trim().length == 0
                        ? comment.nameUser.toString().isEmpty ||
                                comment.nameUser == null
                            ? AppIcon(
                                Icons.person,
                                color: Colors.lightBlueAccent,
                              )
                            : AppText(
                                comment.nameUser.toString().substring(0, 1))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: AppCachedNetworkImage(
                              width: 1000,
                              height: 1000,
                              fit: BoxFit.fill,
                              imageUrl:
                                  "${EndPoints.baseUrls.urlImage}${comment.imgImage}",
                            ),
                          ),
                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        comment.nameUser ?? '',
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        comment.dateComment != null
                            ? HelperFunctions.dateTimeToString(
                                DateTime.parse(comment.dateComment.toString()))
                            : '',
                        fontSize: 18,
                      ),
                    ],
                  )
                ],
              ),
              10.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onLongPress: () => HelperFunctions.copyToClipboard(
                    comment.content ?? '',
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: AppText(comment.content ?? ''),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
