import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool showArrow;
  final bool isRequired;
  final bool showCalendar;
  final VoidCallback? onTap;
  final Widget? customWidget;

  const InfoItem({
    Key? key,
    required this.title,
    this.value = '',
    this.showArrow = false,
    this.isRequired = false,
    this.showCalendar = false,
    this.onTap,
    this.customWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 0.5,
          ),
        ),
      ),
      child:
          customWidget != null ? _buildWithCustomWidget() : _buildWithValue(),
    );
  }

  Widget _buildWithCustomWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        // الجانب الأيمن - العنوان بخلفية رمادية
        Expanded(
          flex: 2,
          child: Container(
            color: Color(0xFFF5F5F5),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            alignment: Alignment.centerRight,
            constraints: BoxConstraints(minHeight: 56),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isRequired)
                  AppText(
                    '* ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                Expanded(
                  child: AppText(
                    title,
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
        // الجانب الأيسر - المحتوى
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: customWidget,
          ),
        ),
      ],
    );
  }

  Widget _buildWithValue() {
    return InkWell(
      onTap: onTap ?? (showArrow ? () {} : null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          // الجانب الأيمن - العنوان بخلفية رمادية
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(minHeight: 56),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isRequired)
                    AppText(
                      '* ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  Expanded(
                    child: AppText(
                      title,
                      style: TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // الجانب الأيسر - القيمة
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: AppText(
                      value,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  if (showArrow)
                    Icon(
                      Icons.chevron_left,
                      color: Color(0xFF757575),
                    ),
                  if (showCalendar)
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.calendar_today,
                        color: Color(0xFF757575),
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
