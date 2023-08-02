import 'package:crm_smart/model/calendar/event.dart';

class AppointmentModel {
  final String? idClientsDate;
  final String? fkUser;
  final DateTime? dateClientVisit;
  final DateTime? from;
  final DateTime? to;
  final bool? isDone;
  final String? fkClient;
  final String? fkInvoice;
  final String? nameEnterprise;

  const AppointmentModel({
    this.idClientsDate,
    this.fkUser,
    this.dateClientVisit,
    this.isDone,
    this.fkClient,
    this.fkInvoice,
    this.nameEnterprise,
    this.to,
    this.from,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> map) {
    return AppointmentModel(
      idClientsDate: map['idclients_date'],
      fkUser: map['fk_user'],
      dateClientVisit: DateTime.tryParse(map['date_client_visit']),
      isDone: map['is_done'] == '1',
      fkClient: map['fk_client'],
      fkInvoice: map['fk_invoice'],
      nameEnterprise: map['name_enterprise'],
    );
  }

  Event asEvent() {
    DateTime first = dateClientVisit!.hour >= 21 ? dateClientVisit!.subtract(Duration(hours: 3)) : dateClientVisit!;
    DateTime last = first.add(Duration(hours: 2));

    return Event(
      fkIdClient: fkClient,
      idinvoice: fkInvoice,
      title: nameEnterprise!,
      description: 'description',
      from: first,
      to: last,
      isDone: isDone,
      idClientsDate: idClientsDate,
    );
  }
}
