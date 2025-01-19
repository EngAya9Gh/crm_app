import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/data/module_invioce_model.dart';
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
import '../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../support/dates_table/presentation/pages/dates_table_page.dart';
import '../../domain/use_cases/cancel_date_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class ClientSupportCardDetails extends StatefulWidget {
  const ClientSupportCardDetails({
    super.key,
    this.invoiceModel,
    required this.datesInstallation,
    this.nextInstallation,
    required this.list_installation_type,
    this.selectInstallationType,
  });

  final InvoiceModel? invoiceModel;
  final List<DateInstallationClient> datesInstallation;
  final DateInstallationClient? nextInstallation;
  final List<String> list_installation_type;
  final String? selectInstallationType;

  @override
  State<ClientSupportCardDetails> createState() => _ClientSupportCardDetailsState();
}

class _ClientSupportCardDetailsState extends State<ClientSupportCardDetails> {
  @override
  void initState() {
    context.read<SupportTabCubit>().getInvoiceModules(CancelDateInstallParams(idInvoice: widget.invoiceModel!.idInvoice!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        InvoiceModel invoice =
            context.read<SupportTabCubit>().listInvoiceClientSupport.firstWhere((element) => element.idInvoice == widget.invoiceModel?.idInvoice);
        return Column(
          children: [
            if (invoice.dateinstall_done != null) ...[
              CardRow(title: ' تاريخ التركيب ', value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(invoice.dateinstall_done.toString()))),
              CardRow(title: ' تم التركيب من قبل ', value: (invoice.nameuserinstall.toString()))
            ],

            if (widget.nextInstallation?.dateClientVisit != null) ...[
              InkWell(
                onTap: () => AppNavigator.go(DatesTablePage()),
                child:
                    CardRow(title: 'تاريخ الزيارة القادمة', value: DateFormat('yyyy-MM-dd HH:mm').format(widget.nextInstallation!.dateClientVisit!)),
              ),
            ],
            InkWell(
              onTap: () => AppNavigator.go(DatesTablePage(), name: AppRoutesPaths.supportSubSections.datesTable),
              child: CardRow(
                  title: 'عدد الزيارات التي تمت ', value: widget.datesInstallation.where((element) => element.isDone == "1").length.toString()),
            ),
            InkWell(
              onTap: () => AppNavigator.go(DatesTablePage()),
              child: CardRow(
                  title: 'عدد الزيارات المتبقية',
                  value: widget.datesInstallation.where((element) => element.isDone == "0" || element.isDone == '3').length.toString()),
            ),
            InkWell(
              onTap: () => AppNavigator.go(DatesTablePage()),
              child:
                  CardRow(title: 'عدد الزيارات الملغية', value: widget.datesInstallation.where((element) => element.isDone == "2").length.toString()),
            ),
            InkWell(
              onTap: () => AppConstants.showAppDialog(
                  child: AppDialog(
                title: 'موديلات التركيب',
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8), border: Border.all(color: Colors.black)),
                    child: (state.invoiceModules.isEmpty())
                        ? AppText('لايوجد اقرارات لعرضها')
                        : Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: ((state.invoiceModules.data ?? []) as List<ModuleInvoiceModel>)
                                .map((e) => AppStatusChip(
                                      status: e.name ?? '',
                                      color: AppColors.primaryMain,
                                    ))
                                .toList(),
                          ),
                  ),
                ],
              )),
              child: CardRow(
                title: 'استعراض مديولات التركيب',
                icon: Icon(Icons.visibility),
                value: '',
              ),
            ),

            if (invoice.trainingPlan != null)
              InkWell(
                  onTap: () async {
                    await HelperFunctions.urlLauncher(
                      invoice.trainingPlan!.path,
                      isNewTab: true,
                    );
                  },
                  child: CardRow(
                    title: invoice.trainingPlan!.name,
                    icon: SizedBox.shrink(),
                  )),
            if (invoice.trainingSession != null)
              InkWell(
                child: CardRow(
                  title: invoice.trainingSession!.name,
                  icon: SizedBox.shrink()
                ),
                  onTap: () async {
                    await HelperFunctions.urlLauncher(
                      invoice.trainingSession!.path,
                      isNewTab: true,
                    );
                  },
              ),
            if (invoice.trainingMultiSession != null)
              InkWell(
                child: CardRow(
                  title: invoice.trainingMultiSession!.name,
                  icon: SizedBox.shrink(),
                ),
                  onTap: () async {
                    await HelperFunctions.urlLauncher(
                      invoice.trainingMultiSession!.path,
                      isNewTab: true,
                    );
                  },
              ),
            invoice.clientusername == null ? Container() : CardRow(title: 'يوزر العميل ', value: (invoice.clientusername.toString())),
            CardRow(title: 'حالة الفاتورة', value: invoice.stateclient.toString()),
            CardRow(title: 'عنوان الفاتورة ', value: (invoice.address_invoice.toString())),
            //////////////////////////////////////////////////////////////////////////////////////////
            invoice.daterepaly != null
                ? CardRow(title: ' تاريخ إعادة الجدولة', value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(invoice.daterepaly.toString())))
                : Container(),
            invoice.daterepaly != null ? CardRow(title: ' قام بإعادة الجدولة', value: invoice.nameuserreplay.toString()) : Container(),
            invoice.daterepaly != null
                ? CardRow(
                    title: ' سبب إعادة الجدولة',
                    value: invoice.reason_date.toString(),
                    isExpanded: true,
                  )
                : Container(),
            ///////////////////////////////////////////////
            invoice.dateinstall_task != null
                ? CardRow(
                    title: ' تاريخ جدولة التركيب ', value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(invoice.dateinstall_task.toString()))
                    // DateFormat.yMMMd().
                    // format(DateTime.parse(_invoice.dateinstall_task.toString()))
                    )
                : Container(),
            invoice.dateinstall_task != null ? CardRow(title: ' قام بجدولة التركيب ', value: invoice.nameusertask.toString()) : Container(),

            CardRow(
                title: 'طريقة التركيب ',
                value: invoice.typeInstallation.toString() == '0'
                    ? 'ميداني'
                    : (invoice.typeInstallation.toString() == '2' ? 'عميل موصى به' : 'اونلاين')),

            invoice.ready_install == '0' && invoice.TypeReadyClient == 'suspend'
                ? CardRow(title: 'هل تم التركيب للعميل ', value: 'معلق')
                : invoice.ready_install == '0' && invoice.TypeReadyClient == 'notReady'
                    ? CardRow(title: 'هل تم التركيب للعميل ', value: 'غير جاهز')
                    : CardRow(
                        title: 'هل تم التركيب للعميل ',
                        value: context
                                    .read<SupportTabCubit>()
                                    .listInvoiceClientSupport
                                    .firstWhereOrNull((element) => element.idInvoice == invoice?.idInvoice)
                                    ?.dateinstall_done ==
                                null
                            ? 'بالانتظار'
                            : 'تم التركيب'),

            invoice.ready_install == '0' && invoice.dateinstall_done == null
                ? CardRow(title: 'ملاحظة التعليق', value: invoice.notes_ready.toString())
                : Container(),

            invoice.ready_install == '0' && invoice.TypeReadyClient == 'notReady'
                ? CardRow(title: 'سبب تعليق العميل', value: invoice.reason_notReady.toString())
                : Container(),
            invoice.ready_install == '0' && invoice.TypeReadyClient == 'suspend'
                ? CardRow(title: 'سبب تعليق العميل', value: invoice.reason_suspend.toString())
                : Container(),

            invoice.date_readyinstall != null
                ? CardRow(
                    title: ' تاريخ الغاء تعليق العميل ',
                    value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(invoice.date_readyinstall.toString())))
                : Container(),
            invoice.date_readyinstall != null
                ? CardRow(title: ' قام بالغاء تعليق العميل ', value: invoice.nameuser_ready_install.toString())
                : Container(),
            invoice.date_not_readyinstall != null
                ? CardRow(
                    title: ' تاريخ تعليق العميل ',
                    value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(invoice.date_not_readyinstall.toString())))
                : Container(),
            invoice.date_not_readyinstall != null
                ? CardRow(title: ' قام بتعليق العميل ', value: invoice.nameuser_notready_install.toString())
                : Container(),
          ],
        );
      },
    );
  }
}
