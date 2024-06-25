import 'dart:async';

import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
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

  @override
  void initState() {
    scheduleMicrotask(() {
      _clientsListBloc = context.read<ClientsListBloc>()
        ..add(GetSimilarClientsListEvent(GetSimilarClientsListParams(
          name_client: widget.nameClient,
          name_enterprise: widget.name_enterprise,
          phone: widget.phone,
        )));
    });
    super.initState();
  }

  @override
  void dispose() {
    _clientsListBloc.add(ResetClientList());

    super.dispose();
  }

  @override
  void deactivate() {
    _clientsListBloc.add(ResetClientList());
    super.deactivate();
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
                init: () => Center(child: CircularProgressIndicator()),
                loading: () => Center(child: CircularProgressIndicator()),
                loaded: (data) => Column(
                  children: [
                    Padding(
                      padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText("عدد العملاء"),
                          AppText(data.length.toString()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            CardSimilar(
                          smClient: state.similarClientsState.data[index],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount: state.similarClientsState.data.length,
                      ),
                    ),
                    15.verticalSpace,
                    BlocBuilder<ClientsListBloc, ClientsListState>(
                      buildWhen: (previous, current) =>
                          previous.actionClientBlocStatus !=
                          current.actionClientBlocStatus,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppElevatedButton(
                              isLoading:
                                  state.actionClientBlocStatus.isLoading(),
                              text: "إضافة",
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              onPressed: () {
                                _clientsListBloc.add(
                                    AddClientEvent(widget.addClientParams,
                                        onSuccess: (client) {
                                  _clientsListBloc.add(ResetClientList());
                                  Navigator.pop(context, client);
                                  Navigator.pop(context, client);
                                }));
                              },
                            ),
                            AppElevatedButton(
                              isLoading:
                                  state.actionClientBlocStatus.isLoading(),
                              text: "رجوع",
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    15.verticalSpace,
                  ],
                ),
                empty: () => Text("Empty "),
                error: (exception) {
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
}
