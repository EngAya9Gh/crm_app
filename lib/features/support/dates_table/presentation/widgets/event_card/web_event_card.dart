import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../reopen_event_button.dart';
import 'web_date_actions_buttons.dart';

class WebEventCard extends StatefulWidget {
  final EventModel event;

  WebEventCard({
    required this.event,
  });

  @override
  State<WebEventCard> createState() => _WebEventCardState();
}

class _WebEventCardState extends State<WebEventCard> {
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
          color: IsDoneDateEnumExtension.color(isDone: event.isDone),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: InkWell(
            onTap: () {
              _navigateToProfileOnEventTap(event);
            },
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (event.isDoneInstall == '1') ...[
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            10.height,
                          ],
                          AppText(
                            '${event.title}',
                            fontFamily: AppFonts.fontFamily1,
                          ),
                          10.height,
                          AppText(
                            '${intl.DateFormat("hh:mm a").format(event.to)}'
                            ' - '
                            '${intl.DateFormat("hh:mm a").format(event.from)}',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.end,
                            fontFamily: AppFonts.fontFamily1,
                          ),
                          if (event.nameCityClient != null) ...[
                            10.height,
                            AppText(
                              '${event.nameCityClient}',
                              fontFamily: AppFonts.fontFamily1,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _showTextIfNotNull(event.typeDate, 'النوع:'),
                          _showTextIfNotNull(event.nameUser, 'موظف الدعم :'),
                          _showTextIfNotNull(
                              event.nameUserAdd, 'اضاف الجدولة :'),
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
                  ),

                  // Expanded(
                  //   child: SizedBox(
                  //     child:
                  //         LayoutBuilder(builder: (context, innerConstraints) {
                  //       return Column(
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               AppText(
                  //                 '${event.title}',
                  //                 fontFamily: AppFonts.fontFamily1,
                  //               ),
                  //               AppText(
                  //                 '${intl.DateFormat("hh:mm a").format(event.to)}'
                  //                 ' - '
                  //                 '${intl.DateFormat("hh:mm a").format(event.from)}',
                  //                 textDirection: TextDirection.ltr,
                  //                 textAlign: TextAlign.end,
                  //                 fontFamily: AppFonts.fontFamily1,
                  //               ),
                  //               if (event.nameCityClient != null) ...[
                  //                 AppText(
                  //                   '${event.nameCityClient}',
                  //                   fontFamily: AppFonts.fontFamily1,
                  //                 ),
                  //               ],
                  //               if (event.isDoneInstall == '1') ...[
                  //                 const SizedBox(width: 16),
                  //                 Icon(
                  //                   Icons.check_circle,
                  //                   color: Colors.green,
                  //                 ),
                  //               ],
                  //             ],
                  //           ),
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Container(
                  //                 color: Colors.red,
                  //                 width: innerConstraints.maxWidth * 0.45,
                  //                 child: _showTextIfNotNull(
                  //                     event.typeDate, 'النوع:'),
                  //               ),
                  //               _showTextIfNotNull(
                  //                   event.nameUser, 'موظف الدعم :'),
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               SizedBox(
                  //                 width: innerConstraints.maxWidth * 0.45,
                  //                 child: _showTextIfNotNull(
                  //                     event.nameUserAdd, 'اضاف الجدولة :'),
                  //               ),
                  //               _showTextIfNotNull(
                  //                   event.dateCreate, 'تاريخ إضاف الجدولة :'),
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               if (!_isOpen(event)) ...[
                  //                 SizedBox(
                  //                   width: innerConstraints.maxWidth * 0.45,
                  //                   child: _showTextIfNotNull(
                  //                       event.nameUserUpdate,
                  //                       'اغلاق الجدولة :'),
                  //                 ),
                  //               ],
                  //               _showTextIfNotNull(event.nameUserClose,
                  //                   'آخر من قام بالتعديل :'),
                  //             ],
                  //           ),
                  //         ],
                  //       );
                  //     }),
                  //   ),
                  // ),
                  10.width,
                  SizedBox(
                    width: constraints.maxWidth * 0.2,
                    child: _handleDateActions(event),
                  ),
                ],
              );
            }),
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
      return WebDateActionsButtons(eventModel: event);
    }
    return const SizedBox.shrink();
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

  bool _isCanceledDate(EventModel event) {
    return event.isDone == IsDoneDateEnum.canceled.value;
  }

  bool _isAllowedAndNotOpen(EventModel event) {
    return !_isOpen(event) &&
        context.read<PrivilegesCubit>().checkPrivilege('197');
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
}
