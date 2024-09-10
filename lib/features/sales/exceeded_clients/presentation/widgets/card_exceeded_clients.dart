import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/exceeded_clients_cubit.dart';

class CardExceededClients extends StatelessWidget {
  const CardExceededClients({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return AppCardContainer(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                AppNavigator.go(
                  ClientProfile(idClient: client.idClients),
                  name: AppRoutesNames
                      .clientProfile.clientProfileInExceededClients,
                  pathParameters: {'idClient': client.idClients!},
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      client.nameEnterprise.toString(),
                      style: _customTextStyle(context),
                    ),
                    AppText(
                      client.dateCreate.toString(),
                      style: _customTextStyle(context),
                    ),
                    AppText(
                      client.nameRegion.toString(),
                      style: _customTextStyle(context),
                    ),
                    if (client.nameUser != null)
                      AppText(
                        client.nameUser.toString(),
                        style: _customTextStyle(context),
                      ),
                  ],
                ),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (context, refresh) {
              return Checkbox(
                value: isChecked,
                onChanged: (value) {
                  isChecked = value!;
                  context.read<ExceededClientsCubit>().selectClient(client);
                  refresh(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }

  TextStyle? _customTextStyle(BuildContext context) {
    return AppStyles.textStyle.copyWith(
      fontSize: (18.0).scaleFontSize,
    );
  }
}
