import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';
import '../manager/client_attachments_bloc.dart';

class FilterClientAttachmentSheet extends StatelessWidget {
  const FilterClientAttachmentSheet({
    required this.bloc,
    this.canReset = false,
    Key? key,
  });

  final bool canReset;
  final ClientAttachmentsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ClientAttachmentsBloc, ClientAttachmentsState>(
            bloc: bloc,
            // buildWhen: (previous, current) => previous.getAttachmentsParams != current.getAttachmentsParams,
            builder: (context, state) {
              // print(state.getAttachmentsParams.isEmpty());
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  if (!state.getAttachmentsParams.isEmpty())
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppTextButton(
                        onPressed: () {
                          bloc.add(ChangeFilterClientEvent(getAttachmentsParams: GetAttachmentsParams()));

                          if (canReset) {
                            bloc.add(GetAttachmentsEvent());
                          }
                          AppNavigator.pop();
                        },
                        text: "إعادة الافتراضي",
                        appButtonStyle: AppButtonStyle.secondary,
                      ),
                    ),
                  10.height,
                  CustomSearchableDropDown<SubscribedClientsModel>(
                      hint: "المشترك",
                      items: (state.getAllClients.data ?? []),
                      itemAsString: (item) => item?.nameEnterprise ?? '',
                      selectedItem: (((state.getAllClients.data ?? []).isEmpty))
                          ? null
                          : state.getAttachmentsParams.clientId != null
                              ? state.getAllClients.data?.firstWhere(
                                  (element) => element.id == state.getAttachmentsParams.clientId,
                                )
                              : null,
                      onChanged: (value) {
                        if (value == null) return;
                        bloc.add(ChangeFilterClientEvent(getAttachmentsParams: state.getAttachmentsParams.copyWith(client_id: () => value.id)));
                      },
                      compareFn:  (item, selectedItem) => item.id == selectedItem.id,

                      validator: InputValidator.requiredFiled,
                      filterFn: (subscribedClientsModel, string) {
                        return subscribedClientsModel.nameEnterprise!.toLowerCase().contains(string.toLowerCase());
                      }),
                  10.height,
                  CustomDropDown<TypeSubClientEnum>(
                    hint: "الحالة",
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
                    items: List.of(TypeSubClientEnum.values)..removeWhere((element) => element.text==TypeSubClientEnum.all.text,),
                    itemAsString: (item) => item?.text ?? '',
                    selectedItem: ((state.getAttachmentsParams.type != null)&&(state.getAttachmentsParams.type != 'all'))
                        ? TypeSubClientEnum.values.firstWhere(
                            (element) => element.id == state.getAttachmentsParams.type,
                          )
                        : null,
                    onChanged: (value) {
                      if (value == null) return;
                      bloc.add(ChangeFilterClientEvent(getAttachmentsParams: state.getAttachmentsParams.copyWith(type: () => value.id)));
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  20.height,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "فلترة",
                      onPressed: () {
                        bloc
                          // ..add(ChangeFilterClientEvent(getAttachmentsParams: state.getAttachmentsParams))
                          .add(GetAttachmentsEvent());
                        // widget.bloc.add( GetAllCareActivitiesEvent(page: 1,));
                        context.pop(true);
                      },
                    ),
                  ),
                  20.height,
                ],
              );
            }),
      ),
    );
  }
}
