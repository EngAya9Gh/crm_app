import 'dart:async';

import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/get_similar_cleints_usecase.dart';
import '../manager/clients_list_bloc.dart';
import 'card_similar.dart';

class SimilarDialog extends StatefulWidget {
  const SimilarDialog({
    Key? key,
    required this.nameClient,
    required this.name_enterprise,
    required this.phone,
    required this.addClientParams,
  }) : super(key: key);
  final String nameClient, name_enterprise, phone;
  final AddClientParams addClientParams;

  @override
  State<SimilarDialog> createState() => _SimilarDialogState();
}

class _SimilarDialogState extends State<SimilarDialog> {
  late final ClientsListBloc _clientsListBloc;
  late AddClientParams addClientParams;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    _clientsListBloc.add(GetSimilarClientsListEvent(GetSimilarClientsListParams(
      name_client: widget.nameClient,
      name_enterprise: widget.name_enterprise,
      phone: widget.phone,
    )));
    addClientParams = widget.addClientParams;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(title: 'قائمة العملاء المتشابهين')),
      body: RefreshIndicator(
        onRefresh: () {
          _clientsListBloc
              .add(GetSimilarClientsListEvent(GetSimilarClientsListParams(
            name_client: widget.nameClient,
            name_enterprise: widget.name_enterprise,
            phone: widget.phone,
          )));
          return Future.value();
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<ClientsListBloc, ClientsListState>(
            buildWhen: (previous, current) =>
                previous.similarClientsState != current.similarClientsState,
            builder: (context, state) {
              return state.similarClientsState.when(
                loading: () => AppLoader(),
                success: (data) => Column(
                  children: [
                    Padding(
                      padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText("عدد العملاء"),
                          AppText(data!.length.toString()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            CardSimilar(
                          smClient: state.similarClientsState.data![index],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount: state.similarClientsState.data!.length,
                      ),
                    ),
                    15.verticalSpace,
                    BlocConsumer<ClientsListBloc, ClientsListState>(
                      listener: (context, state) {
                        if (state.actionClientBlocStatus.isFailed()) {
                          if (state.actionClientBlocStatus.error == 'warning') {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AlertDialog(
                                    title: const Text('تحذير'),
                                    content: const Text(
                                        'يوجد عميل مشابه للعميل الذي تريد إضافته هل تريد الاستمرار؟'),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          addClientParams = addClientParams
                                              .copyWith(force: true);
                                          AppNavigator.pop();
                                          _addClient(context);
                                        },
                                        child: const Text('نعم'),
                                      ),
                                      TextButton(
                                        onPressed: () => AppNavigator.pop(),
                                        child: const Text('لا'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          AppConstants.showSnakeBar(
                            state.actionClientBlocStatus.error ?? '',
                            color: ToastColorsEnum.error,
                          );
                        }
                      },
                      buildWhen: (previous, current) =>
                          previous.actionClientBlocStatus !=
                          current.actionClientBlocStatus,
                      builder: (context, state) {
                        if (state.actionClientBlocStatus.isLoading()) {
                          return const AppLoader();
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppElevatedButton(
                              isLoading:
                                  state.actionClientBlocStatus.isLoading(),
                              text: "إضافة",
                              onPressed: () => _addClient(context),
                            ),
                            AppElevatedButton(
                              isLoading:
                                  state.actionClientBlocStatus.isLoading(),
                              text: "رجوع",
                              onPressed: () => AppNavigator.pop(),
                            ),
                          ],
                        );
                      },
                    ),
                    15.verticalSpace,
                  ],
                ),
                empty: () =>
                    CustomErrorWidget(message: 'لا يوجد عملاء مشابهين'),
                failure: (error, data) {
                  return CustomErrorWidget(onPressed: () {
                    _clientsListBloc.add(
                        GetSimilarClientsListEvent(GetSimilarClientsListParams(
                      name_client: widget.nameClient,
                      name_enterprise: widget.name_enterprise,
                      phone: widget.phone,
                    )));
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _addClient(BuildContext context) {
    _clientsListBloc.add(AddClientEvent(addClientParams, onSuccess: (client) {
      AppNavigator.pop(result: client);
      AppNavigator.pop(result: client);
    }));
  }
}
