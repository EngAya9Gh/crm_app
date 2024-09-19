import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../features/clients_care/clients_tickets/data/models/ticket_model.dart';
import '../../../../features/clients_care/clients_tickets/presentation/pages/transfer_client_page.dart';
import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../view_model/ticket_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/card_row.dart';
import '../../client/client_profile.dart';

class TicketView extends StatefulWidget {
  const TicketView({
    this.type,
    required this.ticketModel,
    Key? key,
  }) : super(key: key);
  final String? type;
  final TicketModel ticketModel;

  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 14),
      // child:
      // ContainerShadows (
      //   margin: EdgeInsets.all(2),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              CardRow(
                  title: 'حالة التذكرة',
                  value: widget.ticketModel.typeTicket.toString()),

              //////////////////////////////////////////////////
              widget.ticketModel.dateClose != null
                  ? CardRow(
                      title: 'قام بإغلاق التذكرة ',
                      value: (widget.ticketModel.fkUserClose))
                  : Container(),

              widget.ticketModel.dateClose != null
                  ? CardRow(
                      title: 'تاريخ إغلاق التذكرة ',
                      value: widget.ticketModel.dateClose.toString())
                  : Container(),

              widget.ticketModel.dateRecive != null
                  ? CardRow(
                      title: 'قام باستلام التذكرة ',
                      value: (widget.ticketModel.fkUserRecive.toString()))
                  : Container(),
              widget.ticketModel.dateRecive != null
                  ? CardRow(
                      title: 'تاريخ استلام التذكرة ',
                      value: widget.ticketModel.dateRecive.toString())
                  : Container(),

              CardRow(
                  title: 'قام بفتح التذكرة ',
                  value: (widget.ticketModel.fkUserOpen.toString())),
              CardRow(
                  title: 'تاريخ فتح التذكرة ',
                  value: widget.ticketModel.dateOpen.toString()),
              CardRow(
                  title: 'نوع التذكرة',
                  value: widget.ticketModel.typeProblem.toString()),
              //cardRow(title: 'وصف المشكلة',value: widget.ticketModel.detailsProblem.toString(),isExpanded: true,),
              CardRow(
                title: 'تفاصيل التذكرة',
                value: widget.ticketModel.detailsProblem.toString(),
                isExpanded: true,
              ),
              SizedBox(height: 10),
              CardRow(
                title: 'الفئات',
                value: widget.ticketModel.categoriesTicketFk
                    ?.map((e) => e.categoryAr)
                    .join(', '),
                isExpanded: true,
              ),
              CardRow(
                title: 'الفئات الفرعية',
                value: widget.ticketModel.subcategoriesTicketFk
                    ?.map((e) => e.subCategoryAr)
                    .join(', '),
                isExpanded: true,
              ),
              widget.type == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.ticketModel.dateRecive == null
                            ? context
                                        .read<PrivilegesCubit>()
                                        .checkPrivilege('71') ==
                                    true
                                ? Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.primaryMain)),
                                          onPressed: () async {
                                            Provider.of<TicketVM>(context,
                                                    listen: false)
                                                .updateTicketvm({
                                              'fk_user_recive':
                                                  Provider.of<UserProvider>(
                                                          context,
                                                          listen: false)
                                                      .currentUser
                                                      .idUser
                                                      .toString(),
                                              'date_recive':
                                                  DateTime.now().toString(),
                                              'type_ticket': 'قيد التنفيذ'
                                            }, widget.ticketModel.idTicket);
                                          },
                                          child: Text('استلام التذكرة')),
                                    ),
                                  )
                                : widget.ticketModel.dateClose == null
                                    ? context
                                            .read<PrivilegesCubit>()
                                            .checkPrivilege('72')
                                        ? //regoin
                                        Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(AppColors
                                                                  .primaryMain)),
                                                  onPressed: () async {
                                                    Provider.of<TicketVM>(
                                                            context,
                                                            listen: false)
                                                        .updateTicketvm(
                                                            {
                                                          'fk_user_close':
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .currentUser
                                                                  .idUser
                                                                  .toString(),
                                                          'date_close':
                                                              DateTime.now()
                                                                  .toString(),
                                                          'type_ticket':
                                                              'مغلقة',
                                                          // 'fk_regoin':widget.ticketModel.,
                                                          'fk_client': widget
                                                              .ticketModel
                                                              .fkClient
                                                              .toString(),

                                                          // 'fkcountry': widget
                                                          //     .ticketModel
                                                          //     .fk_country
                                                          //     .toString(),
                                                          'name_enterprise':
                                                              widget.ticketModel
                                                                  .nameEnterprise
                                                                  .toString(),
                                                          'nameUser': Provider
                                                                  .of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .currentUser
                                                              .nameUser
                                                              .toString(),
                                                        },
                                                            widget.ticketModel
                                                                .idTicket);
                                                  },
                                                  child: Text('اغلاق التذكرة')),
                                            ),
                                          )
                                        : Container()
                                    : Container()
                            : Container(),
                        widget.ticketModel.dateRecive != null &&
                                widget.ticketModel.dateClose == null
                            ? context
                                        .read<PrivilegesCubit>()
                                        .checkPrivilege('75') ==
                                    true
                                ? Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.primaryMain)),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      TransferClientPage(
                                                        nameEnterprise: widget
                                                            .ticketModel
                                                            .nameEnterprise
                                                            .toString(),
                                                        idClient: widget
                                                            .ticketModel
                                                            .fkClient
                                                            .toString(),
                                                        idTicket: widget
                                                            .ticketModel
                                                            .idTicket,
                                                        type: "ticket",
                                                      ),
                                                  fullscreenDialog: true));
                                        },
                                        child: Text('تحويل التذكرة'),
                                      ),
                                    ),
                                  )
                                : Container()
                            : Container(),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primaryMain)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ClientProfile(
                                            idClient: widget
                                                .ticketModel.fkClient
                                                .toString(),
                                          )));
                            },
                            child: Text('ملف العميل'),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
