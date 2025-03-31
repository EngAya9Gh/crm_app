import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/shimmer_widget.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/user_entity.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_status_chip.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../model/commentmodel.dart';
import '../../../model/usermodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class Cardcomment extends StatefulWidget {
  Cardcomment(
      {required this.commentmodel,
      this.userModel,
      this.idClients,
      this.color,
      Key? key,
      this.editCommentModel,
      this.canReplay = false,
      this.fromMenu = false,
      this.replyOnCommentModel,
      this.itemKey,
      this.shouldHighlight = false})
      : super(key: key);
  CommentModel commentmodel;
  UserModel? userModel;
  String? idClients;
  final Color? color;
  final bool fromMenu;
  final ValueChanged<CommentModel>? editCommentModel;
  final ValueChanged<CommentModel>? replyOnCommentModel;
  final bool canReplay;
  final GlobalKey? itemKey;
  final bool shouldHighlight;
  @override
  State<Cardcomment> createState() => _CardcommentState();
}

class _CardcommentState extends State<Cardcomment> {
  final TextEditingController repalyText = TextEditingController();
  final ValueNotifier<bool> tapToRplay = ValueNotifier(false);

  final ValueNotifier<bool> activeRplay = ValueNotifier(false);
  final ValueNotifier<bool> showAll = ValueNotifier(false);

  bool _isHighlighted = false;

  @override
  void initState() {
    super.initState();
    if (widget.shouldHighlight) {
      _triggerHighlight();
    }
  }

  @override
  void didUpdateWidget(Cardcomment oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldHighlight && !oldWidget.shouldHighlight) {
      _triggerHighlight();
    }
  }

  void _triggerHighlight() async {
    setState(() => _isHighlighted = true);
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      setState(() => _isHighlighted = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: _prepareImage(),
                  ),
                ],
              ),
              SizedBox(width: 2),
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    if (!widget.fromMenu)
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppStatusChip(
                            status: widget.commentmodel.type_comment,
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
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                  color: Colors.white24 //.withOpacity(0.2),
                                  ),
                            ],
                            color: _isHighlighted
                                ? AppColors.primaryAltLight
                                : Colors.black12,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // CircleAvatar(
                                    //   radius: 20,
                                    //   child: _prepareImage(),
                                    // ),
                                    // SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            widget.commentmodel.nameUser,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          2.height,
                                          AppText(
                                            _getTimeAgo(widget.commentmodel
                                                    .date_comment ??
                                                ''),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                          5.height,
                                          if (widget.fromMenu)
                                            AppText(
                                              widget
                                                  .commentmodel.nameEnterprise,
                                              color: AppColors.primaryMain,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                if (widget.commentmodel.content.isNotEmpty)
                                  GestureDetector(
                                    onLongPress: () async {
                                      await HelperFunctions.copyToClipboard(
                                          widget.commentmodel.content);
                                      AppSnackbar.showSnakeBar(
                                          'Copied to your clipboard!');
                                    },
                                    child: AppText(
                                      widget.commentmodel.content,
                                      fontSize: 18,
                                    ),
                                  ),
                                Wrap(
                                  children:
                                      (widget.commentmodel.mention_users ?? [])
                                          .map((e) => AppText(' @${e.name} ',
                                              color: AppColors.grey))
                                          .toList(),
                                ),
                                if (widget.commentmodel.nameUser ==
                                    widget.userModel?.nameUser)
                                  if (!widget.fromMenu)
                                    Align(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: InkWell(
                                          onTap: () {
                                            widget.editCommentModel
                                                ?.call(widget.commentmodel);
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.all(8),
                                            child: Icon(Icons.edit,
                                                color: AppColors.grey),
                                          )),
                                    ),
                                if (widget.canReplay)
                                  ListenableBuilder(
                                    listenable: Listenable.merge(
                                        [tapToRplay, activeRplay]),
                                    builder: (context, child) => TapRegion(
                                      behavior: HitTestBehavior.opaque,
                                      onTapOutside: (event) {
                                        tapToRplay.value = false;
                                      },
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 5),
                                          child: AnimatedSwitcher(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              child: tapToRplay.value
                                                  ? AppTextField(
                                                      suffixIcon: context
                                                              .watch<
                                                                  comment_vm>()
                                                              .isLoadingGettingReplies
                                                          ? SizedBox(
                                                              child:
                                                                  AppLoader(),
                                                              width: 20,
                                                              height: 20,
                                                            )
                                                          : activeRplay.value
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    widget.replyOnCommentModel?.call(widget
                                                                        .commentmodel
                                                                        .copyWith(
                                                                            content:
                                                                                repalyText.text));
                                                                    repalyText
                                                                        .clear();
                                                                  },
                                                                  child:
                                                                      Transform
                                                                          .flip(
                                                                    flipX: true,
                                                                    child: Icon(
                                                                      Icons
                                                                          .reply,
                                                                      color: AppColors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                )
                                                              : null,
                                                      filled: true,
                                                      fillColor:
                                                          AppColors.white,
                                                      hintText: '',
                                                      controller: repalyText,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      onChange: (val) {
                                                        activeRplay.value =
                                                            val?.isNotEmpty ??
                                                                false;
                                                      },
                                                      // validator: ,
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        tapToRplay.value = true;
                                                        Provider.of<comment_vm>(
                                                                context,
                                                                listen: false)
                                                            .currentCommentAddReplay(
                                                                widget
                                                                    .commentmodel);
                                                      },
                                                      child:
                                                          AppText('replay'))),
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
            ],
          ),
        ),
        if (widget.commentmodel.hasReplies ?? false)
          ValueListenableBuilder(
            valueListenable: showAll,
            builder: (context, show, child) => Consumer<comment_vm>(
              builder: (context, value, child) => AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: show
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(start: 16),
                        child: (value.isLoadingGettingReplies &&
                                value.idCommentUpdated ==
                                    widget.commentmodel.idComment)
                            ? Column(
                                children: List.generate(
                                  (widget.commentmodel.replies?.length ?? 0) +
                                      1,
                                  (index) => index ==
                                          ((widget.commentmodel.replies
                                                  ?.length ??
                                              0))
                                      ? LoadingCommentWidget()
                                      : Cardcomment(
                                          commentmodel: widget
                                              .commentmodel.replies![index]),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                  widget.commentmodel.replies?.length ?? 0,
                                  (index) => Cardcomment(
                                      commentmodel:
                                          widget.commentmodel.replies![index]),
                                ),
                              ),
                      )
                    : Transform.translate(
                        offset: Offset(-10, -5),
                        child: InkWell(
                          onTap: () {
                            showAll.value = true;
                            value.getAllReply(widget.commentmodel);
                          },
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: AppText(
                              'view all reply',
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          )
      ],
    );
  }

  Widget _prepareImage() {
    final imageUrl = widget.commentmodel.imgImage ?? '';
    final name = widget.commentmodel.nameUser ?? '';
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
        imageUrl: "$imageUrl",
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

String _getTimeAgo(String dateString) {
  try {
    final date = DateTime.parse(dateString);
    return timeago.format(date, locale: 'ar');
  } catch (e) {
    return '';
  }
}

class LoadingCommentWidget extends StatelessWidget {
  const LoadingCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.only(right: 8.0, bottom: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.circular(width: 25, height: 25),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(height: 30),
                    2.height,
                    ShimmerWidget.rectangular(height: 30),
                    5.height,
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ShimmerWidget.rectangular(height: 65),
        ],
      ),
    );
  }
}
