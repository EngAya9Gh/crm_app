import 'agent_distributor_model.dart';
import 'calendar/event_model.dart';

class AppointmentModel {
  final String? idClientsDate;
  final DateTime? dateClientVisit;
  final DateTime? dateEnd;
  final String? fkUser;
  final String? isDone;
  final String? fkClient;
  final String? fkInvoice;
  final String? typeDate;
  final String? processReason;
  final String? userIdProcess;
  final String? fkAgent;
  final String? type_agent;
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
    this.dateEnd,
    this.fkUser,
    this.isDone,
    this.fkClient,
    this.fkInvoice,
    this.typeDate,
    this.processReason,
    this.userIdProcess,
    this.fkAgent,
    this.type_agent,
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
      dateEnd:
          map['date_end'] == null ? null : DateTime.tryParse(map['date_end']),
      fkUser: map['fk_user'].toString(),
      isDone: map['is_done'].toString(),
      fkClient: map['fk_client'],
      fkInvoice: map['fk_invoice'],
      typeDate: map['type_date'].toString(),
      processReason: map['processReason'],
      userIdProcess: map['user_id_process'].toString(),
      fkAgent: map['fk_agent'].toString(),
      type_agent: map['type_agent'].toString(),
      nameEnterprise: map['name_enterprise'],
      nameAgent: map['name_agent'],
      nameCity: map['name_city'],
      nameUserAdd: map['nameUserAdd'],
      nameUserUpdate: map['nameUserUpdate'],
      agent: agent,
    );
  }

  EventModel asEvent() {
    DateTime first = dateClientVisit!;
    // dateClientVisit!.hour >= 21
    //     ? dateClientVisit!.subtract(Duration(hours: 3))
    //     : dateClientVisit!;
    DateTime last = dateEnd == null ? first.add(Duration(hours: 2)) : dateEnd!;
    String agenttitle = type_agent.toString() == '1' ? ' وكيل ' : ' موزع ';
    return EventModel(
      fkUser: fkUser,
      fkIdClient: fkClient == null ? '' : fkClient.toString(),
      idinvoice: fkInvoice == null ? '' : fkInvoice.toString(),
      title: nameEnterprise == null
          ? nameAgent.toString() + agenttitle
          : nameEnterprise.toString(),
      description: 'description',
      isDone: isDone,
      idClientsDate: idClientsDate,
      agentName: nameAgent,
      agent: agent,
      from: first,
      to: last,
      typedate: typeDate.toString(),
    );
  }
}
