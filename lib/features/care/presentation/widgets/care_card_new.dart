import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:intl/intl.dart' hide TextDirection;

class CareCardNew extends StatelessWidget {
  final String? title;
  final String? description;
  final String? type;
  final String? status;
  final DateTime? date;
  final String? userName;
  final String? userRole;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final bool isExpanded;
  final Widget? actionButtons;
  final bool showActions;
  final String? rate;
  final String? rateProduct;
  final String? rateSupport;

  const CareCardNew({
    Key? key,
    this.title,
    this.description,
    this.type,
    this.status,
    this.date,
    this.userName,
    this.userRole,
    this.onEdit,
    this.onDelete,
    this.onTap,
    this.isExpanded = false,
    this.actionButtons,
    this.showActions = true,
    this.rate,
    this.rateProduct,
    this.rateSupport,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status?.toLowerCase()) {
      case 'done':
      case 'completed':
        return Colors.green;
      case 'pending':
      case 'in progress':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: _getStatusColor().withOpacity(0.3),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: _getStatusColor(),
                        ),
                        4.width,
                        AppText(
                          status ?? '',
                          fontSize: 12,
                          color: _getStatusColor(),
                          fontFamily: AppFonts.fontFamily1,
                        ),
                      ],
                    ),
                  ),
                  8.width,
                  if (type != null) ...[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        type!,
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                  Spacer(),
                  if (showActions && (onEdit != null || onDelete != null)) ...[
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, color: Colors.grey),
                      itemBuilder: (context) => [
                        if (onEdit != null)
                          PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20),
                                8.width,
                                Text('تعديل'),
                              ],
                            ),
                          ),
                        if (onDelete != null)
                          PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, size: 20, color: Colors.red),
                                8.width,
                                Text('حذف',
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                      ],
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit?.call();
                        } else if (value == 'delete') {
                          onDelete?.call();
                        }
                      },
                    ),
                  ],
                ],
              ),
              12.height,
              // Title and Description
              if (title != null) ...[
                AppText(
                  title!,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.fontFamily1,
                ),
                8.height,
              ],
              if (description != null) ...[
                AppText(
                  description!,
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontFamily: AppFonts.fontFamily1,
                ),
                8.height,
              ],

              // Ratings Section
              if (type == 'دوري' || type == 'تركيب') ...[
                if (rate != null) ...[
                  AppRateWidget( 
                    title: 'تقييم عام',
                    isReadOnly: true,
                    initialRating: double.tryParse(rate!) ?? 0,
                    rateValue: double.tryParse(rate!) ?? 0,
                  ),
                  8.height,
                ],
                if (type == 'دوري') ...[
                  if (rateProduct != null) ...[
                    AppRateWidget( 
                      title: 'تقييم المنتج',
                      isReadOnly: true,
                      initialRating: double.tryParse(rateProduct!) ?? 0,
                      rateValue: double.tryParse(rateProduct!) ?? 0,
                    ),
                    8.height,
                  ],
                  if (rateSupport != null) ...[
                    AppRateWidget( 
                      title: 'تقييم الدعم الفني (الشات)',

                      isReadOnly: true,
                      initialRating: double.tryParse(rateSupport!) ?? 0,
                      rateValue: double.tryParse(rateSupport!) ?? 0,
                    ),
                    8.height,
                  ],
                ],
              ],

              // Date and User Info
              Row(
                children: [
                  if (date != null) ...[
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    4.width,
                    AppText(
                      DateFormat('yyyy/MM/dd - hh:mm a').format(date!),
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                  ],
                  if (date != null && (userName != null || userRole != null))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 1,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  if (userName != null || userRole != null) ...[
                    Icon(Icons.person_outline, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        [userName, userRole]
                            .where((e) => e != null)
                            .join(' - '),
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ],
              ),

              // Action Buttons
              if (actionButtons != null && showActions) ...[
                8.height,
                actionButtons!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
