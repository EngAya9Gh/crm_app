import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/data/module_invioce_model.dart';
import 'package:crm_smart/features/common/widgets/build_detail_row.dart';
import 'package:crm_smart/features/common/widgets/build_detail_row_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../core/config/navigator/app_routes_paths.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../support/dates_table/presentation/pages/dates_table_page.dart';
import '../../domain/use_cases/cancel_date_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

// class BuildDetailRow extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData? icon;
//   final bool isExpanded;
//   final VoidCallback? onTap;

//   const BuildDetailRow({
//     Key? key,
//     required this.title,
//     required this.value,
//     this.icon,
//     this.isExpanded = false,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         child: Row(
//           children: [
//             if (icon != null) ...[
//               Icon(icon, size: 18, color: Colors.grey),
//               const SizedBox(width: 8),
//             ],
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(width: 8),
//             if (isExpanded)
//               Expanded(
//                 child: Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               )
//             else
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ClientSupportCardDetails extends StatefulWidget {
  final InvoiceModel? invoiceModel;
  final List<DateInstallationClient> datesInstallation;
  final List<String> list_installation_type;
  final DateInstallationClient? nextInstallation;
  final String? selectInstallationType;
  final bool isSmartView;

  const ClientSupportCardDetails({
    Key? key,
    required this.invoiceModel,
    required this.datesInstallation,
    required this.list_installation_type,
    required this.nextInstallation,
    required this.selectInstallationType,
    required this.isSmartView,
  }) : super(key: key);

  @override
  State<ClientSupportCardDetails> createState() =>
      _ClientSupportCardDetailsState();
}

class _ClientSupportCardDetailsState extends State<ClientSupportCardDetails> {
  @override
  void initState() {
    context.read<SupportTabCubit>().getInvoiceModules(
        CancelDateInstallParams(idInvoice: widget.invoiceModel!.idInvoice!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        InvoiceModel invoice = context
            .read<SupportTabCubit>()
            .listInvoiceClientSupport
            .firstWhere((element) =>
                element.idInvoice == widget.invoiceModel?.idInvoice);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Installation Details Section
            if (invoice.dateinstall_done != null) ...[
              _buildDetailSection(
                title: 'معلومات التركيب',
                children: [
                  _buildDetailRowWidget(
                    title: 'تاريخ التركيب',
                    value: DateFormat('yyyy-MM-dd HH:mm').format(
                        DateTime.parse(invoice.dateinstall_done.toString())),
                    icon: Icons.calendar_today,
                  ),
                  _buildDetailRowWidget(
                    title: 'تم التركيب من قبل',
                    value: invoice.nameuserinstall.toString(),
                    icon: Icons.person,
                  ),
                ],
              ),
              16.height,
            ],

            // Visits Section
            _buildDetailSection(
              title: 'الزيارات',
              children: [
                if (widget.nextInstallation?.dateClientVisit != null)
                  _buildDetailRowWidget(
                    title: 'تاريخ الزيارة القادمة',
                    value: DateFormat('yyyy-MM-dd HH:mm')
                        .format(widget.nextInstallation!.dateClientVisit!),
                    // icon: Icons.event_upcoming,
                    onTap: () => AppNavigator.go(DatesTablePage()),
                  ),
                _buildDetailRowWidget(
                  title: 'عدد الزيارات التي تمت',
                  value: widget.datesInstallation
                      .where((element) => element.isDone == "1")
                      .length
                      .toString(),
                  icon: Icons.check_circle_outline,
                  onTap: () => AppNavigator.go(DatesTablePage(),
                      name: AppRoutesPaths.supportSubSections.datesTable),
                ),
                _buildDetailRowWidget(
                  title: 'عدد الزيارات المتبقية',
                  value: widget.datesInstallation
                      .where((element) =>
                          element.isDone == "0" || element.isDone == '3')
                      .length
                      .toString(),
                  icon: Icons.pending_actions,
                  onTap: () => AppNavigator.go(DatesTablePage()),
                ),
                _buildDetailRowWidget(
                  title: 'عدد الزيارات الملغية',
                  value: widget.datesInstallation
                      .where((element) => element.isDone == "2")
                      .length
                      .toString(),
                  icon: Icons.cancel_outlined,
              onTap: () => AppNavigator.go(DatesTablePage()),
                ),
              ],
            ),
            16.height,

            // Installation Modules Section
            _buildDetailSection(
              title: 'موديلات التركيب',
              children: [
            InkWell(
              onTap: () => AppConstants.showAppDialog(
                  child: AppDialog(
                title: 'موديلات التركيب',
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                    child: (state.invoiceModules.isEmpty())
                        ? AppText('لايوجد اقرارات لعرضها')
                        : Wrap(
                            spacing: 5,
                            runSpacing: 5,
                                  children: ((state.invoiceModules.data ?? []))
                                .map((e) => AppStatusChip(
                                            status: (e as Map<String, dynamic>)[
                                                    'name'] ??
                                                '',
                                      color: AppColors.primaryMain,
                                    ))
                                .toList(),
                          ),
                  ),
                ],
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.view_module, color: AppColors.primaryMain),
                        12.width,
                        AppText(
                          'استعراض مديولات التركيب',
                          style: TextStyle(
                            color: AppColors.primaryMain,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: AppColors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            16.height,

            // Training Documents Section
            if (invoice.trainingPlan != null ||
                invoice.trainingSession != null ||
                invoice.trainingMultiSession != null) ...[
              _buildDetailSection(
                title: 'وثائق التدريب',
                children: [
            if (invoice.trainingPlan != null)
                    _buildDocumentRow(
                      title: invoice.trainingPlan!.name,
                      onTap: () => HelperFunctions.urlLauncher(
                      invoice.trainingPlan!.path,
                          isNewTab: true),
                    ),
            if (invoice.trainingSession != null)
                    _buildDocumentRow(
                  title: invoice.trainingSession!.name,
                      onTap: () => HelperFunctions.urlLauncher(
                      invoice.trainingSession!.path,
                          isNewTab: true),
              ),
            if (invoice.trainingMultiSession != null)
                    _buildDocumentRow(
                  title: invoice.trainingMultiSession!.name,
                      onTap: () => HelperFunctions.urlLauncher(
                          invoice.trainingMultiSession!.path,
                          isNewTab: true),
                    ),
                ],
              ),
              16.height,
            ],

            // Invoice Information Section
            _buildDetailSection(
              title: 'معلومات الفاتورة',
              children: [
                if (invoice.clientusername != null)
                  _buildDetailRowWidget(
                    title: 'يوزر العميل',
                    value: invoice.clientusername.toString(),
                    icon: Icons.person_outline,
                  ),
                _buildDetailRowWidget(
                  title: 'حالة الفاتورة',
                  value: invoice.stateclient.toString(),
                  icon: Icons.info_outline,
                ),
                _buildDetailRowWidget(
                  title: 'عنوان الفاتورة',
                  value: invoice.address_invoice.toString(),
                  icon: Icons.location_on_outlined,
                ),
              ],
            ),
            16.height,

            // Rescheduling Section
            if (invoice.daterepaly != null) ...[
              _buildDetailSection(
                title: 'معلومات إعادة الجدولة',
                children: [
                  _buildDetailRowWidget(
                    title: 'تاريخ إعادة الجدولة',
                    value: DateFormat('yyyy-MM-dd HH:mm')
                        .format(DateTime.parse(invoice.daterepaly.toString())),
                    icon: Icons.event_repeat,
                  ),
                  _buildDetailRowWidget(
                    title: 'قام بإعادة الجدولة',
                    value: invoice.nameuserreplay.toString(),
                    icon: Icons.person_outline,
                  ),
                  _buildDetailRowWidget(
                    title: 'سبب إعادة الجدولة',
                    value: invoice.reason_date.toString(),
                    icon: Icons.note_outlined,
                    isExpanded: true,
                  ),
                ],
              ),
              16.height,
            ],

            // Installation Schedule Section
            if (invoice.dateinstall_task != null) ...[
              _buildDetailSection(
                title: 'جدولة التركيب',
                children: [
                  _buildDetailRowWidget(
                    title: 'تاريخ جدولة التركيب',
                    value: DateFormat('yyyy-MM-dd HH:mm').format(
                        DateTime.parse(invoice.dateinstall_task.toString())),
                    icon: Icons.event,
                  ),
                  _buildDetailRowWidget(
                    title: 'قام بجدولة التركيب',
                    value: invoice.nameusertask.toString(),
                    icon: Icons.person_outline,
                  ),
                ],
              ),
              16.height,
            ],

            // Installation Status Section
            _buildDetailSection(
              title: 'حالة التركيب',
              children: [
                _buildDetailRowWidget(
                  title: 'طريقة التركيب',
                value: invoice.typeInstallation.toString() == '0'
                    ? 'ميداني'
                      : (invoice.typeInstallation.toString() == '2'
                          ? 'عميل موصى به'
                          : 'اونلاين'),
                  icon: Icons.settings_outlined,
                ),
                _buildDetailRowWidget(
                  title: 'حالة التركيب',
                  value: _getInstallationStatus(invoice, context),
                  icon: Icons.info_outline,
                ),
              ],
            ),

            // Suspension Details Section
            if (invoice.ready_install == '0' &&
                (invoice.TypeReadyClient == 'suspend' ||
                    invoice.TypeReadyClient == 'notReady')) ...[
              16.height,
              _buildDetailSection(
                title: 'تفاصيل التعليق',
                children: [
                  if (invoice.notes_ready != null)
                    _buildDetailRowWidget(
                      title: 'ملاحظة التعليق',
                      value: invoice.notes_ready.toString(),
                      icon: Icons.note_outlined,
                    ),
                  if (invoice.TypeReadyClient == 'notReady' &&
                      invoice.reason_notReady != null)
                    _buildDetailRowWidget(
                      title: 'سبب تعليق العميل',
                      value: invoice.reason_notReady.toString(),
                      icon: Icons.warning_outlined,
                    ),
                  if (invoice.TypeReadyClient == 'suspend' &&
                      invoice.reason_suspend != null)
                    _buildDetailRowWidget(
                      title: 'سبب تعليق العميل',
                      value: invoice.reason_suspend.toString(),
                      icon: Icons.warning_outlined,
                    ),
                ],
              ),
            ],

            // Suspension Status Changes Section
            if (invoice.date_readyinstall != null ||
                invoice.date_not_readyinstall != null) ...[
              16.height,
              _buildDetailSection(
                title: 'تغييرات حالة التعليق',
                children: [
                  if (invoice.date_readyinstall != null) ...[
                    _buildDetailRowWidget(
                      title: 'تاريخ الغاء تعليق العميل',
                      value: DateFormat('yyyy-MM-dd HH:mm').format(
                          DateTime.parse(invoice.date_readyinstall.toString())),
                      icon: Icons.event_available,
                    ),
                    _buildDetailRowWidget(
                      title: 'قام بالغاء تعليق العميل',
                      value: invoice.nameuser_ready_install.toString(),
                      icon: Icons.person_outline,
                    ),
                  ],
                  if (invoice.date_not_readyinstall != null) ...[
                    _buildDetailRowWidget(
                      title: 'تاريخ تعليق العميل',
                      value: DateFormat('yyyy-MM-dd HH:mm').format(
                          DateTime.parse(
                              invoice.date_not_readyinstall.toString())),
                      icon: Icons.event_busy,
                    ),
                    _buildDetailRowWidget(
                      title: 'قام بتعليق العميل',
                      value: invoice.nameuser_notready_install.toString(),
                      icon: Icons.person_outline,
                    ),
                  ],
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  String _getInstallationStatus(InvoiceModel invoice, BuildContext context) {
    if (invoice.ready_install == '0' && invoice.TypeReadyClient == 'suspend') {
      return 'معلق';
    } else if (invoice.ready_install == '0' &&
        invoice.TypeReadyClient == 'notReady') {
      return 'غير جاهز';
    } else {
      return context
                  .read<SupportTabCubit>()
                  .listInvoiceClientSupport
                  .firstWhereOrNull(
                      (element) => element.idInvoice == invoice.idInvoice)
                  ?.dateinstall_done ==
              null
          ? 'بالانتظار'
          : 'تم التركيب';
    }
  }

  Widget _buildDetailSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          style: TextStyle(
            fontSize: 15.scaleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryMain,
          ),
        ),
        8.height,
        ...children,
      ],
    );
  }

  Widget _buildDocumentRow({
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.description_outlined, color: AppColors.primaryMain),
              12.width,
              Expanded(
                child: AppText(
                  title,
                  style: TextStyle(
                    color: AppColors.primaryMain,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.open_in_new, size: 16, color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRowWidget({
    required String title,
    required String value,
    IconData? icon,
    VoidCallback? onTap,
    bool isExpanded = false,
  }) {
    return widget.isSmartView
        ? BuildDetailRow2(
            title: title,
            value: value,
            icon: icon,
            onTap: onTap,
          )
        : BuildDetailRow(
            title: title,
            value: value,
            icon: icon,
            onTap: onTap,
            isExpanded: isExpanded,
    );
  }
}
