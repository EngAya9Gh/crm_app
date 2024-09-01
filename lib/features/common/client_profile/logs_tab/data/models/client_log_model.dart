class ClientDayLogsModel {
  final String date;
  final List<ClientLogModel> logs;

  const ClientDayLogsModel({
    required this.date,
    required this.logs,
  });

  factory ClientDayLogsModel.fromJson(Map<String, dynamic> json) {
    return ClientDayLogsModel(
      date: json['date'],
      logs: (json['logs'] as List)
          .map((log) => ClientLogModel.fromJson(log))
          .toList(),
    );
  }
}

class ClientLogModel {
  final String id;
  final String clientId;
  final String log;
  final String date;

  const ClientLogModel({
    required this.id,
    required this.clientId,
    required this.log,
    required this.date,
  });

  factory ClientLogModel.fromJson(Map<String, dynamic> json) {
    return ClientLogModel(
      id: json['id'],
      clientId: json['clientId'],
      log: json['log'],
      date: json['date'],
    );
  }
}
