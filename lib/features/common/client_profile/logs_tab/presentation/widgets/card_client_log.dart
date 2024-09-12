import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_log_model.dart';

class CardClientLog extends StatelessWidget {
  const CardClientLog({
    required this.log,
  });

  final ClientLogModel log;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity),
              if (log.actionDate != null) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    _prepareDateAndTime(context, dateTime: log.actionDate!),
                    textDirection: TextDirection.ltr,
                    fontSize: 18,
                  ),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "المستخدم",
                    fontSize: 18,
                  ),
                  10.width,
                  Flexible(
                    child: AppText(
                      log.nameUser,
                      fontSize: 18,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              10.height,
              Align(
                alignment: Alignment.centerLeft,
                child: AppStatusChip(
                  status: log.routeName.toString(),
                  color: Colors.green,
                ),
              ),
              10.height,
              ...List.generate(
                log.changesData?.length ?? 0,
                (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppText(
                              log.changesData?[index].key,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          10.width,
                          if (log.changesData?[index].old != null) ...[
                            Flexible(
                              flex: 2,
                              child: _prepareFromTo(index, context,
                                  text: log.changesData?[index].old,
                                  from: true),
                            ),
                          ],
                          10.width,
                          if (log.changesData?[index].theNew != null) ...[
                            Flexible(
                              flex: 2,
                              child: _prepareFromTo(index, context,
                                  text: log.changesData?[index].theNew),
                            ),
                          ],
                        ],
                      ),
                    ],
                  );
                },
              ),
              5.height,
            ],
          ),
        ),
      ],
    );
  }

  Widget _prepareFromTo(
    int index,
    BuildContext context, {
    String? text,
    bool from = false,
  }) {
    String newValue = "";
    if (text != null) newValue = text;

    if (_isDate(text)) {
      newValue = _prepareDateAndTime(
        context,
        dateTime: text!,
      );
    }

    // for small screens
    if (AppDimensions.currentWidth() < 400) {
      return Wrap(
        children: [
          if (_showFromTo(index)) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: AppText(
                from ? "من" : "إلى",
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.fontFamily1,
              ),
            ),
          ],
          AppText(
            newValue,
            color: Colors.black,
            fontSize: 16,
          ),
        ],
      );
    }

    return Row(
      children: [
        if (_showFromTo(index)) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: AppText(
              from ? "من" : "إلى",
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.fontFamily1,
            ),
          ),
        ],
        Expanded(
          child: AppText(
            newValue,
            color: Colors.black,
            fontSize: 16,
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );

    return AppText(
      newValue,
      color: Colors.black,
      fontSize: 16,
    );
  }

  bool _showFromTo(int index) {
    return log.changesData?[index].old != null &&
        log.changesData?[index].theNew != null;
  }

  bool _isDate(String? key) {
    final date = DateTime.tryParse(key ?? '');
    return date != null;
  }

  String _prepareDateAndTime(BuildContext context, {required String dateTime}) {
    final date = HelperFunctions.formatDate(dateTime);
    final time =
        TimeOfDay.fromDateTime(DateTime.parse(dateTime)).format(context);
    return "$date  $time";
  }
}
