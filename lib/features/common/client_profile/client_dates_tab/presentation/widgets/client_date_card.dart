import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/data/models/client_date_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

class ClientDateCard extends StatefulWidget {
  final ClientDateModel event;

  ClientDateCard({
    required this.event,
  });

  @override
  State<ClientDateCard> createState() => _ClientDateCardState();
}

class _ClientDateCardState extends State<ClientDateCard> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(12.0),
          color: IsDoneDateEnumExtension.color(isDone: (event.isDone??false) ?"1":"2"),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      '${event.nameUser}',
                      fontFamily: AppFonts.fontFamily1,
                    ),
                    AppText(
                      '${intl.DateFormat("hh:mm a").format(event.dateClientVisit!)}'
                      ' - '
                      '${intl.DateFormat("hh:mm a").format(event.dateEnd!)}',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.end,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                    if (event.nameCityClient != null) ...[
                      AppText(
                        '${event.nameCityClient}',
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ],
                    _showTextIfNotNull(event.typeDate, 'النوع:'),
                    _showTextIfNotNull(event.nameUser, 'موظف الدعم :'),
                    _showTextIfNotNull(event.nameUserAdd, 'اضاف الجدولة :'),
                    _showTextIfNotNull(
                        intl.DateFormat("dd MM yyyy, hh:mm a").format(event.dateCreate!), 'تاريخ إضاف الجدولة :'),
                    _showTextIfNotNull(
                        event.nameUserClose, 'آخر من قام بالتعديل :'),
                  ],
                ),
              ),
              if (event.isDoneInstall == '1') ...[
                const SizedBox(width: 16),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _showTextIfNotNull(String? value, [String title = '']) {
    if (value == null) return SizedBox.shrink();
    if (title.isNotEmpty) title += ' ';
    return RichText(
      text: TextSpan(
        text: title,
        style: AppStyles.textStyle.copyWith(
          fontFamily: AppFonts.fontFamily1,
        ),
        children: [
          TextSpan(
            text: value,
            style: AppStyles.textStyle.copyWith(
              color: AppColors.primaryMain,
              fontSize: 16,
              fontFamily: AppFonts.fontFamily1,
            ),
          ),
        ],
      ),
    );
  }


}
