import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:flutter/material.dart';

class ItemCommentMentionWidget extends StatelessWidget {
  const ItemCommentMentionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: buildcardExpansion(
          titleWidget: Padding(
            padding: const EdgeInsetsDirectional.only(top: 5, start: 10),
            child: AppText('nameEnterprise',
                color: AppColors.primaryMain, fontSize: 13.0, fontFamily: AppFonts.fontFamily1, fontWeight: FontWeight.bold),
          ),
          subTitleWidget: SizedBox.shrink(),
          '',
          '',
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  .map((e) => Cardcomment(
                        commentmodel: CommentModel(
                            content: 'content' * 10,
                            date_comment: DateTime.now().toIso8601String(),
                            idComment: '1',
                            fkUser: '1',
                            fkClient: '1',
                            nameUser: 'Haidar',
                            imgImage: '',
                            type_comment: ''),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
