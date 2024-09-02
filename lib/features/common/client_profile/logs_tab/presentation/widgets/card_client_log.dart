import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
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
              if (log.actionDate != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                      _prepareDateAndTime(context, dateTime: log.actionDate!),
                ),
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
                  return Row(
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
                          child: _isDate(log.changesData?[index].old)
                              ? _prepareDateAndTime(context,
                                  dateTime: log.changesData![index].old!)
                              : AppText(
                                  log.changesData?[index].old,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                        ),
                      ],
                      10.width,
                      if (log.changesData?[index].theNew != null) ...[
                        Flexible(
                          flex: 2,
                          child: _isDate(log.changesData?[index].theNew)
                              ? _prepareDateAndTime(context,
                                  dateTime: log.changesData![index].theNew!)
                              : AppText(
                                  log.changesData?[index].theNew,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isDate(String? key) {
    final date = DateTime.tryParse(key ?? '');
    return date != null;
  }

  Widget _prepareDateAndTime(BuildContext context, {required String dateTime}) {
    final date = HelperFunctions.formatDate(dateTime);
    final time =
        TimeOfDay.fromDateTime(DateTime.parse(dateTime)).format(context);
    return AppText(
      "$date  $time",
      textDirection: TextDirection.ltr,
      fontSize: 18,
    );
  }
}
