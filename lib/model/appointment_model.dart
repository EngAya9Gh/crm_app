import 'agent_distributor_model.dart';
import 'calendar/event_model.dart';

class AppointmentModel {
  final String? idClientsDate;
  final DateTime? dateClientVisit;
  final String? fkUser;
  final String? isDone;
  final String? fkClient;
  final String? fkInvoice;
  final String? typeDate;
  final String? processReason;
  final String? userIdProcess;
  final String? fkAgent;
  final String? nameEnterprise;
  final String? nameAgent;
  final String? nameCity;
  final String? nameUserAdd;
  final String? nameUserUpdate;
  final AgentDistributorModel? agent;

  final DateTime? from;
  final DateTime? to;

  const AppointmentModel({
    this.idClientsDate,
    this.dateClientVisit,
    this.fkUser,
    this.isDone,
    this.fkClient,
    this.fkInvoice,
    this.typeDate,
    this.processReason,
    this.userIdProcess,
    this.fkAgent,
    this.nameEnterprise,
    this.nameAgent,
    this.nameCity,
    this.nameUserAdd,
    this.nameUserUpdate,
    this.agent,
    this.to,
    this.from,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> map) {
    final AgentDistributorModel? agent = map['agent'] == null
        ? null
        : AgentDistributorModel.fromJson(map['agent']);
    return AppointmentModel(
      idClientsDate: map['idclients_date'],
      dateClientVisit: DateTime.tryParse(map['date_client_visit']),
      fkUser: map['fk_user'].toString(),
      isDone: map['is_done'].toString(),
      fkClient: map['fk_client'],
      fkInvoice: map['fk_invoice'],
      typeDate: map['type_date'].toString(),
      processReason: map['processReason'],
      userIdProcess: map['user_id_process'].toString(),
      fkAgent: map['fk_agent'].toString(),
      nameEnterprise: map['name_enterprise'],
      nameAgent: map['name_agent'],
      nameCity: map['name_city'],
      nameUserAdd: map['nameUserAdd'],
      nameUserUpdate: map['nameUserUpdate'],
      agent: agent,
    );
  }

  EventModel asEvent() {
    DateTime first = dateClientVisit!.hour >= 21
        ? dateClientVisit!.subtract(Duration(hours: 3))
        : dateClientVisit!;
    DateTime last = first.add(Duration(hours: 2));

    return EventModel(
      fkIdClient: fkClient == null ? '' : fkClient.toString(),
      idinvoice: fkInvoice == null ? '' : fkInvoice.toString(),
      title: nameEnterprise == null
          ? nameAgent.toString() + ' وكيل/موزع '
          : nameEnterprise.toString(),
      description: 'description',
      isDone: isDone,
      idClientsDate: idClientsDate,
      agentName: nameAgent,
      agent: agent,
      from: first,
      to: last,
    );
  }
}
