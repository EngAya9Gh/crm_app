
class HomeStatisticsModel {
  final int? dailyClients;
  final int? notDoneVisits;
  final int? dailyNotDoneVisits;
  final int? tasks;
  final num? dailySales;
  final num? monthlySales;
  final num? monthlyWithdrawLosses;
  final int? monthlyNoWithdraw;
  final num? openTasksProgress;
  final num? openTicketsProgress;
  final num? notDoneVisitsProgress;
  final String? notDoneVisitsLabel;
  final String? openTasksLabel;
  final String? openTicketsLabel;
  final num? approveCount;
  final num? waitingFrequent;
  final num? waitingInstall1;
  final num? waitingInstall2;
  final num? waitingWelcome;

  HomeStatisticsModel({
    this.dailyClients,
    this.notDoneVisits,
    this.dailyNotDoneVisits,
    this.tasks,
    this.dailySales,
    this.monthlySales,
    this.monthlyWithdrawLosses,
    this.monthlyNoWithdraw,
    this.openTasksProgress,
    this.openTicketsProgress,
    this.notDoneVisitsProgress,
    this.notDoneVisitsLabel,
    this.openTasksLabel,
    this.openTicketsLabel,
    this.approveCount,
    this.waitingFrequent,
    this.waitingInstall1,
    this.waitingInstall2,
    this.waitingWelcome,
  });

  HomeStatisticsModel copyWith({
    int? dailyClients,
    int? notDoneVisits,
    int? dailyNotDoneVisits,
    int? tasks,
    num? dailySales,
    num? monthlySales,
    num? monthlyWithdrawLosses,
    int? monthlyNoWithdraw,
    num? openTasksProgress,
    num? openTicketsProgress,
    num? notDoneVisitsProgress,
    String? notDoneVisitsLabel,
    String? openTasksLabel,
    String? openTicketsLabel,
    num? approveCount,
    num? waitingFrequent,
    num? waitingInstall1,
    num? waitingInstall2,
    num? waitingWelcome,
  }) =>
      HomeStatisticsModel(
        dailyClients: dailyClients ?? this.dailyClients,
        notDoneVisits: notDoneVisits ?? this.notDoneVisits,
        dailyNotDoneVisits: dailyNotDoneVisits ?? this.dailyNotDoneVisits,
        tasks: tasks ?? this.tasks,
        dailySales: dailySales ?? this.dailySales,
        monthlySales: monthlySales ?? this.monthlySales,
        monthlyWithdrawLosses: monthlyWithdrawLosses ?? this.monthlyWithdrawLosses,
        monthlyNoWithdraw: monthlyNoWithdraw ?? this.monthlyNoWithdraw,
        openTasksProgress: openTasksProgress ?? this.openTasksProgress,
        openTicketsProgress: openTicketsProgress ?? this.openTicketsProgress,
        notDoneVisitsProgress: notDoneVisitsProgress ?? this.notDoneVisitsProgress,
        notDoneVisitsLabel: notDoneVisitsLabel ?? this.notDoneVisitsLabel,
        openTasksLabel: openTasksLabel ?? this.openTasksLabel,
        openTicketsLabel: openTicketsLabel ?? this.openTicketsLabel,
        approveCount: approveCount ?? this.approveCount,
        waitingFrequent: waitingFrequent ?? this.waitingFrequent,
        waitingInstall1: waitingInstall1 ?? this.waitingInstall1,
        waitingInstall2: waitingInstall2 ?? this.waitingInstall2,
        waitingWelcome: waitingWelcome ?? this.waitingWelcome,
      );

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) => HomeStatisticsModel(
        dailyClients: json["daily_clients"],
        notDoneVisits: json["not_done_visits"],
        dailyNotDoneVisits: json["daily_not_done_visits"],
        tasks: json["tasks"].toInt(),
        dailySales: json["daily_sales"],
        monthlySales: json["monthly_sales"]?.toDouble(),
        monthlyWithdrawLosses: json["monthly_withdraw_losses"],
        monthlyNoWithdraw: json["monthly_no_withdraw"],
        openTasksProgress: json["open_tasks_progress"]?.toDouble(),
        openTicketsProgress: json["open_tickets_progress"]?.toDouble(),
        notDoneVisitsProgress: json["not_done_visits_progress"],
        notDoneVisitsLabel: json["not_done_visits_label"],
        openTasksLabel: json["open_tasks_label"],
        openTicketsLabel: json["open_tickets_label"],
        approveCount: json["approve_count"],
        waitingFrequent: json["waiting_frequent"],
        waitingInstall1: json["waiting_install1"],
        waitingInstall2: json["waiting_install2"],
        waitingWelcome: json["waiting_welcome"],
      );

  Map<String, dynamic> toJson() => {
        "daily_clients": dailyClients,
        "not_done_visits": notDoneVisits,
        "daily_not_done_visits": dailyNotDoneVisits,
        "tasks": tasks,
        "daily_sales": dailySales,
        "monthly_sales": monthlySales,
        "monthly_withdraw_losses": monthlyWithdrawLosses,
        "monthly_no_withdraw": monthlyNoWithdraw,
        "open_tasks_progress": openTasksProgress,
        "open_tickets_progress": openTicketsProgress,
        "not_done_visits_progress": notDoneVisitsProgress,
        "not_done_visits_label": notDoneVisitsLabel,
        "open_tasks_label": openTasksLabel,
        "open_tickets_label": openTicketsLabel,
        "approve_count": approveCount,
        "waiting_frequent": waitingFrequent,
        "waiting_install1": waitingInstall1,
        "waiting_install2": waitingInstall2,
        "waiting_welcome": waitingWelcome,
      };
}
