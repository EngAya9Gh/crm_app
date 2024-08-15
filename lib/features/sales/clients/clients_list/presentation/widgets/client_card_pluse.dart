import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class CardClient_pluse extends StatefulWidget {
  CardClient_pluse({Key? key, required this.clientModel}) : super(key: key);
  ClientModel clientModel;

  @override
  State<CardClient_pluse> createState() => _CardClient_pluseState();
}

class _CardClient_pluseState extends State<CardClient_pluse> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10).r,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black87.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppText(
                      widget.clientModel.nameEnterprise.toString(),
                      style: AppStyles.textStyle,
                    ),
                  ),
                  AppText(
                    widget.clientModel.typeClient.toString(),
                    style: AppStyles.textStyle,
                  ),
                  if ((widget.clientModel.tag ?? false) &&
                      context.read<PrivilegeCubit>().checkPrivilege('133'))
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.amber,
                    )
                ],
              ),
              Row(
                children: [
                  AppText(
                    widget.clientModel.name_city.toString(),
                    style: AppStyles.textStyle,
                  ),
                  Expanded(
                    child: AppText(
                      DateTime.tryParse(widget.clientModel.dateCreate!) != null
                          ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(
                              DateTime.parse(widget.clientModel.dateCreate!))
                          : widget.clientModel.dateCreate.toString(),
                      style: AppStyles.textStyle.copyWith(color: kMainColor),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                      widget.clientModel.nameRegion.toString(),
                      style: AppStyles.textStyle,
                    ),
                  ),
                  Flexible(
                    child: AppText(
                      widget.clientModel.activity_type_title == null
                          ? ''
                          : widget.clientModel.activity_type_title.toString(),
                      style: AppStyles.textStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
