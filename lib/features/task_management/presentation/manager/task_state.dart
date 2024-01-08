part of 'task_cubit.dart';

@immutable
class TaskState {
  const TaskState({
    this.selectedAssignTo,
    this.selectedParticipant,
    this.startDate,
    this.deadLineDate,
    this.attachmentFile,
    this.selectedRecurringType,
    this.isRecurring,
    this.selectedStatus,
    this.filterToDate,
    this.filterFromDate,
    this.filterAssignFrom,
    this.filterAssignTo,
    this.departmentFrom,
    this.departmentTo,
    this.regionFrom,
    this.regionTo,
    this.tasksList = const [],
    this.tasksState = const PageState.init(),
    this.addTaskStatus = const BlocStatus.initial(),
    this.changeTaskStatus = const BlocStatus.initial(),
    this.selectedAssignedToType,
    this.myBranch,
    this.myDepartment,
    this.myTasks,
  });

  final UserRegionDepartment? selectedAssignTo;
  final List<UserModel>? selectedParticipant;
  final DateTime? startDate;
  final DateTime? deadLineDate;
  final File? attachmentFile;
  final RecurringType? selectedRecurringType;
  final bool? isRecurring;
  final BlocStatus addTaskStatus;
  final PageState<List<TaskModel>> tasksState;
  final List<TaskModel> tasksList;
  final TaskStatusType? selectedStatus;
  final UserRegionDepartment? filterAssignFrom;
  final UserRegionDepartment? filterAssignTo;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;
  final ManageModel? departmentFrom;
  final ManageModel? departmentTo;
  final RegionModel? regionFrom;
  final RegionModel? regionTo;
  final BlocStatus changeTaskStatus;
  final AssignedToType? selectedAssignedToType;
  final String? myTasks;
  final String? myDepartment;
  final String? myBranch;

  TaskState copyWith({
    UserRegionDepartment? selectedAssignTo,
    List<UserModel>? selectedParticipant,
    DateTime? startDate,
    DateTime? deadLineDate,
    File? attachmentFile,
    RecurringType? selectedRecurringType,
    bool? isRecurring,
    BlocStatus? addTaskStatus,
    BlocStatus? changeTaskStatus,
    bool isResetAddTask = false,
    PageState<List<TaskModel>>? tasksState,
    List<TaskModel>? tasksList,
    Nullable<TaskStatusType?>? selectedStatus,
    Nullable<UserRegionDepartment?>? filterAssignFrom,
    Nullable<UserRegionDepartment?>? filterAssignTo,
    Nullable<DateTime?>? filterFromDate,
    Nullable<DateTime?>? filterToDate,
    final Nullable<ManageModel?>? departmentFrom,
    final Nullable<ManageModel?>? departmentTo,
    final Nullable<RegionModel?>? regionFrom,
    final Nullable<RegionModel?>? regionTo,
    final Nullable<AssignedToType?>? selectedAssignedToType,
    final Nullable<String?>? myTasks,
    final Nullable<String?>? myDepartment,
    final Nullable<String?>? myBranch,
    bool isResetTasksState = false,
  }) {
    return TaskState(
      selectedAssignTo: isResetAddTask ? null : selectedAssignTo ?? this.selectedAssignTo,
      selectedParticipant: isResetAddTask ? null : selectedParticipant ?? this.selectedParticipant,
      selectedAssignedToType: isResetAddTask
          ? null
          : selectedAssignedToType?.value != null
              ? selectedAssignedToType?.value
              : this.selectedAssignedToType,
      startDate: isResetAddTask ? null : startDate ?? this.startDate,
      deadLineDate: isResetAddTask ? null : deadLineDate ?? this.deadLineDate,
      attachmentFile: isResetAddTask ? null : attachmentFile ?? this.attachmentFile,
      selectedRecurringType: isResetAddTask ? null : selectedRecurringType ?? this.selectedRecurringType,
      isRecurring: isResetAddTask ? null : isRecurring ?? this.isRecurring,
      addTaskStatus: isResetAddTask ? const BlocStatus.initial() : addTaskStatus ?? this.addTaskStatus,
      tasksState: tasksState ?? this.tasksState,
      tasksList: tasksList ?? this.tasksList,
      changeTaskStatus: changeTaskStatus ?? this.changeTaskStatus,
      selectedStatus: selectedStatus != null ? selectedStatus.value : this.selectedStatus,
      filterAssignTo: isResetTasksState
          ? null
          : filterAssignTo != null
              ? filterAssignTo.value
              : this.filterAssignTo,
      filterFromDate: isResetTasksState
          ? null
          : filterFromDate != null
              ? filterFromDate.value
              : this.filterFromDate,
      filterAssignFrom: isResetTasksState
          ? null
          : filterAssignFrom != null
              ? filterAssignFrom.value
              : this.filterAssignFrom,
      filterToDate: isResetTasksState
          ? null
          : filterToDate != null
              ? filterToDate.value
              : this.filterToDate,
      regionFrom: isResetTasksState
          ? null
          : regionFrom != null
              ? regionFrom.value
              : this.regionFrom,
      regionTo: isResetTasksState
          ? null
          : regionTo != null
              ? regionTo.value
              : this.regionTo,
      departmentFrom: isResetTasksState
          ? null
          : departmentFrom != null
              ? departmentFrom.value
              : this.departmentFrom,
      departmentTo: isResetTasksState
          ? null
          : departmentTo != null
              ? departmentTo.value
              : this.departmentTo,
      myDepartment: myDepartment != null
          ? myDepartment.value
          : this.myDepartment,
      myBranch: myBranch != null
          ? myBranch.value
          : this.myBranch,
      myTasks: myTasks != null
          ? myTasks.value
          : this.myTasks,

    );
  }
}

enum TaskStatusType {
  Open,
  receive,
  Completed,
  Evaluated,
  // Testing,
  // InProgress,
  // InReview,
  // Rejected,
  // Blocked,
  // Closed,
}

extension TaskStatusExt on TaskStatusType {
  String get text {
    switch (this) {
      case TaskStatusType.Open:
        return "مفتوحة";
      case TaskStatusType.Evaluated:
        return "تم التقييم";
      case TaskStatusType.Completed:
        return "مكتملة";
      case TaskStatusType.receive:
        return "مستلمة";
    }
  }

  Color get color {
    switch (this) {
      case TaskStatusType.Open:
        return Colors.grey;
      case TaskStatusType.receive:
        return Colors.orange;
      case TaskStatusType.Evaluated:
        return Colors.green;
      case TaskStatusType.Completed:
        return Colors.indigoAccent;
    }
  }

  TaskStatusType get next {
    switch (this) {
      case TaskStatusType.Open:
        return TaskStatusType.receive;
      case TaskStatusType.receive:
        return TaskStatusType.Completed;
      case TaskStatusType.Completed:
        return TaskStatusType.Evaluated;
      case TaskStatusType.Evaluated:
        return TaskStatusType.Evaluated;
    }
  }

  int get id {
    switch (this) {
      case TaskStatusType.Open:
        return 1;
      case TaskStatusType.receive:
        return 8;
      case TaskStatusType.Completed:
        return 4;
      case TaskStatusType.Evaluated:
        return 11;
    }
  }
}

const clientPublicTypeList = [
  PublicType.updateClient,
  PublicType.transferClient,
  PublicType.other,
];

const invoicePublicTypeList = [
  PublicType.updateInvoice,
  PublicType.changeDataInvoice,
  PublicType.transferToWithdrawal,
  PublicType.deleteInvoice,
  PublicType.attachment,
  PublicType.addPayment,
  PublicType.other
];

const commentPublicTypeList = [
  PublicType.addComment,
  PublicType.linkComment,
  PublicType.other,
];

const supportPublicTypeList = [
  PublicType.cancelSuspendClient,
  PublicType.suspendClient,
  PublicType.doneInstall,
  PublicType.reScheduleClient,
  PublicType.other,
];

const carePublicTypeList = [
  PublicType.contactClient,
  PublicType.updateCommunicationCard,
  PublicType.other,
];

const ticketPublicTypeList = [
  PublicType.addTicket,
  PublicType.closeTicket,
  PublicType.receiveTicket,
  PublicType.rateTicket,
  PublicType.other
];

enum PublicType {
  ///client
  updateClient,
  transferClient,

  ///invoice
  updateInvoice,
  changeDataInvoice,
  transferToWithdrawal,
  deleteInvoice,
  attachment,
  addPayment,

  ///Comment
  addComment,
  linkComment,

  ///Support
  reScheduleClient,
  cancelSuspendClient,
  suspendClient,
  doneInstall,

  ///Care
  contactClient,
  updateCommunicationCard,

  ///Ticket
  addTicket,
  receiveTicket,
  closeTicket,
  rateTicket,
  other,
}

extension PublicTypeExt on PublicType {
  String get text {
    switch (this) {
      case PublicType.updateClient:
        return 'تعديل العميل';
      case PublicType.transferClient:
        return 'تحويل العميل';
      case PublicType.updateInvoice:
        return 'تعديل الفاتورة';
      case PublicType.changeDataInvoice:
        return 'تغيير بيانات الفاتورة';
      case PublicType.transferToWithdrawal:
        return 'تحويل إلى منسحبة';
      case PublicType.deleteInvoice:
        return 'حذف الفاتورة';
      case PublicType.attachment:
        return 'مرفقات الفاتورة';
      case PublicType.addPayment:
        return 'اضافة دفعة';
      case PublicType.addComment:
        return 'اضافة تعليق';
      case PublicType.linkComment:
        return 'ربط التعليق بمهمة';
      case PublicType.reScheduleClient:
        return 'جدولة الزيارة';
      case PublicType.cancelSuspendClient:
        return 'إلغاء تعليق العميل';
      case PublicType.suspendClient:
        return 'تعليق العميل';
      case PublicType.doneInstall:
        return 'تم التركيب';
      case PublicType.contactClient:
        return 'التواصل مع العميل';
      case PublicType.updateCommunicationCard:
        return 'تعديل التواصل';
      case PublicType.addTicket:
        return 'اضافة تذكرة';
      case PublicType.receiveTicket:
        return 'استلام تذكرة';
      case PublicType.closeTicket:
        return 'اغلاق تذكرة';
      case PublicType.rateTicket:
        return 'تقييم تذكرة';
      case PublicType.other:
        return 'آخرى';
    }
  }

  String get value {
    switch (this) {
      case PublicType.updateClient:
        return 'update client';
      case PublicType.transferClient:
        return 'transfer client';
      case PublicType.updateInvoice:
        return 'update invoice';
      case PublicType.changeDataInvoice:
        return 'change data invoice';
      case PublicType.transferToWithdrawal:
        return 'transfer_to_withdraw';
      case PublicType.deleteInvoice:
       return 'delete invoice';
      case PublicType.attachment:
       return 'attachment';
      case PublicType.addPayment:
       return 'add payment';
      case PublicType.addComment:
        return 'add comment';
      case PublicType.linkComment:
        return 'linkComment';
      case PublicType.reScheduleClient:
        return 'reschdule client';
      case PublicType.cancelSuspendClient:
        return 'cancel suspend client';
      case PublicType.suspendClient:
        return 'suspend client';
      case PublicType.doneInstall:
        return 'doneInstall';
      case PublicType.contactClient:
        return 'contact client';
      case PublicType.updateCommunicationCard:
        return 'update communication card';
      case PublicType.addTicket:
        return 'add ticket';
      case PublicType.receiveTicket:
        return 'recive ticket';
      case PublicType.closeTicket:
        return 'close ticket';
      case PublicType.rateTicket:
        return 'rateTicket';
      case PublicType.other:
       return 'other';
    }
  }
}
