import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

class TicketTypeTabsWidget extends StatefulWidget {
  const TicketTypeTabsWidget({super.key});

  @override
  State<TicketTypeTabsWidget> createState() => _TicketTypeTabsWidgetState();
}

class _TicketTypeTabsWidgetState extends State<TicketTypeTabsWidget> {
  late final TicketsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<TicketsCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseFontSize = screenWidth * 0.03; // 3% of screen width
    final responsiveFontSize = baseFontSize.clamp(10.0, 16.0);

    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) =>
      previous.getTicketsStatus != current.getTicketsStatus,
      builder: (context, state) {
        return ValueListenableBuilder<TicketTypesEnum?>(
          valueListenable: _cubit.filterEntity.ticketTypeNotifier,
          builder: (context, selectedType, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TicketTypesEnum.values.map((type) {
                    final isSelected = selectedType == type;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ChoiceChip(
                        label: Text(
                          type.nameAr,
                          style: TextStyle(
                            fontSize: responsiveFontSize,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        showCheckmark: false,
                        onSelected: (_) => _cubit.selectTicketType(type),
                        backgroundColor: Colors.grey[300],
                        selectedColor: type.color,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }


}
