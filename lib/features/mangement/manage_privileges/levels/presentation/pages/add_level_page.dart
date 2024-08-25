import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../view_model/client_vm.dart';
import '../manager/add_ticket_cubit/add_ticket_cubit.dart';

class AddLevelPage extends StatefulWidget {
  const AddLevelPage({
    this.fkClient,
    Key? key,
  }) : super(key: key);
  final String? fkClient;

  @override
  _AddLevelPageState createState() => _AddLevelPageState();
}

class _AddLevelPageState extends State<AddLevelPage> {
  late final AddTicketCubit addTicketCubit;
  String? fkClient;

  final TextEditingController problem_desc = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  late String name_enterprise;
  late String name_regoin;
  late String name_country;
  TicketSourceEnum? ticketSource;

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
    return AppScaffold(
        appBar: CustomAppBar(title: 'إضافة مستوي'),
        body: SingleChildScrollView(
            // child: Directionality(
            //   textDirection: TextDirection.rtl,
            //   child: Form(
            //     key: _globalKey,
            //     child: Padding(
            //       padding:
            //           EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 50),
            //       child: ContainerShadows(
            //         width: double.infinity,
            //         margin: EdgeInsets.only(),
            //         padding:
            //             EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            //         child: Column(
            //           children: [
            //             SizedBox(height: 15),
            //             RowEdit(name: 'اسم العميل', des: '*'),
            //             Padding(
            //               padding: const EdgeInsets.only(
            //                 left: 8.0,
            //                 right: 8,
            //               ),
            //               child: Consumer<ClientProvider>(
            //                 builder: (context, cart, child) {
            //                   return CustomSearchableDropDown<ClientModel>(
            //                     hint: 'العميل',
            //                     items: cart.listClientAccept,
            //                     itemAsString: (u) => u!.userAsString(),
            //                     selectedItem: cart.selectedclient,
            //                     onChanged: (data) {
            //                       fkClient = data!.idClients;
            //                       cart.changevalueclient(data);
            //                       name_enterprise = data.nameEnterprise!;
            //                       name_regoin = data.nameRegion!;
            //                       name_country = data.nameCountry!;
            //                     },
            //                     filterFn: (user, filter) {
            //                       return user.getFilterUser(filter);
            //                     },
            //                     buttonDecoration:
            //                         AppStyles.underlinedDropdownButtonDecoration(
            //                       context: context,
            //                       hintText: 'العميل',
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //             SizedBox(height: 10),
            //             if (fkClient == null)
            //               ElevatedButton(
            //                 style: ButtonStyle(
            //                     backgroundColor: MaterialStateProperty.all(
            //                         AppColors.primaryColor)),
            //                 onPressed: () {
            //                   AppNavigator.push(ProfileClient(
            //                     idClient: fkClient!,
            //                   ));
            //                 },
            //                 child: Text('ملف العميل'),
            //               ),
            //             SizedBox(height: 10),
            //             RowEdit(name: 'نوع المشكلة', des: '*'),
            //             Consumer<ClientTypeProvider>(
            //               builder: (context, cart, child) {
            //                 return SizedBox(
            //                   child: DropdownButtonFormField(
            //                     decoration: InputDecoration(
            //                         enabledBorder: OutlineInputBorder(
            //                             borderRadius: BorderRadius.circular(12),
            //                             borderSide: BorderSide(
            //                               width: 2,
            //                               color: Colors.grey,
            //                             ))),
            //                     isExpanded: true,
            //                     items: cart.type_of_out.map((level_one) {
            //                       return DropdownMenuItem(
            //                         child: Text(level_one.nameReason),
            //                         value: level_one.nameReason,
            //                       );
            //                     }).toList(),
            //                     value: cart.selectedValueOut,
            //                     onChanged: (value) {
            //                       cart.changevalueOut(value.toString());
            //                     },
            //                   ),
            //                 );
            //               },
            //             ),
            //             RowEdit(name: 'مصدر التذكرة', des: ''),
            //             _ticketSourceDropDown(),
            //             SizedBox(height: 15),
            //             RowEdit(name: 'وصف المشكلة', des: ''),
            //             EditTextFormField(
            //               vaildator: (value) {
            //                 if (value!.isEmpty) {
            //                   return 'الحقل فارغ';
            //                 }
            //                 return null;
            //               },
            //               hintText: '',
            //               controller: problem_desc,
            //               maxline: 4,
            //             ),
            //             SizedBox(height: 15),
            //             BlocConsumer<AddTicketCubit, AddTicketState>(
            //               listener: (context, state) {
            //                 if (state is AddTicketSuccess) {
            //                   context.read<LevelsCubit>().getLevels();
            //                 } else if (state is AddTicketError) {
            //                   AppSnackbar.showSnakeBar(
            //                     state.message,
            //                     color: ToastColorsEnum.error,
            //                   );
            //                 }
            //               },
            //               builder: (context, state) {
            //                 return SizedBox(
            //                   width: double.infinity,
            //                   child: AppElevatedButton(
            //                       text: 'حفظ',
            //                       isLoading: state is AddTicketLoading,
            //                       onPressed: () async {
            //                         _globalKey.currentState!.save();
            //                         if (_globalKey.currentState!.validate()) {
            //                           if (fkClient == null) {
            //                             AppSnackbar.showSnakeBar(
            //                               'من فضلك اختر عميل',
            //                             );
            //                             return;
            //                           }
            //                           await addTicketCubit.addTicket(
            //                             AddLevelParams(
            //                               fkClient: fkClient!,
            //                               typeProblem:
            //                                   Provider.of<ClientTypeProvider>(
            //                                           context,
            //                                           listen: false)
            //                                       .selectedValueOut
            //                                       .toString(),
            //                               detailsProblem: problem_desc.text,
            //                               ticketSource: ticketSource?.value ?? '',
            //                               clientType: '0',
            //                               notes: '',
            //                             ),
            //                           );
            //                           AppNavigator.pop();
            //                         }
            //                       }),
            //                 );
            //               },
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
        items: TicketSourceEnum.values
            .where((e) => e != TicketSourceEnum.location)
            .map((e) => DropdownMenuItem(child: Text(e.value), value: e.value))
            .toList(),
        onChanged: (value) {
          ticketSource = TicketSourceEnum.fromString(
            value.toString(),
          );
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
