import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class InfoItemExtra extends StatelessWidget {
  final String title;
  final String value;
  final bool showArrow;
  final bool isRequired;
  final bool showCalendar;
  final bool isShowWidget;
  final VoidCallback? onTap;
  final Widget? customWidget;
  final Duration animationDuration;
  final bool isClickable;

  const InfoItemExtra({
    Key? key,
    required this.title,
    this.value = '',
    this.showArrow = false,
    this.isRequired = false,
    this.showCalendar = false,
    this.isShowWidget = true,
    this.onTap,
    this.customWidget,
    this.animationDuration = const Duration(milliseconds: 300),
    this.isClickable = false,
  }) : super(key: key);

  bool get _isInteractive => onTap != null || isClickable;

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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isInteractive ? onTap : null,
          hoverColor: _isInteractive ? Colors.grey.withOpacity(0.05) : null,
          highlightColor: _isInteractive ? Colors.grey.withOpacity(0.1) : null,
          splashColor: _isInteractive ? Colors.grey.withOpacity(0.15) : null,
          child: customWidget != null ? _buildWithCustomWidget() : _buildWithValue(),
        ),
      ),
    );
  }

  Widget _buildWithCustomWidget() {
    return Column(
      children: [
        Row(
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
                    if (_isInteractive) ...[
                      SizedBox(width: 8),
                      AnimatedRotation(
                        turns: isShowWidget ? 0.25 : 0,
                        duration: animationDuration,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF757575),
                          size: 20,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        // المحتوى القابل للطي
        AnimatedSize(
          duration: animationDuration,
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            duration: animationDuration,
            opacity: isShowWidget ? 1.0 : 0.0,
            child: isShowWidget
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: customWidget,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildWithValue() {
    return Column(
      children: [
        Row(
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
                    if (_isInteractive) ...[
                      SizedBox(width: 8),
                      AnimatedRotation(
                        turns: isShowWidget ? 0.25 : 0,
                        duration: animationDuration,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF757575),
                          size: 20,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        // المحتوى القابل للطي
        AnimatedSize(
          duration: animationDuration,
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            duration: animationDuration,
            opacity: isShowWidget ? 1.0 : 0.0,
            child: isShowWidget
                ? Container(
                    width: double.infinity,
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
                  )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
