import 'package:crm_smart/core/common/enums/ticket_types_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../data/models/ticket_model.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/ticket_details_buttons.dart';

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
              SliverList.separated(
                // todo: add the status list
                // todo: wait for the backend to remove nested lists
                // todo: go throw objects in the status list and display them
                itemCount: widget.ticketModel.status?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),

              //
              //   if (widget.ticketModel.dateClose != null) ...[
              //     cardRowDivided(
              //         title: 'قام بإغلاق التذكرة ',
              //         value: getnameshort(
              //           widget.ticketModel.fkUserClose.toString(),
              //         )),
              //     cardRowDivided(
              //       title: 'تاريخ إغلاق التذكرة ',
              //       value: widget.ticketModel.dateClose,
              //     ),
              //     cardRowDivided(
              //       title: '  ملاحظات إغلاق التذكرة ',
              //       value: widget.ticketModel.notesTicket,
              //       isExpanded: true,
              //     ),
              //     Divider(
              //       thickness: 1,
              //       color: Colors.grey,
              //     ),
              //   ],
              //
              //   if (widget.ticketModel.dateRecive != null) ...[
              //     cardRowDivided(
              //         title: 'قام باستلام التذكرة ',
              //         value: getnameshort(
              //           widget.ticketModel.fkUserRecive.toString(),
              //         )),
              //     cardRowDivided(
              //       title: 'تاريخ استلام التذكرة ',
              //       value: widget.ticketModel.dateRecive,
              //     ),
              //     Divider(
              //       thickness: 1,
              //       color: Colors.grey,
              //     ),
              //   ],
              //
              //   cardRowDivided(
              //       title: 'قام بفتح التذكرة ',
              //       value:
              //           getnameshort(widget.ticketModel.fkUserOpen.toString())),
              //   cardRowDivided(
              //       title: 'تاريخ فتح التذكرة ',
              //       value: widget.ticketModel.dateOpen),
              //   Divider(
              //     thickness: 1,
              //     color: Colors.grey,
              //   ),
              //   cardRowDivided(
              //       title: 'نوع التذكرة',
              //       value: widget.ticketModel.typeProblem),
              //   cardRowDivided(
              //       title: 'مصدر التذكرة',
              //       value: widget.ticketModel.ticketSource),
              //   cardRowDivided(
              //     title: 'تفاصيل التذكرة',
              //     value: widget.ticketModel.detailsProblem,
              //     isExpanded: true,
              //   ),
              //   cardRowDivided(
              //     title: 'الفئات',
              //     value: widget.ticketModel.categoriesTicketFk
              //         ?.map((e) => e.categoryAr)
              //         .join(', '),
              //     isExpanded: true,
              //   ),
              //   cardRowDivided(
              //     title: 'الفئات الفرعية',
              //     value: widget.ticketModel.subcategoriesTicketFk
              //         ?.map((e) => e.subCategoryAr)
              //         .join(', '),
              //     isExpanded: true,
              //   ),
              //   SizedBox(height: 10),
              //   Divider(
              //     thickness: 1,
              //     color: Colors.grey,
              //   ),
              //   //cardRowDivided( title: 'تقييم بعد الإغلاق',value:  ticketModel.rate),
              //   widget.ticketModel.dateRate != null
              //       ? Row(
              //           children: [
              //             Text('تقييم بعد الإغلاق'),
              //             RatingBar.builder(
              //               initialRating:
              //                   double.parse(widget.ticketModel.rate),
              //               minRating: 1,
              //               direction: Axis.horizontal,
              //               allowHalfRating: false,
              //               // glow: true,
              //               ignoreGestures: true,
              //               itemCount: 5,
              //               itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              //               itemBuilder: (context, _) => Icon(
              //                 Icons.star,
              //                 color: Colors.amber,
              //               ),
              //               onRatingUpdate: (double value) {},
              //             ),
              //           ],
              //         )
              //       : Container(),
              //
              //   widget.ticketModel.dateRate != null
              //       ? cardRowDivided(
              //           title: 'قام بالتقييم',
              //           value: widget.ticketModel.fkuserRate)
              //       : Container(),
              //
              //   widget.ticketModel.dateRate != null
              //       ? cardRowDivided(
              //           title: 'تاريخ التقييم',
              //           value: widget.ticketModel.dateRate)
              //       : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
