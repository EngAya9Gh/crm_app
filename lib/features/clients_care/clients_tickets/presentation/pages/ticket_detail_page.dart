import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/app_card_row.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../data/models/ticket_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/ticket_details_buttons.dart';
import '../widgets/ticket_status_card.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({
    super.key,
    this.type,
    required this.ticketModel,
  });

  final String? type;
  final TicketModel ticketModel;

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  late final TicketsCubit ticketsCubit;

  @override
  void initState() {
    ticketsCubit = context.read<TicketsCubit>();
    ticketsCubit.pageVariables.selectedCategoriesList = [];
    ticketsCubit.pageVariables.selectedSubCategoriesList = [];
    ticketsCubit.pageVariables.filteredSubCategoriesByCategories = [];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ticketsCubit
          .getCategories()
          .then((value) => ticketsCubit.getSubCategories());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTicketType =
        TicketTypeExtension.getTicketType(widget.ticketModel.typeTicket);
    return AppScaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        title: "${currentTicketType.nameAr} #${widget.ticketModel.idTicket}",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              // ticket details buttons
              SliverToBoxAdapter(
                child: widget.type == null
                    ? TicketDetailsButtons(ticketModel: widget.ticketModel)
                    : SizedBox.shrink(),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 5)),
              SliverToBoxAdapter(child: Divider(thickness: 1)),
              // ticket details
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      CardRow(
                        title: 'العميل',
                        value: widget.ticketModel.nameEnterprise ?? '',
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                      CardRow(
                        title: 'نوع التذكرة',
                        value: widget.ticketModel.typeProblem ?? '',
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                      CardRow(
                        title: 'مصدر التذكرة',
                        value: widget.ticketModel.ticketSource ?? '',
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),

                      10.height,
                      if(widget.ticketModel.system_rating !=null)
                        CardRow(
                        title: 'السؤال',
                        value: widget.ticketModel.notesTicket ?? '',
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                   if(widget.ticketModel.system_rating !=null)
                    AppRateWidget(
                  title:'تقييم عبر النظام',
                  initialRating: double.parse(widget.ticketModel.system_rating.toString() ?? '0'),
                  rateValue: double.parse(widget.ticketModel.system_rating.toString() ?? '0'),
                  isReadOnly: true,
                ),
                    
                      10.height,
                      CardRow(
                        title: 'تفاصيل التذكرة',
                        value: widget.ticketModel.detailsProblem ?? '',
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Divider(thickness: 2)),
              // ticket status details
              SliverList.separated(
                itemCount: widget.ticketModel.status?.length ?? 0,
                itemBuilder: (context, index) {
                  return TicketStatusCard(
                    ticketModel: widget.ticketModel,
                    statusModel: widget.ticketModel.status![index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
