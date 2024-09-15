import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/ui/widgets/custom_widget/app_card_row.dart';
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
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(child: Divider(thickness: 2)),
              // ticket details
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.kWhiteColor,
                  ),
                  child: Column(
                    children: [
                      AppCardRow(
                        title: 'العميل',
                        value: widget.ticketModel.nameEnterprise ?? '',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                      AppCardRow(
                        title: 'نوع التذكرة',
                        value: widget.ticketModel.typeProblem ?? '',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                      AppCardRow(
                        title: 'مصدر التذكرة',
                        value: widget.ticketModel.ticketSource ?? '',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      10.height,
                      AppCardRow(
                        title: 'تفاصيل التذكرة',
                        value: widget.ticketModel.detailsProblem ?? '',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  return SizedBox(height: 10);
                },
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    SizedBox(height: 10),
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
