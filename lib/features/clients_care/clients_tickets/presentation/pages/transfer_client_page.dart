import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.kWhiteColor),
        onPressed: () => AppNavigator.pop(),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                Text("من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
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
                  EditTextFormField(
                    maxline: 4,
                    paddcustom: EdgeInsets.all(10),
                    hintText: 'أسباب تحويل التذكرة ',
                    obscureText: false,
                    controller: _textReason,
                    vaildator: (value) {
                      if (value.toString().trim().isEmpty) {
                        return 'الحقل فارغ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<EditTicketCubit, EditTicketState>(
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state is EditTicketLoading,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kMainColor)),
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
                        child: Text('تأكيد العملية'),
                      );
                    },
                  ),
                ] else ...[
                  BlocConsumer<ClientsListBloc, ClientsListState>(
                    listener: (context, state) {
                      if (state.transferClientStatus.isFailed()) {
                        AppSnackbar.showSnakeBar(
                            state.transferClientStatus.error!);
                      } else if (state.transferClientStatus.isSuccess()) {
                        AppSnackbar.showSnakeBar('تمت العملية بنجاح');
                      }
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.transferClientStatus.isLoading(),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kMainColor)),
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
                                        .get_byIdClient(widget.idClient);
                                    AppNavigator.pop(result: value);
                                  },
                                ));
                          }
                        },
                        child: Text('تأكيد العملية'),
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
