class HomeStatisticsModel {
  final int projects;
  final int clients;
  final int tasks;
  final double income;
  final double expenses;
  final double profit;
  final double openTasksProgress;
  final double openTicketsProgress;
  final String openTasksLabel;
  final String openTicketsLabel;

  HomeStatisticsModel({
    this.projects = 0,
    this.clients = 0,
    this.tasks = 0,
    this.income = 0.0,
    this.expenses = 0.0,
    this.profit = 0.0,
    this.openTasksProgress = 0.5,
    this.openTicketsProgress = 0.15,
    this.openTasksLabel = '0/0',
    this.openTicketsLabel = '0/0',
  });

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) {
    return HomeStatisticsModel(
      projects: json['projects'] ?? 0,
      clients: json['clients'] ?? 0,
      tasks: json['tasks'] ?? 0,
      income: double.tryParse('${json['income']}') ?? 0.0,
      expenses: double.tryParse('${json['expenses']}') ?? 0.0,
      profit: double.tryParse('${json['profit']}') ?? 0.0,
      openTasksProgress:
          double.tryParse('${json['open_tasks_progress']}') ?? 0.5,
      openTicketsProgress:
          double.tryParse('${json['open_tickets_progress']}') ?? 0.15,
      openTasksLabel: json['open_tasks_label'] ?? '0/0',
      openTicketsLabel: json['open_tickets_label'] ?? '0/0',
    );
  }

  factory HomeStatisticsModel.mock() {
    return HomeStatisticsModel(
      projects: 12,
      clients: 45,
      tasks: 23,
      income: 25000,
      expenses: 15000,
      profit: 10000,
      openTasksProgress: 0.66,
      openTicketsProgress: 0.15,
      openTasksLabel: '2/3',
      openTicketsLabel: '-166/29',
    );
  }
}
