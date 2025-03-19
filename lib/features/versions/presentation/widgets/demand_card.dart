import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/domain/use_cases/change_demand_status_usecase.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/widgets/demand_change_status_add_comment_dialog.dart';
import 'package:crm_smart/features/versions/presentation/widgets/order_new_version_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class demandCardWidget extends StatelessWidget {
  const demandCardWidget({
    super.key,
    required this.status,
    required this.item,
  });

  final DemandVersionStatus status;
  final DemandModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.scaleIconsSize,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Colors.black87.withOpacity(0.2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              context.read<VersionsBloc>().add(GetDemandCommentsEvent(params: DemandChangeStatusOrCommentParams(idDemand: item.id!)));
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => DemandChangeStatusAndSHowCommentDialog(
                    demandModel: item, status: status, bloc: context.read<VersionsBloc>()), // builder: (context) => BlocProvider.value(
              );
            },
            child: Row(
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: status.color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              item.title ?? '',
                              color: AppColors.primaryMain,
                              fontSize: 16.scaleFontSize,
                            ),
                            AppText(
                              DateFormat('yyyy-MM-dd').format(item.createdAt ?? DateTime.now()),
                              color: AppColors.primaryMain,
                              fontSize: 16.scaleFontSize,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              item.goal ?? '',
                              color: AppColors.primaryMain,
                              fontSize: 20.scaleFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                            AppStatusChip(
                              status: status.text,
                              color: status.color,
                              fontSize: 13.scaleFontSize,
                            ),
                          ],
                        ),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              item.management ?? '',
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppText(
                              item.nameUser ?? '',
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (context.read<PrivilegesCubit>().checkPrivilege("338"))
          PositionedDirectional(
              end: 0,
              bottom: 0,
              child: IconButton(
                  onPressed: () {
                    AppConstants.showAppDialog(
                      child: OrderNewVersionDialog(
                        demandModel: item,
                      ),
                    ).then(
                      (value) {
                        if (value) context.read<VersionsBloc>().add(GetDenmadsEvent());
                      },
                    );
                  },
                  icon: Icon(
                    Icons.edit_square,
                    color: AppColors.primaryMain,
                  ))),
      ],
    );
  }
}
