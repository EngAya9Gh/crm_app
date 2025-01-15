import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/user_entity.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_status_chip.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../model/commentmodel.dart';
import '../../../model/usermodel.dart';

class Cardcomment extends StatelessWidget {
  Cardcomment({required this.commentmodel, this.userModel, this.idClients, Key? key, this.editCommentModel}) : super(key: key);
  CommentModel commentmodel;
  UserModel? userModel;
  String? idClients;
  final ValueChanged<CommentModel>? editCommentModel;

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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onLongPress: () async {
                                          await HelperFunctions.copyToClipboard(commentmodel.content);
                                          AppSnackbar.showSnakeBar('Copied to your clipboard!');
                                        },
                                        child: AppText(
                                          commentmodel.content,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  children:
                                      (commentmodel.mention_users ?? []).map((e) => AppText(' @${e.name} ', color: AppColors.primaryMain)).toList(),
                                ),
                                if (commentmodel.nameUser == userModel?.nameUser)
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: InkWell(
                                      onTap: () {
                                        editCommentModel?.call(commentmodel);
                                      },
                                        /*onTap: () async {
                                          ValueNotifier<List<UserEntity>?> _suggestions = ValueNotifier([]);
                                          Provider.of<comment_vm>(context, listen: false).getAllUsersComment().then(
                                            (value) {
                                              _suggestions.value = value;
                                            },
                                          );
                                          GlobalKey<FlutterMentionsState> keyMention = GlobalKey<FlutterMentionsState>();
                                          List<UserEntity>? usersMentioned = [];
                                          GlobalKey<FormState> _key = GlobalKey();
                                          TextEditingController textContrller = TextEditingController(text: commentmodel.content);
                                          ValueNotifier<CommentTypeEnum?> type =
                                              ValueNotifier(CommentTypeEnum.values.firstWhereOrNull((e) => e.value == commentmodel.type_comment));
                                          keyMention.currentState?.controller?.text = commentmodel.content;
                                          keyMention.currentState?.addMention(
                                              {},
                                              Mention(
                                                trigger: "@",
                                                style: TextStyle(color: AppColors.primaryMain),
                                                data: (commentmodel.mention_users ?? []).map((e) => convertEntityToMapMention(e)).toList(),
                                              ));
                                          showDialog(
                                            context: context,
                                            builder: (context) => Portal(
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: AlertDialog(
                                                  insetPadding: EdgeInsets.symmetric(horizontal: 8),
                                                  title: AppText('تعديل التعليق'),
                                                  content: SizedBox(
                                                    width: MediaQuery.sizeOf(context).width,
                                                    child: Form(
                                                      key: _key,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          ValueListenableBuilder(
                                                            valueListenable: _suggestions,
                                                            builder: (context, value, child) => FlutterMentions(
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(color: context.colorScheme.primary, width: 1),
                                                                    borderRadius: BorderRadius.circular(AppDimensions.kbrBorderTextField),
                                                                  ),focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(color: context.colorScheme.primary, width: 1),
                                                                borderRadius: BorderRadius.circular(AppDimensions.kbrBorderTextField),
                                                              )),
                                                              key: keyMention,
                                                              suggestionPosition: SuggestionPosition.Bottom,
                                                              maxLines: 5,
                                                              minLines: 1,
                                                              textDirection: TextDirection.rtl,
                                                              onMentionAdd: (p0) {
                                                                usersMentioned = List.of(usersMentioned ?? [])
                                                                  ..add(UserEntity(id: p0['id'], name: p0['display']));
                                                              },
                                                              mentions: [
                                                                Mention(
                                                                  suggestionBuilder: (p0) => Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        AppText(p0['display']),
                                                                        Divider(),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  trigger: "@",
                                                                  style: TextStyle(color: AppColors.primaryMain),
                                                                  data: (value ?? []).map((e) => convertEntityToMapMention(e)).toList(),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          10.height,
                                                          ValueListenableBuilder(
                                                            valueListenable: type,
                                                            builder: (context, value, child) => CustomDropDown<CommentTypeEnum>(
                                                              hint: 'نوع التعليق',
                                                              items: CommentTypeEnum.values,
                                                              itemAsString: (value) => value!.value,
                                                              selectedItem: value,
                                                              onChanged: (value) {
                                                                if (value == null) {
                                                                  return;
                                                                }
                                                                type.value = value;
                                                              },
                                                              validator: InputValidator.requiredFiled,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Consumer<comment_vm>(
                                                          builder: (context, value, child) => AppElevatedButton(
                                                            isLoading: value.isloadadd,
                                                            text: 'تاكيد',
                                                            backgroundColor: AppColors.green,
                                                            onPressed: () async {
                                                              if (_key.currentState!.validate()) {
                                                                await Provider.of<comment_vm>(context, listen: false)
                                                                    .editComment_vm(
                                                                        textContrller.text, commentmodel.copyWith(type_comment: type.value!.value))
                                                                    .then(
                                                                  (value) {
                                                                    Provider.of<comment_vm>(context, listen: false).getComments(idClients!);
                                                                    context.pop();
                                                                  },
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        10.height,
                                                        AppElevatedButton(
                                                          text: 'رجوع',
                                                          backgroundColor: AppColors.statusErrorActive,
                                                          onPressed: () async {
                                                            context.pop(false);
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },*/
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.all(8),
                                          child: Icon(Icons.edit, color: AppColors.primaryMain),
                                        )),
                                  )
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
