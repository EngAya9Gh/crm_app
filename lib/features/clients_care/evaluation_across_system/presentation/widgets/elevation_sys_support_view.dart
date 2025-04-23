import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/section_header.dart';
import 'package:crm_smart/core/common/widgets/section_with_action.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/add_ticket_page.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/data/models/elevation_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/manager/sys_support_rating_bloc.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/widgets/switch_communication_type.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/presentation/widgets/ticket_card.dart';
import 'package:crm_smart/features/finance/clients_attachments/presentation/manager/client_attachments_bloc.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ElevationSysSupportView extends StatefulWidget {
  ElevationSysSupportView({
    super.key,
    this.elevationModel,
  });

  final ElevationModel? elevationModel;

  @override
  State<StatefulWidget> createState() => _ElevationSysSupportViewState();
}

class _ElevationSysSupportViewState extends State<ElevationSysSupportView> {
  @override
  void initState() {
    context
        .read<SysSupportRatingBloc>()
        .add(GetSystemRatingTicketsEvent(params: GetOrAddSystemRatingTicktesParams(ratingId: widget.elevationModel!.id!)));
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ClientAttachmentsBloc>().add(GetAllClientEvent());
        Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // AddManualTaskButton(
                  //   list: invoicePublicTypeList,
                  //   invoiceId: invoiceModel.idInvoice!,
                  // ),

                  SectionWithAction(
                    title: 'Ticket',
                    onAddPressed: () async {
                      AppNavigator.go(
                        AddTicketPage(
                          ratingId: widget.elevationModel!.id!,
                        ),
                      );
                    },
                    child: SizedBox.shrink(), // سيتم إضافة قائمة المهام هنا
                  ),
                  SectionHeader(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      // Color_label: AppColors.grey.shade100,
                      textColor: AppColors.grey,
                      title: ' الرقم التسلسلي      ' + (widget.elevationModel?.serialNumber ?? 'لايوجد')),
                  SizedBox(
                    height: 10,
                  ),
                  CardRow(title: 'اسم العميل', value: widget.elevationModel?.nameEnterprise ?? 'لايوجد'),
                  CardRow(
                      title: 'نوع التقييم',
                      value:
                          ElevationSysSupportEnum.values.firstWhere((element) => element.index + 1 == (widget.elevationModel?.rateType ?? 1)).text),
                  CardRow(title: 'تاريخ التقييم', value: widget.elevationModel?.rateDate ?? 'لايوجد'),
                  CardRow(title: 'تاريخ الانشاء', value: widget.elevationModel?.createdAt ?? 'لايوجد'),
                  CardRow(title: 'تاريخ التعديل', value: widget.elevationModel?.updatedAt ?? 'لايوجد'),
                  CardRow(title: 'السؤال', value: widget.elevationModel?.question ?? 'لايوجد'),
                  CardRow(title: 'سبب التقييم', value: widget.elevationModel?.ratingReason ?? 'لايوجد'),
                  CardRow(title: 'ملاحظات العميل', value: widget.elevationModel?.message ?? 'لايوجد'),
                  10.height,
                  BlocBuilder<SysSupportRatingBloc, SysSupportRatingState>(
                    builder: (context, state) => state.ratingSystemTickets.when(
                      success: (data) => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) => TicketCardNew(
                          showEnterpriseName: true,
                          ticket: data![index],
                        ),
                      ),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                      ),
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
