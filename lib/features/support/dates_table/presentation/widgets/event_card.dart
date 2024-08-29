import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import 'date_actions_buttons.dart';
import 'reopen_event_button.dart';

class EventCard extends StatefulWidget {
  final List<EventModel> events;
  final int index;

  EventCard({
    required this.events,
    required this.index,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final event = widget.events[widget.index];
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
          color: IsDoneDateEnumExtension.color(isDone: event.isDone),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: InkWell(
            onTap: () {
              _navigateToProfileOnEventTap(event);
            },
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${event.title}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontFamily: AppFonts.fontFamily2)),
                      Text(
                        '${intl.DateFormat("hh:mm a").format(event.to)}'
                        ' - '
                        '${intl.DateFormat("hh:mm a").format(event.from)}',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontFamily: AppFonts.fontFamily2),
                      ),
                      if (event.nameCityClient != null) ...[
                        Text('${event.nameCityClient}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontFamily: AppFonts.fontFamily2)),
                      ],
                      _showTextIfNotNull(event.typeDate, 'النوع:'),
                      _showTextIfNotNull(
                          event.nameUser, 'موظف الدعم المسندة له الجدولة :'),
                      _showTextIfNotNull(event.nameUserAdd, 'اضاف الجدولة :'),
                      _showTextIfNotNull(
                          event.dateCreate, 'تاريخ إضاف الجدولة :'),
                      if (!_isOpen(event)) ...[
                        _showTextIfNotNull(
                            event.nameUserUpdate, 'اغلاق الجدولة :'),
                      ],
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
                Expanded(
                  flex: _isCanceledDate(event) ? 0 : 1,
                  child: _handleDateActions(event),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isOpen(EventModel event) {
    return event.isDone == IsDoneDateEnum.notVisited.value ||
        event.isDone == IsDoneDateEnum.scheduled.value;
  }

  Widget _handleDateActions(EventModel event) {
    if (_isCanceledDate(event)) {
      return const SizedBox.shrink();
    } else if (_isAllowedAndNotOpen(event)) {
      return ReopenEventButton(eventModel: event);
    } else if (_isOpen(event)) {
      return DateActionsButtons(eventModel: event);
    }
    return const SizedBox.shrink();
  }

  Widget _showTextIfNotNull(String? value, [String title = '']) {
    if (value == null) return SizedBox.shrink();
    if (title.isNotEmpty) title += ' ';
    return RichText(
      text: TextSpan(
        text: title,
        style: context.textTheme.bodyMedium,
        children: [
          TextSpan(
            text: value,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  bool _isCanceledDate(EventModel event) {
    return event.isDone == IsDoneDateEnum.canceled.value;
  }

  bool _isAllowedAndNotOpen(EventModel event) {
    return !_isOpen(event) &&
        context.read<PrivilegesCubit>().checkPrivilege('197');
  }

  void _navigateToProfileOnEventTap(EventModel event) {
    if (event.agentName != null) {
      AppNavigator.push(AgentProfilePage(
        agent: event.agent!,
        tabIndex: 3,
      ));
    } else {
      AppNavigator.push(ClientProfile(
        idClient: event.fkIdClient,
        event: event,
        tabIndex: 2,
      ));
    }
  }
}
