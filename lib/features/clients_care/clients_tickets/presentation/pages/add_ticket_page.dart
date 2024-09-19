import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/typeclient.dart';
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
  ValueNotifier<String?> fkClientNotifier = ValueNotifier(null);

  final TextEditingController problem_desc = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  late String name_enterprise;
  late String name_regoin;
  late String name_country;
  TicketSourceEnum? ticketSource;

  @override
  void initState() {
    addTicketCubit = context.read<AddTicketCubit>();
    fkClientNotifier.value = widget.fkClient;
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
        appBar: CustomAppBar(title: 'إضافة تذكرة جديدة'),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: AppCardContainer(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.height,
                      AppText('اسم العميل*'),
                      5.height,
                      Consumer<ClientProvider>(
                        builder: (context, cart, child) {
                          return CustomSearchableDropDown<ClientModel>(
                            hint: 'العميل',
                            items: cart.listClientAccept,
                            itemAsString: (u) => u!.userAsString(),
                            selectedItem: cart.selectedclient,
                            onChanged: (data) {
                              fkClientNotifier.value = data!.idClients;
                              cart.changevalueclient(data);
                              name_enterprise = data.nameEnterprise!;
                              name_regoin = data.nameRegion!;
                              name_country = data.nameCountry!;
                            },
                            filterFn: (user, filter) {
                              return user.getFilterUser(filter);
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      if (fkClientNotifier.value != null) ...[
                        Center(
                          child: AppElevatedButton(
                            text: 'ملف العميل',
                            onPressed: () {
                              AppNavigator.go(
                                ClientProfile(
                                  idClient: fkClientNotifier.value!,
                                ),
                                name: AppRoutesNames.clientProfile.inAddTicket,
                                pathParameters: {
                                  'idClient': fkClientNotifier.value!,
                                },
                              );
                            },
                          ),
                        ),
                      ],
                      10.height,
                      AppText('نوع المشكلة*'),
                      5.height,
                      Consumer<ClientTypeProvider>(
                        builder: (context, cart, child) {
                          return CustomDropDown<String>(
                            hint: 'نوع المشكلة',
                            items: cart.type_of_out.map((e) {
                              return e.nameReason;
                            }).toList(),
                            itemAsString: (nameReason) => nameReason!,
                            selectedItem: cart.selectedValueOut,
                            onChanged: (value) {
                              cart.changevalueOut(value!);
                            },
                          );
                        },
                      ),
                      10.height,
                      AppText('مصدر التذكرة'),
                      5.height,
                      CustomDropDown<String>(
                        hint: 'مصدر التذكرة',
                        items: TicketSourceEnum.values
                            .where((e) => e != TicketSourceEnum.location)
                            .map((e) => e.value)
                            .toList(),
                        itemAsString: (nameReason) => nameReason!,
                        selectedItem: ticketSource?.value,
                        onChanged: (value) {
                          ticketSource = TicketSourceEnum.fromString(
                            value.toString(),
                          );
                        },
                      ),
                      10.height,
                      AppText('وصف المشكلة'),
                      5.height,
                      AppTextField(
                        hintText: 'وصف المشكلة',
                        controller: problem_desc,
                        maxLines: 4,
                        validator: InputValidator.requiredFiled,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      SizedBox(height: 15),
                      BlocConsumer<AddTicketCubit, AddTicketState>(
                        listener: (context, state) {
                          if (state is AddTicketSuccess) {
                            context.read<TicketsCubit>().getTickets();
                          } else if (state is AddTicketError) {
                            AppSnackbar.showSnakeBar(
                              state.message,
                              color: ToastColorsEnum.error,
                            );
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
                                    if (fkClientNotifier.value == null) {
                                      AppSnackbar.showSnakeBar(
                                        'من فضلك اختر عميل',
                                      );
                                      return;
                                    }
                                    await addTicketCubit.addTicket(
                                      AddTicketParams(
                                        fkClient: fkClientNotifier.value!,
                                        typeProblem:
                                            Provider.of<ClientTypeProvider>(
                                                    context,
                                                    listen: false)
                                                .selectedValueOut
                                                .toString(),
                                        detailsProblem: problem_desc.text,
                                        ticketSource: ticketSource?.value ?? '',
                                        clientType: '0',
                                        notes: '',
                                      ),
                                    );
                                    AppNavigator.pop();
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

  @override
  void dispose() {
    problem_desc.dispose();

    super.dispose();
  }
}
