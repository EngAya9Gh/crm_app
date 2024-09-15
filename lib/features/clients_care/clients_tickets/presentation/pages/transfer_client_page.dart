import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart';
import '../../../../sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../domain/use_cases/transfer_ticket_usecase.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';

class TransferClientPage extends StatefulWidget {
  const TransferClientPage({
    this.idTicket,
    required this.type,
    required this.nameEnterprise,
    required this.idClient,
    Key? key,
  }) : super(key: key);

  final String idClient;
  final String nameEnterprise;
  final String type;
  final String? idTicket;

  @override
  _TransferClientPageState createState() => _TransferClientPageState();
}

class _TransferClientPageState extends State<TransferClientPage> {
  late final ClientsListBloc clientsListBloc;
  late String? idUser;
  TextEditingController _textReason = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();
  late final bool isTicket;
  late final ClientProvider clientProvider;

  @override
  void initState() {
    clientProvider = Provider.of<ClientProvider>(context, listen: false);
    clientsListBloc = context.read<ClientsListBloc>();
    isTicket = widget.type == "ticket";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: 'تحويل ${isTicket ? 'التذكرة' : 'العميل'}'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                AppText("من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
                SizedBox(height: 10),
                Consumer<UserProvider>(
                  builder: (context, cart, child) {
                    return CustomSearchableDropDown<UserModel>(
                      hint: 'اختر اسم الموظف',
                      items: cart.allUsers,
                      itemAsString: (u) => u!.userAsString(),
                      selectedItem: cart.currentUser,
                      onChanged: (data) => idUser = data!.idUser!,
                      filterFn: (user, filter) => user.getfilteruser(filter),
                      validator: (val) {
                        if (val == null) return 'من فضلك حدد اسم موظف';
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 5),
                if (isTicket) ...[
                  AppTextField(
                    hintText: 'أسباب تحويل التذكرة ',
                    controller: _textReason,
                    validator: InputValidator.requiredFiled,
                    maxLines: 5,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<EditTicketCubit, EditTicketState>(
                    builder: (context, state) {
                      return AppElevatedButton(
                        text: 'تأكيد العملية',
                        isLoading: state is EditTicketLoading,
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            context
                                .read<EditTicketCubit>()
                                .transferTicket(TransferTicketParams(
                                  idTicket: widget.idTicket!,
                                  fkUserTo: idUser!,
                                  reasonTransfer: _textReason.text,
                                ));
                            AppNavigator.pop();
                          }
                        },
                      );
                    },
                  ),
                ] else ...[
                  BlocConsumer<ClientsListBloc, ClientsListState>(
                    listenWhen: (previous, current) =>
                        current.transferClientStatus !=
                        previous.transferClientStatus,
                    listener: (context, state) {
                      if (state.transferClientStatus.isFailed()) {
                        AppSnackbar.showSnakeBar(
                          state.transferClientStatus.error!,
                          color: ToastColorsEnum.error,
                        );
                      } else if (state.transferClientStatus.isSuccess()) {
                        AppSnackbar.showSnakeBar(
                          'تمت العملية بنجاح',
                          color: ToastColorsEnum.success,
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        text: 'تأكيد العملية',
                        isLoading: state.transferClientStatus.isLoading(),
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            context
                                .read<ClientsListBloc>()
                                .add(TransferClientEvent(
                                  TransferClientParams(
                                      idClient: widget.idClient,
                                      fkUserTo: idUser!),
                                  onSuccess: (value) async {
                                    await clientProvider
                                        .getClientById(widget.idClient);
                                    AppNavigator.pop(result: value);
                                  },
                                ));
                          }
                        },
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
