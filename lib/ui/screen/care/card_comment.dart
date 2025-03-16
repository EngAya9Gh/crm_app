import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/user_entity.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_status_chip.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../model/commentmodel.dart';
import '../../../model/usermodel.dart';

class Cardcomment extends StatelessWidget {
  Cardcomment(
      {required this.commentmodel,
      this.userModel,
      this.idClients,
      Key? key,
      this.editCommentModel,
      this.canReplay = false,
      this.fromMenu = false,
      this.replyOnCommentModel})
      : super(key: key);
  CommentModel commentmodel;
  UserModel? userModel;
  String? idClients;
  final bool fromMenu;
  final ValueChanged<CommentModel>? editCommentModel;
  final ValueChanged<CommentModel>? replyOnCommentModel;
  final bool canReplay;
  final ValueNotifier<bool> tapToRplay = ValueNotifier(false);
  final ValueNotifier<bool> activeRplay = ValueNotifier(false);
  final TextEditingController repalyText = TextEditingController();
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
                child: Stack(
                  children: [
                    if (!fromMenu)
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppStatusChip(
                            status: commentmodel.type_comment,
                            color: AppColors.primaryMain,
                            fontSize: 13,
                          ),
                        ),
                        left: 0,
                      ),
                    Column(
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
                                    Expanded(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            commentmodel.nameUser,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          2.height,
                                          AppText(
                                            HelperFunctions.dateTimeToString(DateTime.parse(
                                              commentmodel.date_comment,
                                            )),
                                          ),
                                          5.height,
                                          if (fromMenu)
                                            AppText(
                                              commentmodel.nameEnterprise,
                                              color: AppColors.primaryMain,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                if (commentmodel.content.isNotEmpty)
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
                                Wrap(
                                  children:
                                      (commentmodel.mention_users ?? []).map((e) => AppText(' @${e.name} ', color: AppColors.primaryMain)).toList(),
                                ),
                                // if (commentmodel.nameUser == userModel?.nameUser)
                                if (!fromMenu)
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: InkWell(
                                        onTap: () {
                                          editCommentModel?.call(commentmodel);
                                        },
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.all(8),
                                          child: Icon(Icons.edit, color: AppColors.primaryMain),
                                        )),
                                  ),
                                if (canReplay)
                                  ListenableBuilder(
                                    listenable: Listenable.merge([tapToRplay, activeRplay]),
                                    builder: (context, child) => TapRegion(
                                      behavior: HitTestBehavior.opaque,
                                      onTapOutside: (event) {
                                        tapToRplay.value = false;
                                      },
                                      child: Align(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(end: 5),
                                          child: AnimatedSwitcher(
                                              duration: Duration(milliseconds: 200),
                                              child: tapToRplay.value
                                                  ? AppTextField(
                                                      suffixIcon: activeRplay.value
                                                          ? InkWell(
                                                              onTap: () {
                                                                replyOnCommentModel?.call(commentmodel.copyWith(content: repalyText.text));
                                                              },
                                                              child: Transform.flip(
                                                                flipX: true,
                                                                child: Icon(
                                                                  Icons.reply_all,
                                                                  color: AppColors.primaryMain,
                                                                ),
                                                              ),
                                                            )
                                                          : null,
                                                      filled: true,
                                                      fillColor: AppColors.white,
                                                      hintText: '',
                                                      controller: repalyText,
                                                      textDirection: TextDirection.rtl,
                                                      onChange: (val) {
                                                        activeRplay.value = val?.isNotEmpty ?? false;
                                                      },
                                                      // validator: ,
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        tapToRplay.value = true;
                                                      },
                                                      child: AppText('replay'))),
                                        ),
                                      ),
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

  Map<String, dynamic> convertEntityToMapMention(UserEntity userEntity) {
    return {
      'id': userEntity.id,
      'display': userEntity.name,
    };
  }
}
