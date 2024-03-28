import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../ui/widgets/custom_widget/card_row_divided.dart';
import '../../data/models/ticket_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/ticket_details_buttons.dart';
import '../widgets/ticket_status_card.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({
    this.type,
    Key? key,
    required this.ticketModel,
  }) : super(key: key);
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
    ticketsCubit.selectedCategoriesList = [];
    ticketsCubit.selectedSubCategoriesList = [];
    ticketsCubit.filteredSubCategoriesByCategories = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${currentTicketType.nameAr} #${widget.ticketModel.idTicket}",
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: widget.type == null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TicketDetailsButtons(
                          ticketModel: widget.ticketModel,
                        ))
                    : SizedBox.shrink(),
              ),
              // ticket main details
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kWhiteColor,
                    ),
                    child: Column(
                      children: [
                        CardRowDivided(
                          title: 'نوع التذكرة',
                          value: widget.ticketModel.typeProblem ?? '',
                        ),
                        SizedBox(height: 10),
                        CardRowDivided(
                          title: 'مصدر التذكرة',
                          value: widget.ticketModel.ticketSource ?? '',
                        ),
                        SizedBox(height: 10),
                        CardRowDivided(
                          title: 'تفاصيل التذكرة',
                          value: widget.ticketModel.detailsProblem ?? '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Divider(thickness: 2)),
              // ticket status
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
