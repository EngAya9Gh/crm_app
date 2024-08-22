import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_paginated_list.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/get_high_similar_cleints_usecase.dart';
import '../manager/clients_list_bloc.dart';
import 'card_similar.dart';

class AddClientButtons extends StatefulWidget {
  const AddClientButtons({
    super.key,
    required this.addClientParam,
  });

  final AddClientParams addClientParam;

  @override
  State<AddClientButtons> createState() => _AddClientButtonsState();
}

class _AddClientButtonsState extends State<AddClientButtons> {
  late final ClientsListBloc _cubit;
  late AddClientParams addClientParams;

  @override
  void initState() {
    _cubit = context.read<ClientsListBloc>();
    addClientParams = widget.addClientParam;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsListBloc, ClientsListState>(
      listenWhen: (previous, current) =>
          previous.actionClientBlocStatus != current.actionClientBlocStatus,
      listener: (context, state) {
        if (state.actionClientBlocStatus.isFailed()) {
          if (state.actionClientBlocStatus.error == 'warning') {
            showDialog(
              context: context,
              builder: (context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: SimpleDialog(
                    contentPadding: EdgeInsets.all(16.0),
                    children: [
                      Center(
                        child: AppText(
                          'تحذير',
                          style: AppStyles.textStyle.copyWith(
                            fontSize: (20.0).scaleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      20.height,
                      AppText(
                        'يوجد عميل مشابه للعميل الذي تريد إضافته هل تريد الاستمرار؟',
                      ),
                      10.height,
                      BlocBuilder<ClientsListBloc, ClientsListState>(
                        buildWhen: (previous, current) =>
                            previous.highSimilarClientsState !=
                            current.highSimilarClientsState,
                        builder: (context, state) {
                          return state.highSimilarClientsState.when(
                            loading: () => const AppLoader(),
                            success: (data) {
                              return SizedBox(
                                height: 0.40.sh,
                                width: 0.65.sw,
                                child: CustomPaginatedList(
                                  items: state.highSimilarClientsState.data!,
                                  itemBuilder: (context, index) {
                                    return CardSimilar(
                                      smClient: state
                                          .highSimilarClientsState.data![index],
                                    );
                                  },
                                ),
                              );
                            },
                            empty: () => CustomErrorWidget(
                                message: 'لا يوجد عملاء مشابهين'),
                            failure: (error, data) => CustomErrorWidget(
                              message: error.toString(),
                              onPressed: () {
                                AppNavigator.pop();
                                _getHighSimilarClients();
                              },
                            ),
                          );
                        },
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppElevatedButton(
                            onPressed: () {
                              addClientParams =
                                  addClientParams.copyWith(force: true);
                              AppNavigator.pop();
                              _addClient();
                            },
                            child: const Text('نعم'),
                          ),
                          AppElevatedButton(
                            onPressed: () => AppNavigator.pop(),
                            child: const Text('لا'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
            return;
          }
          AppSnackbar.showSnakeBar(
            state.actionClientBlocStatus.error ?? '',
            color: ToastColorsEnum.error,
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.actionClientBlocStatus != current.actionClientBlocStatus ||
          previous.highSimilarClientsState != current.highSimilarClientsState,
      builder: (context, state) {
        if (state.actionClientBlocStatus.isLoading()) {
          return const AppLoader();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppElevatedButton(
              isLoading: state.actionClientBlocStatus.isLoading(),
              text: "إضافة",
              onPressed: () {
                _addClient();
                _getHighSimilarClients();
              },
            ),
            AppElevatedButton(
              isLoading: state.actionClientBlocStatus.isLoading(),
              text: "رجوع",
              onPressed: () => AppNavigator.pop(),
            ),
          ],
        );
      },
    );
  }

  void _getHighSimilarClients() {
    _cubit.add(GetHighSimilarClientsListEvent(GetHighSimilarClientsParams(
      name_client: widget.addClientParam.nameClient,
      name_enterprise: widget.addClientParam.nameEnterprise,
      phone: widget.addClientParam.mobile,
    )));
  }

  void _addClient() {
    _cubit.add(AddClientEvent(addClientParams, onSuccess: (client) {
      AppNavigator.pop(result: client);
      AppNavigator.pop(result: client);
    }));
  }
}
