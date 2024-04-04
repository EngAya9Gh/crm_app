import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/transfer_client_usecase.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/ticket_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../../clients_list/presentation/manager/clients_list_bloc.dart';
import '../../domain/use_cases/transfer_ticket_usecase.dart';

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
      await Provider.of<UserProvider>(context, listen: false).getUsersVm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back, color: kWhiteColor),
        onPressed: () => AppNavigator.pop(),
      )),
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<ClientProvider>(context, listen: true).isloading,
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<ticket_vm>(context, listen: true).isloading,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Text(
                        "من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
                    SizedBox(height: 10),
                    Consumer<UserProvider>(
                      builder: (context, cart, child) {
                        return DropdownSearch<UserModel>(
                          mode: Mode.DIALOG,
                          validator: (val) {
                            if (val == null) return 'من فضلك حدد اسم موظف';
                            return null;
                          },
                          filterFn: (user, filter) =>
                              user!.getfilteruser(filter!),
                          items: cart.allUsers,
                          itemAsString: (u) => u!.userAsString(),
                          // selectedItem: cart.currentUser,
                          onChanged: (data) => idUser = data!.idUser!,
                          showSearchBox: true,
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "choose a user",
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 5),
                            border: OutlineInputBorder(),
                          ),
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
                    ],
                    if (isTicket) ...[
                      BlocBuilder<EditTicketCubit, EditTicketState>(
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state is EditTicketLoading,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
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
                          if (state.transferClientStatus.isFail()) {
                            AppConstants.showSnakeBar(
                                context, state.transferClientStatus.error!);
                          } else if (state.transferClientStatus.isSuccess()) {
                            AppConstants.showSnakeBar(
                                context, 'تمت العملية بنجاح');
                          }
                        },
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state.transferClientStatus.isLoading(),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                context
                                    .read<ClientsListBloc>()
                                    .add(TransferClientEvent(
                                      TransferClientParams(
                                          idUser: widget.idClient,
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
        ),
      ),
    );
  }
}
