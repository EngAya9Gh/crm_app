import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/data/models/client_date_model.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../../features/support/dates_table/presentation/widgets/reopen_event_button.dart';
import '../../../../../../features/support/dates_table/presentation/widgets/event_card/date_actions_buttons.dart';
import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart';

class DateCard extends StatelessWidget {
  final EventModel event;
  final bool showEnterpriseName;
  final bool showButtons;
  const DateCard(
      {Key? key,
      required this.event,
      this.showEnterpriseName = true,
      this.showButtons = true})
      : super(key: key);

  factory DateCard.fromClientDate(
    ClientDateModel clientDate, {
    bool showButtons = true,
    bool showEnterpriseName = true,
  }) {
    return DateCard(
      event: EventModel(
        description: clientDate.processReason ?? '',
        isDone: clientDate.isDone == true ? "1" : "0",
        title: clientDate.nameEnterprise ?? '',
        from: clientDate.dateClientVisit ?? DateTime.now(),
        to: clientDate.dateEnd ?? DateTime.now(),
        nameUser: clientDate.nameUser,
        nameCityClient: clientDate.nameCity,
        processReason: clientDate.processReason,
        nameUserAdd: clientDate.nameUserAdd,
        dateCreate: clientDate.dateCreate?.toString(),
        nameUserUpdate: clientDate.nameUserUpdate,
        nameUserClose: clientDate.nameUserClose,
        isDoneInstall: clientDate.isDoneInstall == true ? "1" : "0",
        typeDate: clientDate.typeDate ?? '',
      ),
      showButtons: showButtons,
      showEnterpriseName: showEnterpriseName,
    );
  }

  bool _isOpen(EventModel event) {
    return event.isDone == IsDoneDateEnum.notVisited.value ||
        event.isDone == IsDoneDateEnum.scheduled.value ||
        event.isDone == IsDoneDateEnum.started.value;
  }

  bool _isCanceledDate(EventModel event) {
    return event.isDone == IsDoneDateEnum.canceled.value;
  }

  bool _isAllowedAndNotOpen(BuildContext context, EventModel event) {
    return !_isOpen(event) &&
        context.read<PrivilegesCubit>().checkPrivilege('197');
  }

  Widget _handleDateActions(BuildContext context, EventModel event) {
    if (_isCanceledDate(event)) {
      return const SizedBox.shrink();
    } else if (_isAllowedAndNotOpen(context, event)) {
      return ReopenEventButton(eventModel: event);
    } else if (_isOpen(event)) {
      return DateActionsButtons(eventModel: event);
    }
    return const SizedBox.shrink();
  }

  Widget _showTextIfNotNull(String? value, String title) {
    if (value == null) return SizedBox.shrink();
    return RichText(
      text: TextSpan(
        text: '$title ',
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

  Color _getStatusColor(String? isDone) {
    return IsDoneDateEnumExtension.color(isDone: isDone ?? "0", opacity: 1);
  }

  Color _getStatusBackgroundColor(String? isDone) {
    return IsDoneDateEnumExtension.color(isDone: isDone ?? "0", opacity: 0.1);
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  String _formatFullDateTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('yyyy/MM/dd - hh:mm a').format(dateTime);
    } catch (e) {
      return dateTimeStr;
    }
  }

  String _getStatusText(String? isDone) {
    switch (isDone) {
      case "1":
        return IsDoneDateEnum.done.name;
      case "2":
        return IsDoneDateEnum.canceled.name;
      case "3":
        return IsDoneDateEnum.scheduled.name;
      case "4":
        return IsDoneDateEnum.started.name;
      default:
        return IsDoneDateEnum.notVisited.name;
    }
  }

  IconData _getStatusIcon(String? isDone) {
    switch (isDone) {
      case "1":
        return Icons.check_circle;
      case "2":
        return Icons.cancel;
      case "3":
        return Icons.event;
      case "4":
        return Icons.play_circle;
      default:
        return Icons.schedule;
    }
  }

  void _onCardTap(BuildContext context) {
    _navigateToProfileOnEventTap(event);
  }

  void _navigateToProfileOnEventTap(EventModel event) {
    if (event.agentName != null) {
      AppNavigator.go(
        AgentProfilePage(
          idAgent: event.agent!.idAgent,
          tabIndex: 3,
          agent: event.agent!,
        ),
        pathParameters: {'idAgent': event.agent!.idAgent},
        extra: {
          'tabIndex': 3,
          'agent': event.agent,
        },
        name: AppRoutesNames.agentProfile.inDatesTable,
      );
    } else {
      AppNavigator.go(
        ClientProfile(
          idClient: event.fkIdClient,
          event: event,
          tabIndex: 2,
        ),
        pathParameters: {'idClient': event.fkIdClient.toString()},
        extra: {
          'tabIndex': 2,
          'event': event,
        },
        name: AppRoutesNames.clientProfile.inDatesTable,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCardTap(context),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: _getStatusColor(event.isDone).withOpacity(0.5),
            width: 1,
          ),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getStatusIcon(event.isDone),
                              color: _getStatusColor(event.isDone),
                            ),
                            8.width,
                            Expanded(
                              child: showEnterpriseName
                                  ? AppText(
                                      event.title ?? '',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.fontFamily1,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getStatusBackgroundColor(event.isDone),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: AppText(
                                _getStatusText(event.isDone),
                                fontSize: 12,
                                color: _getStatusColor(event.isDone),
                                fontFamily: AppFonts.fontFamily1,
                              ),
                            ),
                          ],
                        ),
                        if (event.typeDate != null) ...[
                          8.height,
                          AppText(
                            event.typeDate!,
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: AppFonts.fontFamily1,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (event.isDoneInstall == "1") ...[
                    8.width,
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                  ],
                  //16.width,
                  //////
                  if (showButtons) ...[
                    Expanded(
                      flex: _isCanceledDate(event) ? 0 : 1,
                      child: _handleDateActions(context, event),
                    ),
                  ]
                ],
              ),
              12.height,
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  4.width,
                  Expanded(
                    child: AppText(
                      '${_formatDateTime(event.from)} - ${_formatDateTime(event.to)}',
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                  ),
                ],
              ),
              if (event.nameUser != null || event.nameCityClient != null) ...[
                8.height,
                Row(
                  children: [
                    if (event.nameUser != null) ...[
                      AppText(
                        event.nameUser!,
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ],
                    if (event.nameCityClient != null) ...[
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      4.width,
                      AppText(
                        event.nameCityClient!,
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ],
                  ],
                ),
              ],
              if (event.processReason != null &&
                  event.processReason!.isNotEmpty) ...[
                8.height,
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        event.processReason!,
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ),
              ],
              if (event.nameUserAdd != null) ...[
                8.height,
                Row(
                  children: [
                    Icon(Icons.person_add, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        event.nameUserAdd!,
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ),
              ],
              if (event.dateCreate != null) ...[
                4.height,
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        _formatFullDateTime(event.dateCreate!),
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ),
              ],
              if (!_isOpen(event) && event.nameUserUpdate != null) ...[
                8.height,
                Row(
                  children: [
                    Icon(Icons.lock_outline, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        event.nameUserUpdate!,
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ),
              ],
              if (event.nameUserClose != null) ...[
                8.height,
                Row(
                  children: [
                    Icon(Icons.edit_note, size: 16, color: Colors.grey),
                    4.width,
                    Expanded(
                      child: AppText(
                        event.nameUserClose!,
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: AppFonts.fontFamily1,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
