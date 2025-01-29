import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../data/models/verified_client_model.dart';
import '../manager/verified_client_bloc.dart';
import 'insure_transfer_client_dialog.dart';

class VerifiedClientCard extends StatelessWidget {
  const VerifiedClientCard({
    super.key,
    required this.verifiedClientModel,
  });

  final VerifiedClientModel verifiedClientModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        verifiedClientModel.clientModel.nameRegion,
                        color: AppColors.primaryMain,
                        fontSize: 16,
                      ),
                      AppText(
                        verifiedClientModel.clientModel.dateCreate,
                        color: AppColors.primaryMain,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (verifiedClientModel.clientModel.idClients != null)
                        AppText(
                          "${verifiedClientModel.clientModel.idClients}#  ",
                          fontFamily: AppFonts.fontFamily1,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryMain,
                        ),
                      Expanded(
                        child: AppText(
                          verifiedClientModel.clientModel.nameEnterprise,
                          fontSize: 18,
                          fontFamily: AppFonts.fontFamily1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (verifiedClientModel.clientModel.typeClient?.isNotEmpty ?? false)
                        AppStatusChip(
                          status: verifiedClientModel.clientModel.typeClient ?? '',
                          color: AppColors.primaryMain,
                        ),
                    ],
                  ),
                  5.height,
                  if (verifiedClientModel.clientModel.name_city?.isNotEmpty ?? false)
                    Row(
                      children: [
                        AppText(
                          'اسم المدينة',
                          fontSize: 14,
                          fontFamily: AppFonts.fontFamily1,
                          color: AppColors.primaryMain,
                        ),
                        AppText(
                          "(${verifiedClientModel.clientModel.name_city})",
                          fontSize: 14,
                          fontFamily: AppFonts.fontFamily1,
                          color: AppColors.primaryMain,
                        ),
                      ],
                    ),
                  if (verifiedClientModel.lastOperation != null &&
                      verifiedClientModel.userDidOperation != null) ...{
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppText(
                              verifiedClientModel.lastOperation,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            SizedBox(width: 4),
                            AppText(
                              "(${verifiedClientModel.userDidOperation})",
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        AppText(
                          DateFormat('yyyy-MM-dd').format(verifiedClientModel.dateLastOperation!),
                          fontFamily: AppFonts.fontFamily1,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )
                      ],
                    ),
                  },
                  5.height,
                  Center(
                    child: AppElevatedButton(
                      text: 'ترحيل العميل',
                      onPressed: () {
                        AppConstants.showAppDialog(
                          child: InsureTransferClientDialog(
                            bloc: context.read<VerifiedClientBloc>(),
                            clientModel: verifiedClientModel,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
