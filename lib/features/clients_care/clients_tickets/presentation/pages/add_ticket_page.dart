import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/clientmodel.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../../ui/widgets/container_boxShadows.dart';
import '../../../../../ui/widgets/custom_widget/row_edit.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../manager/add_ticket_cubit/add_ticket_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({
    this.fkClient,
    Key? key,
  }) : super(key: key);
  final String? fkClient;

  @override
  _AddTicketPageState createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  late final AddTicketCubit addTicketCubit;
  String? fkClient;

  final TextEditingController problem_desc = TextEditingController();

  //final TextEditingController notes = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  late String name_enterprise;
  late String name_regoin;
  late String name_country;
  TicketSourceEnums? ticketSource;

  @override
  void initState() {
    addTicketCubit = context.read<AddTicketCubit>();
    fkClient = widget.fkClient;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ClientProvider>(context, listen: false)
          .getclient_Accept();
      Provider.of<ClientProvider>(context, listen: false)
          .changevalueclient(null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('إضافة تذكرة جديدة'),
          centerTitle: true,
          backgroundColor: kMainColor,
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _globalKey,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 50),
                child: ContainerShadows(
                  width: double.infinity,
                  margin: EdgeInsets.only(),
                  padding:
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      RowEdit(name: 'اسم العميل', des: '*'),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8,
                        ),
                        child: Consumer<ClientProvider>(
                          builder: (context, cart, child) {
                            return DropdownSearch<ClientModel1>(
                              mode: Mode.DIALOG,
                              filterFn: (user, filter) {
                                return user!.getfilteruser(filter!);
                              },
                              items: cart.listClientAccept,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                fkClient = data!.idClients;
                                cart.changevalueclient(data);
                                name_enterprise = data.nameEnterprise!;
                                name_regoin = data.name_regoin!;
                                name_country = data.nameCountry!;
                              },
                              selectedItem: cart.selectedclient,
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                  isCollapsed: true,
                                  hintText: 'العميل',
                                  alignLabelWithHint: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  contentPadding: EdgeInsets.all(0),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      if (fkClient == null)
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kMainColor)),
                          onPressed: () {
                            AppNavigator.push(
                                ProfileClient(idClient: fkClient!));
                          },
                          child: Text('ملف العميل'),
                        ),
                      SizedBox(
                        height: 10,
                      ),

                      RowEdit(name: 'نوع المشكلة', des: '*'),

                      Consumer<ClientTypeProvider>(
                        builder: (context, cart, child) {
                          return SizedBox(
                            //width: 240,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey))),

                              isExpanded: true,
                              //hint: Text("حدد حالة العميل"),
                              items: cart.type_of_out.map((level_one) {
                                return DropdownMenuItem(
                                  child: Text(
                                      level_one.nameReason), //label of item
                                  value: level_one.nameReason, //value of item
                                );
                              }).toList(),
                              value: cart.selectedValueOut,
                              onChanged: (value) {
                                //  setState(() {
                                cart.changevalueOut(value.toString());
                                // });
                              },
                            ),
                          );
                        },
                      ),

                      RowEdit(name: 'مصدر التذكرة', des: ''),
                      _ticketSourceDropDown(),

                      SizedBox(
                        height: 15,
                      ),
                      // RowEdit(name: 'ملاحظات ', des: ''),
                      //
                      // EditTextFormField(
                      //   vaild: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'الحقل فارغ';
                      //     }
                      //   },
                      //   hintText: '',
                      //   controller: notes,
                      //   maxline: 3,
                      // ),
                      //SizedBox(height: 15,),
                      RowEdit(name: 'وصف المشكلة', des: ''),
                      EditTextFormField(
                        vaildator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ';
                          }
                          return null;
                        },
                        hintText: '',
                        controller: problem_desc,
                        maxline: 4,
                      ),
                      SizedBox(height: 15),
                      BlocConsumer<AddTicketCubit, AddTicketState>(
                        listener: (context, state) {
                          if (state is AddTicketSuccess) {
                            context.read<TicketsCubit>().getTickets();
                          } else if (state is AddTicketError) {
                            AppConstants.showSnakeBar(context, state.message);
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: AppElevatedButton(
                                text: 'حفظ',
                                isLoading: state is AddTicketLoading,
                                onPressed: () async {
                                  _globalKey.currentState!.save();
                                  if (_globalKey.currentState!.validate()) {
                                    if (fkClient == null) {
                                      AppConstants.showSnakeBar(
                                        context,
                                        'من فضلك اختر عميل',
                                      );
                                      return;
                                    }
                                    addTicketCubit.addTicket(
                                      AddTicketParams(
                                        fkClient: fkClient!,
                                        typeProblem:
                                            Provider.of<ClientTypeProvider>(
                                                    context,
                                                    listen: false)
                                                .selectedValueOut
                                                .toString(),
                                        detailsProblem: problem_desc.text,
                                        ticketSource: ticketSource?.text ?? '',
                                        clientType: '0',
                                        notes: '',
                                      ),
                                    );
                                  }
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  SizedBox _ticketSourceDropDown() {
    return SizedBox(
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return 'الحقل فارغ';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: Colors.grey))),

        isExpanded: true,
        hint: Text("مصدر التذكرة"),
        items: TicketSourceEnums.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.text),
                  value: e.text,
                ))
            .toList(),
        // value: cart.selectedValueOut,
        onChanged: (value) {
          ticketSource =
              TicketSourceEnumsExtension.fromString(value.toString());
        },
      ),
    );
  }

  @override
  void dispose() {
    problem_desc.dispose();

    super.dispose();
  }
}
