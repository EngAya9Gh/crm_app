import 'package:crm_smart/core/common/enums/client/subscribing_intention_level_enum.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribingIntentionLevelWidget extends StatelessWidget {
  const SubscribingIntentionLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ClientsListBloc>();
    return BlocBuilder<ClientsListBloc, ClientsListState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CustomDropDown<SubscribingIntentionLevelEnum>(
                hint: "النية بالاشتراك",
                items: SubscribingIntentionLevelEnum.values,
                itemAsString: (value) => value!.name,
                height: 120.h,
                selectedItem: bloc.subscribingIntentionLevel,
                onChanged: (value) {
                  bloc.subscribingIntentionLevel = value!;
                },
                itemAsIcon: (value) {
                  return Icon(
                    Icons.flag,
                    color: value!.color,
                    size: 20.sp,
                  );
                },
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 15,
                ),
              ),
            ),
            if (bloc.subscribingIntentionLevel != null) ...[
              SizedBox(width: 10),
              Icon(
                Icons.flag,
                color: bloc.subscribingIntentionLevel!.color,
                size: 20.sp,
              ),
            ],
          ],
        );
      },
    );
  }
}
