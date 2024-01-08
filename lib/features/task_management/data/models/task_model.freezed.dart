// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @JsonKey(name: "id")
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  dynamic get description => throw _privateConstructorUsedError;
  @JsonKey(name: "public_Type")
  String? get publicType => throw _privateConstructorUsedError;
  @JsonKey(name: "main_type_task")
  dynamic get mainTypeTask => throw _privateConstructorUsedError;
  @JsonKey(name: "recive_date")
  dynamic get reciveDate => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "deadline")
  dynamic get deadline => throw _privateConstructorUsedError;
  @JsonKey(name: "actual_delivery_date")
  dynamic get actualDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: "hours")
  dynamic get hours => throw _privateConstructorUsedError;
  @JsonKey(name: "completion_percentage")
  dynamic get completionPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "recurring")
  dynamic get recurring => throw _privateConstructorUsedError;
  @JsonKey(name: "recurring_type")
  dynamic get recurringType => throw _privateConstructorUsedError;
  @JsonKey(name: "Number_Of_Recurring")
  dynamic get numberOfRecurring => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  dynamic get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  dynamic get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "dateTimeCreated")
  DateTime? get dateTimeCreated => throw _privateConstructorUsedError;
  @JsonKey(name: "changed_date")
  dynamic get changedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "task_statuse_id")
  dynamic get taskStatuseId => throw _privateConstructorUsedError;
  @JsonKey(name: "changed_by")
  dynamic get changedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  dynamic get type => throw _privateConstructorUsedError;
  @JsonKey(name: "priority")
  dynamic get priority => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "assigned_by_name")
  String? get assignedByName => throw _privateConstructorUsedError;
  @JsonKey(name: "assigend_department_from_name")
  String? get assigendDepartmentFromName => throw _privateConstructorUsedError;
  @JsonKey(name: "assigend_department_to_name")
  String? get assigendDepartmentToName => throw _privateConstructorUsedError;
  @JsonKey(name: "assigend_region_from")
  String? get assigendRegionFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "assigend_region_to")
  String? get assigendRegionTo => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "name_regoin")
  String? get nameRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "task_statuses")
  List<TaskStatus>? get taskStatuses => throw _privateConstructorUsedError;
  @JsonKey(name: "assignedByUser")
  AssignedUser? get assignedByUser => throw _privateConstructorUsedError;
  @JsonKey(name: "assignedToUser")
  AssignedUser? get assignedToUser => throw _privateConstructorUsedError;
  @JsonKey(name: "taskGroup")
  TaskGroup? get taskGroup => throw _privateConstructorUsedError;
  @JsonKey(name: "Clients")
  Clients? get clients => throw _privateConstructorUsedError;
  @JsonKey(name: "invoices")
  Invoices? get invoices => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false, required: true)
  BlocStatus get taskBlocStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") dynamic description,
      @JsonKey(name: "public_Type") String? publicType,
      @JsonKey(name: "main_type_task") dynamic mainTypeTask,
      @JsonKey(name: "recive_date") dynamic reciveDate,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "deadline") dynamic deadline,
      @JsonKey(name: "actual_delivery_date") dynamic actualDeliveryDate,
      @JsonKey(name: "hours") dynamic hours,
      @JsonKey(name: "completion_percentage") dynamic completionPercentage,
      @JsonKey(name: "recurring") dynamic recurring,
      @JsonKey(name: "recurring_type") dynamic recurringType,
      @JsonKey(name: "Number_Of_Recurring") dynamic numberOfRecurring,
      @JsonKey(name: "created_at") dynamic createdAt,
      @JsonKey(name: "updated_at") dynamic updatedAt,
      @JsonKey(name: "dateTimeCreated") DateTime? dateTimeCreated,
      @JsonKey(name: "changed_date") dynamic changedDate,
      @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
      @JsonKey(name: "changed_by") dynamic changedBy,
      @JsonKey(name: "type") dynamic type,
      @JsonKey(name: "priority") dynamic priority,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "assigned_by_name") String? assignedByName,
      @JsonKey(name: "assigend_department_from_name")
      String? assigendDepartmentFromName,
      @JsonKey(name: "assigend_department_to_name")
      String? assigendDepartmentToName,
      @JsonKey(name: "assigend_region_from") String? assigendRegionFrom,
      @JsonKey(name: "assigend_region_to") String? assigendRegionTo,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "task_statuses") List<TaskStatus>? taskStatuses,
      @JsonKey(name: "assignedByUser") AssignedUser? assignedByUser,
      @JsonKey(name: "assignedToUser") AssignedUser? assignedToUser,
      @JsonKey(name: "taskGroup") TaskGroup? taskGroup,
      @JsonKey(name: "Clients") Clients? clients,
      @JsonKey(name: "invoices") Invoices? invoices,
      @JsonKey(includeToJson: false, includeFromJson: false, required: true)
      BlocStatus taskBlocStatus});

  $AssignedUserCopyWith<$Res>? get assignedByUser;
  $AssignedUserCopyWith<$Res>? get assignedToUser;
  $TaskGroupCopyWith<$Res>? get taskGroup;
  $ClientsCopyWith<$Res>? get clients;
  $InvoicesCopyWith<$Res>? get invoices;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? publicType = freezed,
    Object? mainTypeTask = freezed,
    Object? reciveDate = freezed,
    Object? startDate = freezed,
    Object? deadline = freezed,
    Object? actualDeliveryDate = freezed,
    Object? hours = freezed,
    Object? completionPercentage = freezed,
    Object? recurring = freezed,
    Object? recurringType = freezed,
    Object? numberOfRecurring = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dateTimeCreated = freezed,
    Object? changedDate = freezed,
    Object? taskStatuseId = freezed,
    Object? changedBy = freezed,
    Object? type = freezed,
    Object? priority = freezed,
    Object? name = freezed,
    Object? assignedByName = freezed,
    Object? assigendDepartmentFromName = freezed,
    Object? assigendDepartmentToName = freezed,
    Object? assigendRegionFrom = freezed,
    Object? assigendRegionTo = freezed,
    Object? createdBy = freezed,
    Object? nameRegoin = freezed,
    Object? taskStatuses = freezed,
    Object? assignedByUser = freezed,
    Object? assignedToUser = freezed,
    Object? taskGroup = freezed,
    Object? clients = freezed,
    Object? invoices = freezed,
    Object? taskBlocStatus = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      publicType: freezed == publicType
          ? _value.publicType
          : publicType // ignore: cast_nullable_to_non_nullable
              as String?,
      mainTypeTask: freezed == mainTypeTask
          ? _value.mainTypeTask
          : mainTypeTask // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reciveDate: freezed == reciveDate
          ? _value.reciveDate
          : reciveDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDeliveryDate: freezed == actualDeliveryDate
          ? _value.actualDeliveryDate
          : actualDeliveryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      completionPercentage: freezed == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recurring: freezed == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recurringType: freezed == recurringType
          ? _value.recurringType
          : recurringType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfRecurring: freezed == numberOfRecurring
          ? _value.numberOfRecurring
          : numberOfRecurring // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateTimeCreated: freezed == dateTimeCreated
          ? _value.dateTimeCreated
          : dateTimeCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      changedDate: freezed == changedDate
          ? _value.changedDate
          : changedDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      taskStatuseId: freezed == taskStatuseId
          ? _value.taskStatuseId
          : taskStatuseId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedByName: freezed == assignedByName
          ? _value.assignedByName
          : assignedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendDepartmentFromName: freezed == assigendDepartmentFromName
          ? _value.assigendDepartmentFromName
          : assigendDepartmentFromName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendDepartmentToName: freezed == assigendDepartmentToName
          ? _value.assigendDepartmentToName
          : assigendDepartmentToName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendRegionFrom: freezed == assigendRegionFrom
          ? _value.assigendRegionFrom
          : assigendRegionFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendRegionTo: freezed == assigendRegionTo
          ? _value.assigendRegionTo
          : assigendRegionTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatuses: freezed == taskStatuses
          ? _value.taskStatuses
          : taskStatuses // ignore: cast_nullable_to_non_nullable
              as List<TaskStatus>?,
      assignedByUser: freezed == assignedByUser
          ? _value.assignedByUser
          : assignedByUser // ignore: cast_nullable_to_non_nullable
              as AssignedUser?,
      assignedToUser: freezed == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as AssignedUser?,
      taskGroup: freezed == taskGroup
          ? _value.taskGroup
          : taskGroup // ignore: cast_nullable_to_non_nullable
              as TaskGroup?,
      clients: freezed == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      taskBlocStatus: null == taskBlocStatus
          ? _value.taskBlocStatus
          : taskBlocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignedUserCopyWith<$Res>? get assignedByUser {
    if (_value.assignedByUser == null) {
      return null;
    }

    return $AssignedUserCopyWith<$Res>(_value.assignedByUser!, (value) {
      return _then(_value.copyWith(assignedByUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignedUserCopyWith<$Res>? get assignedToUser {
    if (_value.assignedToUser == null) {
      return null;
    }

    return $AssignedUserCopyWith<$Res>(_value.assignedToUser!, (value) {
      return _then(_value.copyWith(assignedToUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskGroupCopyWith<$Res>? get taskGroup {
    if (_value.taskGroup == null) {
      return null;
    }

    return $TaskGroupCopyWith<$Res>(_value.taskGroup!, (value) {
      return _then(_value.copyWith(taskGroup: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res>? get clients {
    if (_value.clients == null) {
      return null;
    }

    return $ClientsCopyWith<$Res>(_value.clients!, (value) {
      return _then(_value.copyWith(clients: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoicesCopyWith<$Res>? get invoices {
    if (_value.invoices == null) {
      return null;
    }

    return $InvoicesCopyWith<$Res>(_value.invoices!, (value) {
      return _then(_value.copyWith(invoices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") dynamic description,
      @JsonKey(name: "public_Type") String? publicType,
      @JsonKey(name: "main_type_task") dynamic mainTypeTask,
      @JsonKey(name: "recive_date") dynamic reciveDate,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "deadline") dynamic deadline,
      @JsonKey(name: "actual_delivery_date") dynamic actualDeliveryDate,
      @JsonKey(name: "hours") dynamic hours,
      @JsonKey(name: "completion_percentage") dynamic completionPercentage,
      @JsonKey(name: "recurring") dynamic recurring,
      @JsonKey(name: "recurring_type") dynamic recurringType,
      @JsonKey(name: "Number_Of_Recurring") dynamic numberOfRecurring,
      @JsonKey(name: "created_at") dynamic createdAt,
      @JsonKey(name: "updated_at") dynamic updatedAt,
      @JsonKey(name: "dateTimeCreated") DateTime? dateTimeCreated,
      @JsonKey(name: "changed_date") dynamic changedDate,
      @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
      @JsonKey(name: "changed_by") dynamic changedBy,
      @JsonKey(name: "type") dynamic type,
      @JsonKey(name: "priority") dynamic priority,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "assigned_by_name") String? assignedByName,
      @JsonKey(name: "assigend_department_from_name")
      String? assigendDepartmentFromName,
      @JsonKey(name: "assigend_department_to_name")
      String? assigendDepartmentToName,
      @JsonKey(name: "assigend_region_from") String? assigendRegionFrom,
      @JsonKey(name: "assigend_region_to") String? assigendRegionTo,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "task_statuses") List<TaskStatus>? taskStatuses,
      @JsonKey(name: "assignedByUser") AssignedUser? assignedByUser,
      @JsonKey(name: "assignedToUser") AssignedUser? assignedToUser,
      @JsonKey(name: "taskGroup") TaskGroup? taskGroup,
      @JsonKey(name: "Clients") Clients? clients,
      @JsonKey(name: "invoices") Invoices? invoices,
      @JsonKey(includeToJson: false, includeFromJson: false, required: true)
      BlocStatus taskBlocStatus});

  @override
  $AssignedUserCopyWith<$Res>? get assignedByUser;
  @override
  $AssignedUserCopyWith<$Res>? get assignedToUser;
  @override
  $TaskGroupCopyWith<$Res>? get taskGroup;
  @override
  $ClientsCopyWith<$Res>? get clients;
  @override
  $InvoicesCopyWith<$Res>? get invoices;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? publicType = freezed,
    Object? mainTypeTask = freezed,
    Object? reciveDate = freezed,
    Object? startDate = freezed,
    Object? deadline = freezed,
    Object? actualDeliveryDate = freezed,
    Object? hours = freezed,
    Object? completionPercentage = freezed,
    Object? recurring = freezed,
    Object? recurringType = freezed,
    Object? numberOfRecurring = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dateTimeCreated = freezed,
    Object? changedDate = freezed,
    Object? taskStatuseId = freezed,
    Object? changedBy = freezed,
    Object? type = freezed,
    Object? priority = freezed,
    Object? name = freezed,
    Object? assignedByName = freezed,
    Object? assigendDepartmentFromName = freezed,
    Object? assigendDepartmentToName = freezed,
    Object? assigendRegionFrom = freezed,
    Object? assigendRegionTo = freezed,
    Object? createdBy = freezed,
    Object? nameRegoin = freezed,
    Object? taskStatuses = freezed,
    Object? assignedByUser = freezed,
    Object? assignedToUser = freezed,
    Object? taskGroup = freezed,
    Object? clients = freezed,
    Object? invoices = freezed,
    Object? taskBlocStatus = null,
  }) {
    return _then(_$TaskModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      publicType: freezed == publicType
          ? _value.publicType
          : publicType // ignore: cast_nullable_to_non_nullable
              as String?,
      mainTypeTask: freezed == mainTypeTask
          ? _value.mainTypeTask
          : mainTypeTask // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reciveDate: freezed == reciveDate
          ? _value.reciveDate
          : reciveDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDeliveryDate: freezed == actualDeliveryDate
          ? _value.actualDeliveryDate
          : actualDeliveryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      completionPercentage: freezed == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recurring: freezed == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recurringType: freezed == recurringType
          ? _value.recurringType
          : recurringType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfRecurring: freezed == numberOfRecurring
          ? _value.numberOfRecurring
          : numberOfRecurring // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateTimeCreated: freezed == dateTimeCreated
          ? _value.dateTimeCreated
          : dateTimeCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      changedDate: freezed == changedDate
          ? _value.changedDate
          : changedDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      taskStatuseId: freezed == taskStatuseId
          ? _value.taskStatuseId
          : taskStatuseId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedByName: freezed == assignedByName
          ? _value.assignedByName
          : assignedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendDepartmentFromName: freezed == assigendDepartmentFromName
          ? _value.assigendDepartmentFromName
          : assigendDepartmentFromName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendDepartmentToName: freezed == assigendDepartmentToName
          ? _value.assigendDepartmentToName
          : assigendDepartmentToName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendRegionFrom: freezed == assigendRegionFrom
          ? _value.assigendRegionFrom
          : assigendRegionFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      assigendRegionTo: freezed == assigendRegionTo
          ? _value.assigendRegionTo
          : assigendRegionTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatuses: freezed == taskStatuses
          ? _value._taskStatuses
          : taskStatuses // ignore: cast_nullable_to_non_nullable
              as List<TaskStatus>?,
      assignedByUser: freezed == assignedByUser
          ? _value.assignedByUser
          : assignedByUser // ignore: cast_nullable_to_non_nullable
              as AssignedUser?,
      assignedToUser: freezed == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as AssignedUser?,
      taskGroup: freezed == taskGroup
          ? _value.taskGroup
          : taskGroup // ignore: cast_nullable_to_non_nullable
              as TaskGroup?,
      clients: freezed == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      taskBlocStatus: null == taskBlocStatus
          ? _value.taskBlocStatus
          : taskBlocStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "public_Type") this.publicType,
      @JsonKey(name: "main_type_task") this.mainTypeTask,
      @JsonKey(name: "recive_date") this.reciveDate,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "deadline") this.deadline,
      @JsonKey(name: "actual_delivery_date") this.actualDeliveryDate,
      @JsonKey(name: "hours") this.hours,
      @JsonKey(name: "completion_percentage") this.completionPercentage,
      @JsonKey(name: "recurring") this.recurring,
      @JsonKey(name: "recurring_type") this.recurringType,
      @JsonKey(name: "Number_Of_Recurring") this.numberOfRecurring,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "dateTimeCreated") this.dateTimeCreated,
      @JsonKey(name: "changed_date") this.changedDate,
      @JsonKey(name: "task_statuse_id") this.taskStatuseId,
      @JsonKey(name: "changed_by") this.changedBy,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "priority") this.priority,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "assigned_by_name") this.assignedByName,
      @JsonKey(name: "assigend_department_from_name")
      this.assigendDepartmentFromName,
      @JsonKey(name: "assigend_department_to_name")
      this.assigendDepartmentToName,
      @JsonKey(name: "assigend_region_from") this.assigendRegionFrom,
      @JsonKey(name: "assigend_region_to") this.assigendRegionTo,
      @JsonKey(name: "created_by") this.createdBy,
      @JsonKey(name: "name_regoin") this.nameRegoin,
      @JsonKey(name: "task_statuses") final List<TaskStatus>? taskStatuses,
      @JsonKey(name: "assignedByUser") this.assignedByUser,
      @JsonKey(name: "assignedToUser") this.assignedToUser,
      @JsonKey(name: "taskGroup") this.taskGroup,
      @JsonKey(name: "Clients") this.clients,
      @JsonKey(name: "invoices") this.invoices,
      @JsonKey(includeToJson: false, includeFromJson: false, required: true)
      this.taskBlocStatus = const BlocStatus.initial()})
      : _taskStatuses = taskStatuses;

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final dynamic id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final dynamic description;
  @override
  @JsonKey(name: "public_Type")
  final String? publicType;
  @override
  @JsonKey(name: "main_type_task")
  final dynamic mainTypeTask;
  @override
  @JsonKey(name: "recive_date")
  final dynamic reciveDate;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "deadline")
  final dynamic deadline;
  @override
  @JsonKey(name: "actual_delivery_date")
  final dynamic actualDeliveryDate;
  @override
  @JsonKey(name: "hours")
  final dynamic hours;
  @override
  @JsonKey(name: "completion_percentage")
  final dynamic completionPercentage;
  @override
  @JsonKey(name: "recurring")
  final dynamic recurring;
  @override
  @JsonKey(name: "recurring_type")
  final dynamic recurringType;
  @override
  @JsonKey(name: "Number_Of_Recurring")
  final dynamic numberOfRecurring;
  @override
  @JsonKey(name: "created_at")
  final dynamic createdAt;
  @override
  @JsonKey(name: "updated_at")
  final dynamic updatedAt;
  @override
  @JsonKey(name: "dateTimeCreated")
  final DateTime? dateTimeCreated;
  @override
  @JsonKey(name: "changed_date")
  final dynamic changedDate;
  @override
  @JsonKey(name: "task_statuse_id")
  final dynamic taskStatuseId;
  @override
  @JsonKey(name: "changed_by")
  final dynamic changedBy;
  @override
  @JsonKey(name: "type")
  final dynamic type;
  @override
  @JsonKey(name: "priority")
  final dynamic priority;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "assigned_by_name")
  final String? assignedByName;
  @override
  @JsonKey(name: "assigend_department_from_name")
  final String? assigendDepartmentFromName;
  @override
  @JsonKey(name: "assigend_department_to_name")
  final String? assigendDepartmentToName;
  @override
  @JsonKey(name: "assigend_region_from")
  final String? assigendRegionFrom;
  @override
  @JsonKey(name: "assigend_region_to")
  final String? assigendRegionTo;
  @override
  @JsonKey(name: "created_by")
  final String? createdBy;
  @override
  @JsonKey(name: "name_regoin")
  final String? nameRegoin;
  final List<TaskStatus>? _taskStatuses;
  @override
  @JsonKey(name: "task_statuses")
  List<TaskStatus>? get taskStatuses {
    final value = _taskStatuses;
    if (value == null) return null;
    if (_taskStatuses is EqualUnmodifiableListView) return _taskStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "assignedByUser")
  final AssignedUser? assignedByUser;
  @override
  @JsonKey(name: "assignedToUser")
  final AssignedUser? assignedToUser;
  @override
  @JsonKey(name: "taskGroup")
  final TaskGroup? taskGroup;
  @override
  @JsonKey(name: "Clients")
  final Clients? clients;
  @override
  @JsonKey(name: "invoices")
  final Invoices? invoices;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false, required: true)
  final BlocStatus taskBlocStatus;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, publicType: $publicType, mainTypeTask: $mainTypeTask, reciveDate: $reciveDate, startDate: $startDate, deadline: $deadline, actualDeliveryDate: $actualDeliveryDate, hours: $hours, completionPercentage: $completionPercentage, recurring: $recurring, recurringType: $recurringType, numberOfRecurring: $numberOfRecurring, createdAt: $createdAt, updatedAt: $updatedAt, dateTimeCreated: $dateTimeCreated, changedDate: $changedDate, taskStatuseId: $taskStatuseId, changedBy: $changedBy, type: $type, priority: $priority, name: $name, assignedByName: $assignedByName, assigendDepartmentFromName: $assigendDepartmentFromName, assigendDepartmentToName: $assigendDepartmentToName, assigendRegionFrom: $assigendRegionFrom, assigendRegionTo: $assigendRegionTo, createdBy: $createdBy, nameRegoin: $nameRegoin, taskStatuses: $taskStatuses, assignedByUser: $assignedByUser, assignedToUser: $assignedToUser, taskGroup: $taskGroup, clients: $clients, invoices: $invoices, taskBlocStatus: $taskBlocStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.publicType, publicType) ||
                other.publicType == publicType) &&
            const DeepCollectionEquality()
                .equals(other.mainTypeTask, mainTypeTask) &&
            const DeepCollectionEquality()
                .equals(other.reciveDate, reciveDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality()
                .equals(other.actualDeliveryDate, actualDeliveryDate) &&
            const DeepCollectionEquality().equals(other.hours, hours) &&
            const DeepCollectionEquality()
                .equals(other.completionPercentage, completionPercentage) &&
            const DeepCollectionEquality().equals(other.recurring, recurring) &&
            const DeepCollectionEquality()
                .equals(other.recurringType, recurringType) &&
            const DeepCollectionEquality()
                .equals(other.numberOfRecurring, numberOfRecurring) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.dateTimeCreated, dateTimeCreated) ||
                other.dateTimeCreated == dateTimeCreated) &&
            const DeepCollectionEquality()
                .equals(other.changedDate, changedDate) &&
            const DeepCollectionEquality()
                .equals(other.taskStatuseId, taskStatuseId) &&
            const DeepCollectionEquality().equals(other.changedBy, changedBy) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.priority, priority) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assignedByName, assignedByName) ||
                other.assignedByName == assignedByName) &&
            (identical(other.assigendDepartmentFromName,
                    assigendDepartmentFromName) ||
                other.assigendDepartmentFromName ==
                    assigendDepartmentFromName) &&
            (identical(
                    other.assigendDepartmentToName, assigendDepartmentToName) ||
                other.assigendDepartmentToName == assigendDepartmentToName) &&
            (identical(other.assigendRegionFrom, assigendRegionFrom) ||
                other.assigendRegionFrom == assigendRegionFrom) &&
            (identical(other.assigendRegionTo, assigendRegionTo) ||
                other.assigendRegionTo == assigendRegionTo) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.nameRegoin, nameRegoin) ||
                other.nameRegoin == nameRegoin) &&
            const DeepCollectionEquality()
                .equals(other._taskStatuses, _taskStatuses) &&
            (identical(other.assignedByUser, assignedByUser) ||
                other.assignedByUser == assignedByUser) &&
            (identical(other.assignedToUser, assignedToUser) ||
                other.assignedToUser == assignedToUser) &&
            (identical(other.taskGroup, taskGroup) ||
                other.taskGroup == taskGroup) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.invoices, invoices) ||
                other.invoices == invoices) &&
            (identical(other.taskBlocStatus, taskBlocStatus) ||
                other.taskBlocStatus == taskBlocStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        title,
        const DeepCollectionEquality().hash(description),
        publicType,
        const DeepCollectionEquality().hash(mainTypeTask),
        const DeepCollectionEquality().hash(reciveDate),
        startDate,
        const DeepCollectionEquality().hash(deadline),
        const DeepCollectionEquality().hash(actualDeliveryDate),
        const DeepCollectionEquality().hash(hours),
        const DeepCollectionEquality().hash(completionPercentage),
        const DeepCollectionEquality().hash(recurring),
        const DeepCollectionEquality().hash(recurringType),
        const DeepCollectionEquality().hash(numberOfRecurring),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        dateTimeCreated,
        const DeepCollectionEquality().hash(changedDate),
        const DeepCollectionEquality().hash(taskStatuseId),
        const DeepCollectionEquality().hash(changedBy),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(priority),
        name,
        assignedByName,
        assigendDepartmentFromName,
        assigendDepartmentToName,
        assigendRegionFrom,
        assigendRegionTo,
        createdBy,
        nameRegoin,
        const DeepCollectionEquality().hash(_taskStatuses),
        assignedByUser,
        assignedToUser,
        taskGroup,
        clients,
        invoices,
        taskBlocStatus
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {@JsonKey(name: "id") final dynamic id,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "description") final dynamic description,
      @JsonKey(name: "public_Type") final String? publicType,
      @JsonKey(name: "main_type_task") final dynamic mainTypeTask,
      @JsonKey(name: "recive_date") final dynamic reciveDate,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "deadline") final dynamic deadline,
      @JsonKey(name: "actual_delivery_date") final dynamic actualDeliveryDate,
      @JsonKey(name: "hours") final dynamic hours,
      @JsonKey(name: "completion_percentage")
      final dynamic completionPercentage,
      @JsonKey(name: "recurring") final dynamic recurring,
      @JsonKey(name: "recurring_type") final dynamic recurringType,
      @JsonKey(name: "Number_Of_Recurring") final dynamic numberOfRecurring,
      @JsonKey(name: "created_at") final dynamic createdAt,
      @JsonKey(name: "updated_at") final dynamic updatedAt,
      @JsonKey(name: "dateTimeCreated") final DateTime? dateTimeCreated,
      @JsonKey(name: "changed_date") final dynamic changedDate,
      @JsonKey(name: "task_statuse_id") final dynamic taskStatuseId,
      @JsonKey(name: "changed_by") final dynamic changedBy,
      @JsonKey(name: "type") final dynamic type,
      @JsonKey(name: "priority") final dynamic priority,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "assigned_by_name") final String? assignedByName,
      @JsonKey(name: "assigend_department_from_name")
      final String? assigendDepartmentFromName,
      @JsonKey(name: "assigend_department_to_name")
      final String? assigendDepartmentToName,
      @JsonKey(name: "assigend_region_from") final String? assigendRegionFrom,
      @JsonKey(name: "assigend_region_to") final String? assigendRegionTo,
      @JsonKey(name: "created_by") final String? createdBy,
      @JsonKey(name: "name_regoin") final String? nameRegoin,
      @JsonKey(name: "task_statuses") final List<TaskStatus>? taskStatuses,
      @JsonKey(name: "assignedByUser") final AssignedUser? assignedByUser,
      @JsonKey(name: "assignedToUser") final AssignedUser? assignedToUser,
      @JsonKey(name: "taskGroup") final TaskGroup? taskGroup,
      @JsonKey(name: "Clients") final Clients? clients,
      @JsonKey(name: "invoices") final Invoices? invoices,
      @JsonKey(includeToJson: false, includeFromJson: false, required: true)
      final BlocStatus taskBlocStatus}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  dynamic get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  dynamic get description;
  @override
  @JsonKey(name: "public_Type")
  String? get publicType;
  @override
  @JsonKey(name: "main_type_task")
  dynamic get mainTypeTask;
  @override
  @JsonKey(name: "recive_date")
  dynamic get reciveDate;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "deadline")
  dynamic get deadline;
  @override
  @JsonKey(name: "actual_delivery_date")
  dynamic get actualDeliveryDate;
  @override
  @JsonKey(name: "hours")
  dynamic get hours;
  @override
  @JsonKey(name: "completion_percentage")
  dynamic get completionPercentage;
  @override
  @JsonKey(name: "recurring")
  dynamic get recurring;
  @override
  @JsonKey(name: "recurring_type")
  dynamic get recurringType;
  @override
  @JsonKey(name: "Number_Of_Recurring")
  dynamic get numberOfRecurring;
  @override
  @JsonKey(name: "created_at")
  dynamic get createdAt;
  @override
  @JsonKey(name: "updated_at")
  dynamic get updatedAt;
  @override
  @JsonKey(name: "dateTimeCreated")
  DateTime? get dateTimeCreated;
  @override
  @JsonKey(name: "changed_date")
  dynamic get changedDate;
  @override
  @JsonKey(name: "task_statuse_id")
  dynamic get taskStatuseId;
  @override
  @JsonKey(name: "changed_by")
  dynamic get changedBy;
  @override
  @JsonKey(name: "type")
  dynamic get type;
  @override
  @JsonKey(name: "priority")
  dynamic get priority;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "assigned_by_name")
  String? get assignedByName;
  @override
  @JsonKey(name: "assigend_department_from_name")
  String? get assigendDepartmentFromName;
  @override
  @JsonKey(name: "assigend_department_to_name")
  String? get assigendDepartmentToName;
  @override
  @JsonKey(name: "assigend_region_from")
  String? get assigendRegionFrom;
  @override
  @JsonKey(name: "assigend_region_to")
  String? get assigendRegionTo;
  @override
  @JsonKey(name: "created_by")
  String? get createdBy;
  @override
  @JsonKey(name: "name_regoin")
  String? get nameRegoin;
  @override
  @JsonKey(name: "task_statuses")
  List<TaskStatus>? get taskStatuses;
  @override
  @JsonKey(name: "assignedByUser")
  AssignedUser? get assignedByUser;
  @override
  @JsonKey(name: "assignedToUser")
  AssignedUser? get assignedToUser;
  @override
  @JsonKey(name: "taskGroup")
  TaskGroup? get taskGroup;
  @override
  @JsonKey(name: "Clients")
  Clients? get clients;
  @override
  @JsonKey(name: "invoices")
  Invoices? get invoices;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false, required: true)
  BlocStatus get taskBlocStatus;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignedUser _$AssignedUserFromJson(Map<String, dynamic> json) {
  return _AssignedUser.fromJson(json);
}

/// @nodoc
mixin _$AssignedUser {
  @JsonKey(name: "id_user")
  dynamic get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: "nameUser")
  String? get nameUser => throw _privateConstructorUsedError;
  @JsonKey(name: "img_image")
  String? get imgImage => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_regoin")
  dynamic get fkRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "type_administration")
  String? get typeAdministration => throw _privateConstructorUsedError;
  @JsonKey(name: "name_regoin")
  String? get nameRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "name_mange")
  String? get nameMange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedUserCopyWith<AssignedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedUserCopyWith<$Res> {
  factory $AssignedUserCopyWith(
          AssignedUser value, $Res Function(AssignedUser) then) =
      _$AssignedUserCopyWithImpl<$Res, AssignedUser>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_user") dynamic idUser,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "img_image") String? imgImage,
      @JsonKey(name: "fk_regoin") dynamic fkRegoin,
      @JsonKey(name: "type_administration") String? typeAdministration,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "name_mange") String? nameMange});
}

/// @nodoc
class _$AssignedUserCopyWithImpl<$Res, $Val extends AssignedUser>
    implements $AssignedUserCopyWith<$Res> {
  _$AssignedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? nameUser = freezed,
    Object? imgImage = freezed,
    Object? fkRegoin = freezed,
    Object? typeAdministration = freezed,
    Object? nameRegoin = freezed,
    Object? nameMange = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      imgImage: freezed == imgImage
          ? _value.imgImage
          : imgImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeAdministration: freezed == typeAdministration
          ? _value.typeAdministration
          : typeAdministration // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameMange: freezed == nameMange
          ? _value.nameMange
          : nameMange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignedUserImplCopyWith<$Res>
    implements $AssignedUserCopyWith<$Res> {
  factory _$$AssignedUserImplCopyWith(
          _$AssignedUserImpl value, $Res Function(_$AssignedUserImpl) then) =
      __$$AssignedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_user") dynamic idUser,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "img_image") String? imgImage,
      @JsonKey(name: "fk_regoin") dynamic fkRegoin,
      @JsonKey(name: "type_administration") String? typeAdministration,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "name_mange") String? nameMange});
}

/// @nodoc
class __$$AssignedUserImplCopyWithImpl<$Res>
    extends _$AssignedUserCopyWithImpl<$Res, _$AssignedUserImpl>
    implements _$$AssignedUserImplCopyWith<$Res> {
  __$$AssignedUserImplCopyWithImpl(
      _$AssignedUserImpl _value, $Res Function(_$AssignedUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? nameUser = freezed,
    Object? imgImage = freezed,
    Object? fkRegoin = freezed,
    Object? typeAdministration = freezed,
    Object? nameRegoin = freezed,
    Object? nameMange = freezed,
  }) {
    return _then(_$AssignedUserImpl(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      imgImage: freezed == imgImage
          ? _value.imgImage
          : imgImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeAdministration: freezed == typeAdministration
          ? _value.typeAdministration
          : typeAdministration // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameMange: freezed == nameMange
          ? _value.nameMange
          : nameMange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignedUserImpl implements _AssignedUser {
  const _$AssignedUserImpl(
      {@JsonKey(name: "id_user") this.idUser,
      @JsonKey(name: "nameUser") this.nameUser,
      @JsonKey(name: "img_image") this.imgImage,
      @JsonKey(name: "fk_regoin") this.fkRegoin,
      @JsonKey(name: "type_administration") this.typeAdministration,
      @JsonKey(name: "name_regoin") this.nameRegoin,
      @JsonKey(name: "name_mange") this.nameMange});

  factory _$AssignedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignedUserImplFromJson(json);

  @override
  @JsonKey(name: "id_user")
  final dynamic idUser;
  @override
  @JsonKey(name: "nameUser")
  final String? nameUser;
  @override
  @JsonKey(name: "img_image")
  final String? imgImage;
  @override
  @JsonKey(name: "fk_regoin")
  final dynamic fkRegoin;
  @override
  @JsonKey(name: "type_administration")
  final String? typeAdministration;
  @override
  @JsonKey(name: "name_regoin")
  final String? nameRegoin;
  @override
  @JsonKey(name: "name_mange")
  final String? nameMange;

  @override
  String toString() {
    return 'AssignedUser(idUser: $idUser, nameUser: $nameUser, imgImage: $imgImage, fkRegoin: $fkRegoin, typeAdministration: $typeAdministration, nameRegoin: $nameRegoin, nameMange: $nameMange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedUserImpl &&
            const DeepCollectionEquality().equals(other.idUser, idUser) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            (identical(other.imgImage, imgImage) ||
                other.imgImage == imgImage) &&
            const DeepCollectionEquality().equals(other.fkRegoin, fkRegoin) &&
            (identical(other.typeAdministration, typeAdministration) ||
                other.typeAdministration == typeAdministration) &&
            (identical(other.nameRegoin, nameRegoin) ||
                other.nameRegoin == nameRegoin) &&
            (identical(other.nameMange, nameMange) ||
                other.nameMange == nameMange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idUser),
      nameUser,
      imgImage,
      const DeepCollectionEquality().hash(fkRegoin),
      typeAdministration,
      nameRegoin,
      nameMange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedUserImplCopyWith<_$AssignedUserImpl> get copyWith =>
      __$$AssignedUserImplCopyWithImpl<_$AssignedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignedUserImplToJson(
      this,
    );
  }
}

abstract class _AssignedUser implements AssignedUser {
  const factory _AssignedUser(
      {@JsonKey(name: "id_user") final dynamic idUser,
      @JsonKey(name: "nameUser") final String? nameUser,
      @JsonKey(name: "img_image") final String? imgImage,
      @JsonKey(name: "fk_regoin") final dynamic fkRegoin,
      @JsonKey(name: "type_administration") final String? typeAdministration,
      @JsonKey(name: "name_regoin") final String? nameRegoin,
      @JsonKey(name: "name_mange")
      final String? nameMange}) = _$AssignedUserImpl;

  factory _AssignedUser.fromJson(Map<String, dynamic> json) =
      _$AssignedUserImpl.fromJson;

  @override
  @JsonKey(name: "id_user")
  dynamic get idUser;
  @override
  @JsonKey(name: "nameUser")
  String? get nameUser;
  @override
  @JsonKey(name: "img_image")
  String? get imgImage;
  @override
  @JsonKey(name: "fk_regoin")
  dynamic get fkRegoin;
  @override
  @JsonKey(name: "type_administration")
  String? get typeAdministration;
  @override
  @JsonKey(name: "name_regoin")
  String? get nameRegoin;
  @override
  @JsonKey(name: "name_mange")
  String? get nameMange;
  @override
  @JsonKey(ignore: true)
  _$$AssignedUserImplCopyWith<_$AssignedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Clients _$ClientsFromJson(Map<String, dynamic> json) {
  return _Clients.fromJson(json);
}

/// @nodoc
mixin _$Clients {
  @JsonKey(name: "id_clients")
  dynamic get idClients => throw _privateConstructorUsedError;
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise => throw _privateConstructorUsedError;
  @JsonKey(name: "ismarketing")
  String? get ismarketing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientsCopyWith<Clients> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientsCopyWith<$Res> {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) then) =
      _$ClientsCopyWithImpl<$Res, Clients>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_clients") dynamic idClients,
      @JsonKey(name: "name_enterprise") String? nameEnterprise,
      @JsonKey(name: "ismarketing") String? ismarketing});
}

/// @nodoc
class _$ClientsCopyWithImpl<$Res, $Val extends Clients>
    implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idClients = freezed,
    Object? nameEnterprise = freezed,
    Object? ismarketing = freezed,
  }) {
    return _then(_value.copyWith(
      idClients: freezed == idClients
          ? _value.idClients
          : idClients // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
      ismarketing: freezed == ismarketing
          ? _value.ismarketing
          : ismarketing // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientsImplCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$$ClientsImplCopyWith(
          _$ClientsImpl value, $Res Function(_$ClientsImpl) then) =
      __$$ClientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_clients") dynamic idClients,
      @JsonKey(name: "name_enterprise") String? nameEnterprise,
      @JsonKey(name: "ismarketing") String? ismarketing});
}

/// @nodoc
class __$$ClientsImplCopyWithImpl<$Res>
    extends _$ClientsCopyWithImpl<$Res, _$ClientsImpl>
    implements _$$ClientsImplCopyWith<$Res> {
  __$$ClientsImplCopyWithImpl(
      _$ClientsImpl _value, $Res Function(_$ClientsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idClients = freezed,
    Object? nameEnterprise = freezed,
    Object? ismarketing = freezed,
  }) {
    return _then(_$ClientsImpl(
      idClients: freezed == idClients
          ? _value.idClients
          : idClients // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
      ismarketing: freezed == ismarketing
          ? _value.ismarketing
          : ismarketing // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientsImpl implements _Clients {
  const _$ClientsImpl(
      {@JsonKey(name: "id_clients") this.idClients,
      @JsonKey(name: "name_enterprise") this.nameEnterprise,
      @JsonKey(name: "ismarketing") this.ismarketing});

  factory _$ClientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientsImplFromJson(json);

  @override
  @JsonKey(name: "id_clients")
  final dynamic idClients;
  @override
  @JsonKey(name: "name_enterprise")
  final String? nameEnterprise;
  @override
  @JsonKey(name: "ismarketing")
  final String? ismarketing;

  @override
  String toString() {
    return 'Clients(idClients: $idClients, nameEnterprise: $nameEnterprise, ismarketing: $ismarketing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientsImpl &&
            const DeepCollectionEquality().equals(other.idClients, idClients) &&
            (identical(other.nameEnterprise, nameEnterprise) ||
                other.nameEnterprise == nameEnterprise) &&
            (identical(other.ismarketing, ismarketing) ||
                other.ismarketing == ismarketing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idClients),
      nameEnterprise,
      ismarketing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientsImplCopyWith<_$ClientsImpl> get copyWith =>
      __$$ClientsImplCopyWithImpl<_$ClientsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientsImplToJson(
      this,
    );
  }
}

abstract class _Clients implements Clients {
  const factory _Clients(
      {@JsonKey(name: "id_clients") final dynamic idClients,
      @JsonKey(name: "name_enterprise") final String? nameEnterprise,
      @JsonKey(name: "ismarketing") final String? ismarketing}) = _$ClientsImpl;

  factory _Clients.fromJson(Map<String, dynamic> json) = _$ClientsImpl.fromJson;

  @override
  @JsonKey(name: "id_clients")
  dynamic get idClients;
  @override
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise;
  @override
  @JsonKey(name: "ismarketing")
  String? get ismarketing;
  @override
  @JsonKey(ignore: true)
  _$$ClientsImplCopyWith<_$ClientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Invoices _$InvoicesFromJson(Map<String, dynamic> json) {
  return _Invoices.fromJson(json);
}

/// @nodoc
mixin _$Invoices {
  @JsonKey(name: "id_invoice")
  dynamic get idInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: "stateclient")
  String? get stateclient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoicesCopyWith<Invoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicesCopyWith<$Res> {
  factory $InvoicesCopyWith(Invoices value, $Res Function(Invoices) then) =
      _$InvoicesCopyWithImpl<$Res, Invoices>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_invoice") dynamic idInvoice,
      @JsonKey(name: "stateclient") String? stateclient});
}

/// @nodoc
class _$InvoicesCopyWithImpl<$Res, $Val extends Invoices>
    implements $InvoicesCopyWith<$Res> {
  _$InvoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idInvoice = freezed,
    Object? stateclient = freezed,
  }) {
    return _then(_value.copyWith(
      idInvoice: freezed == idInvoice
          ? _value.idInvoice
          : idInvoice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stateclient: freezed == stateclient
          ? _value.stateclient
          : stateclient // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoicesImplCopyWith<$Res>
    implements $InvoicesCopyWith<$Res> {
  factory _$$InvoicesImplCopyWith(
          _$InvoicesImpl value, $Res Function(_$InvoicesImpl) then) =
      __$$InvoicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_invoice") dynamic idInvoice,
      @JsonKey(name: "stateclient") String? stateclient});
}

/// @nodoc
class __$$InvoicesImplCopyWithImpl<$Res>
    extends _$InvoicesCopyWithImpl<$Res, _$InvoicesImpl>
    implements _$$InvoicesImplCopyWith<$Res> {
  __$$InvoicesImplCopyWithImpl(
      _$InvoicesImpl _value, $Res Function(_$InvoicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idInvoice = freezed,
    Object? stateclient = freezed,
  }) {
    return _then(_$InvoicesImpl(
      idInvoice: freezed == idInvoice
          ? _value.idInvoice
          : idInvoice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stateclient: freezed == stateclient
          ? _value.stateclient
          : stateclient // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoicesImpl implements _Invoices {
  const _$InvoicesImpl(
      {@JsonKey(name: "id_invoice") this.idInvoice,
      @JsonKey(name: "stateclient") this.stateclient});

  factory _$InvoicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoicesImplFromJson(json);

  @override
  @JsonKey(name: "id_invoice")
  final dynamic idInvoice;
  @override
  @JsonKey(name: "stateclient")
  final String? stateclient;

  @override
  String toString() {
    return 'Invoices(idInvoice: $idInvoice, stateclient: $stateclient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoicesImpl &&
            const DeepCollectionEquality().equals(other.idInvoice, idInvoice) &&
            (identical(other.stateclient, stateclient) ||
                other.stateclient == stateclient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(idInvoice), stateclient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoicesImplCopyWith<_$InvoicesImpl> get copyWith =>
      __$$InvoicesImplCopyWithImpl<_$InvoicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoicesImplToJson(
      this,
    );
  }
}

abstract class _Invoices implements Invoices {
  const factory _Invoices(
          {@JsonKey(name: "id_invoice") final dynamic idInvoice,
          @JsonKey(name: "stateclient") final String? stateclient}) =
      _$InvoicesImpl;

  factory _Invoices.fromJson(Map<String, dynamic> json) =
      _$InvoicesImpl.fromJson;

  @override
  @JsonKey(name: "id_invoice")
  dynamic get idInvoice;
  @override
  @JsonKey(name: "stateclient")
  String? get stateclient;
  @override
  @JsonKey(ignore: true)
  _$$InvoicesImplCopyWith<_$InvoicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskGroup _$TaskGroupFromJson(Map<String, dynamic> json) {
  return _TaskGroup.fromJson(json);
}

/// @nodoc
mixin _$TaskGroup {
  @JsonKey(name: "id")
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: "groupName")
  String? get groupName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskGroupCopyWith<TaskGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskGroupCopyWith<$Res> {
  factory $TaskGroupCopyWith(TaskGroup value, $Res Function(TaskGroup) then) =
      _$TaskGroupCopyWithImpl<$Res, TaskGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "groupName") String? groupName});
}

/// @nodoc
class _$TaskGroupCopyWithImpl<$Res, $Val extends TaskGroup>
    implements $TaskGroupCopyWith<$Res> {
  _$TaskGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskGroupImplCopyWith<$Res>
    implements $TaskGroupCopyWith<$Res> {
  factory _$$TaskGroupImplCopyWith(
          _$TaskGroupImpl value, $Res Function(_$TaskGroupImpl) then) =
      __$$TaskGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "groupName") String? groupName});
}

/// @nodoc
class __$$TaskGroupImplCopyWithImpl<$Res>
    extends _$TaskGroupCopyWithImpl<$Res, _$TaskGroupImpl>
    implements _$$TaskGroupImplCopyWith<$Res> {
  __$$TaskGroupImplCopyWithImpl(
      _$TaskGroupImpl _value, $Res Function(_$TaskGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_$TaskGroupImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskGroupImpl implements _TaskGroup {
  const _$TaskGroupImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "groupName") this.groupName});

  factory _$TaskGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskGroupImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final dynamic id;
  @override
  @JsonKey(name: "groupName")
  final String? groupName;

  @override
  String toString() {
    return 'TaskGroup(id: $id, groupName: $groupName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskGroupImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(id), groupName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskGroupImplCopyWith<_$TaskGroupImpl> get copyWith =>
      __$$TaskGroupImplCopyWithImpl<_$TaskGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskGroupImplToJson(
      this,
    );
  }
}

abstract class _TaskGroup implements TaskGroup {
  const factory _TaskGroup(
      {@JsonKey(name: "id") final dynamic id,
      @JsonKey(name: "groupName") final String? groupName}) = _$TaskGroupImpl;

  factory _TaskGroup.fromJson(Map<String, dynamic> json) =
      _$TaskGroupImpl.fromJson;

  @override
  @JsonKey(name: "id")
  dynamic get id;
  @override
  @JsonKey(name: "groupName")
  String? get groupName;
  @override
  @JsonKey(ignore: true)
  _$$TaskGroupImplCopyWith<_$TaskGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskStatus _$TaskStatusFromJson(Map<String, dynamic> json) {
  return _TaskStatus.fromJson(json);
}

/// @nodoc
mixin _$TaskStatus {
  @JsonKey(name: "id")
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  dynamic get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  dynamic get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "name_user")
  String? get nameUser => throw _privateConstructorUsedError;
  @JsonKey(name: "pivot")
  Pivot? get pivot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskStatusCopyWith<TaskStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusCopyWith<$Res> {
  factory $TaskStatusCopyWith(
          TaskStatus value, $Res Function(TaskStatus) then) =
      _$TaskStatusCopyWithImpl<$Res, TaskStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "created_at") dynamic createdAt,
      @JsonKey(name: "updated_at") dynamic updatedAt,
      @JsonKey(name: "name_user") String? nameUser,
      @JsonKey(name: "pivot") Pivot? pivot});

  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class _$TaskStatusCopyWithImpl<$Res, $Val extends TaskStatus>
    implements $TaskStatusCopyWith<$Res> {
  _$TaskStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nameUser = freezed,
    Object? pivot = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PivotCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskStatusImplCopyWith<$Res>
    implements $TaskStatusCopyWith<$Res> {
  factory _$$TaskStatusImplCopyWith(
          _$TaskStatusImpl value, $Res Function(_$TaskStatusImpl) then) =
      __$$TaskStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") dynamic id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "created_at") dynamic createdAt,
      @JsonKey(name: "updated_at") dynamic updatedAt,
      @JsonKey(name: "name_user") String? nameUser,
      @JsonKey(name: "pivot") Pivot? pivot});

  @override
  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class __$$TaskStatusImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$TaskStatusImpl>
    implements _$$TaskStatusImplCopyWith<$Res> {
  __$$TaskStatusImplCopyWithImpl(
      _$TaskStatusImpl _value, $Res Function(_$TaskStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nameUser = freezed,
    Object? pivot = freezed,
  }) {
    return _then(_$TaskStatusImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskStatusImpl implements _TaskStatus {
  const _$TaskStatusImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "name_user") this.nameUser,
      @JsonKey(name: "pivot") this.pivot});

  factory _$TaskStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskStatusImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final dynamic id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "created_at")
  final dynamic createdAt;
  @override
  @JsonKey(name: "updated_at")
  final dynamic updatedAt;
  @override
  @JsonKey(name: "name_user")
  final String? nameUser;
  @override
  @JsonKey(name: "pivot")
  final Pivot? pivot;

  @override
  String toString() {
    return 'TaskStatus(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, nameUser: $nameUser, pivot: $pivot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStatusImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            (identical(other.pivot, pivot) || other.pivot == pivot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      name,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      nameUser,
      pivot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStatusImplCopyWith<_$TaskStatusImpl> get copyWith =>
      __$$TaskStatusImplCopyWithImpl<_$TaskStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskStatusImplToJson(
      this,
    );
  }
}

abstract class _TaskStatus implements TaskStatus {
  const factory _TaskStatus(
      {@JsonKey(name: "id") final dynamic id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "created_at") final dynamic createdAt,
      @JsonKey(name: "updated_at") final dynamic updatedAt,
      @JsonKey(name: "name_user") final String? nameUser,
      @JsonKey(name: "pivot") final Pivot? pivot}) = _$TaskStatusImpl;

  factory _TaskStatus.fromJson(Map<String, dynamic> json) =
      _$TaskStatusImpl.fromJson;

  @override
  @JsonKey(name: "id")
  dynamic get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "created_at")
  dynamic get createdAt;
  @override
  @JsonKey(name: "updated_at")
  dynamic get updatedAt;
  @override
  @JsonKey(name: "name_user")
  String? get nameUser;
  @override
  @JsonKey(name: "pivot")
  Pivot? get pivot;
  @override
  @JsonKey(ignore: true)
  _$$TaskStatusImplCopyWith<_$TaskStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return _Pivot.fromJson(json);
}

/// @nodoc
mixin _$Pivot {
  @JsonKey(name: "task_id")
  dynamic get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: "task_statuse_id")
  dynamic get taskStatuseId => throw _privateConstructorUsedError;
  @JsonKey(name: "changed_by")
  dynamic get changedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PivotCopyWith<Pivot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PivotCopyWith<$Res> {
  factory $PivotCopyWith(Pivot value, $Res Function(Pivot) then) =
      _$PivotCopyWithImpl<$Res, Pivot>;
  @useResult
  $Res call(
      {@JsonKey(name: "task_id") dynamic taskId,
      @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
      @JsonKey(name: "changed_by") dynamic changedBy});
}

/// @nodoc
class _$PivotCopyWithImpl<$Res, $Val extends Pivot>
    implements $PivotCopyWith<$Res> {
  _$PivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskStatuseId = freezed,
    Object? changedBy = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      taskStatuseId: freezed == taskStatuseId
          ? _value.taskStatuseId
          : taskStatuseId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PivotImplCopyWith<$Res> implements $PivotCopyWith<$Res> {
  factory _$$PivotImplCopyWith(
          _$PivotImpl value, $Res Function(_$PivotImpl) then) =
      __$$PivotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "task_id") dynamic taskId,
      @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
      @JsonKey(name: "changed_by") dynamic changedBy});
}

/// @nodoc
class __$$PivotImplCopyWithImpl<$Res>
    extends _$PivotCopyWithImpl<$Res, _$PivotImpl>
    implements _$$PivotImplCopyWith<$Res> {
  __$$PivotImplCopyWithImpl(
      _$PivotImpl _value, $Res Function(_$PivotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskStatuseId = freezed,
    Object? changedBy = freezed,
  }) {
    return _then(_$PivotImpl(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      taskStatuseId: freezed == taskStatuseId
          ? _value.taskStatuseId
          : taskStatuseId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PivotImpl implements _Pivot {
  const _$PivotImpl(
      {@JsonKey(name: "task_id") this.taskId,
      @JsonKey(name: "task_statuse_id") this.taskStatuseId,
      @JsonKey(name: "changed_by") this.changedBy});

  factory _$PivotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PivotImplFromJson(json);

  @override
  @JsonKey(name: "task_id")
  final dynamic taskId;
  @override
  @JsonKey(name: "task_statuse_id")
  final dynamic taskStatuseId;
  @override
  @JsonKey(name: "changed_by")
  final dynamic changedBy;

  @override
  String toString() {
    return 'Pivot(taskId: $taskId, taskStatuseId: $taskStatuseId, changedBy: $changedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PivotImpl &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality()
                .equals(other.taskStatuseId, taskStatuseId) &&
            const DeepCollectionEquality().equals(other.changedBy, changedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(taskStatuseId),
      const DeepCollectionEquality().hash(changedBy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      __$$PivotImplCopyWithImpl<_$PivotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PivotImplToJson(
      this,
    );
  }
}

abstract class _Pivot implements Pivot {
  const factory _Pivot(
      {@JsonKey(name: "task_id") final dynamic taskId,
      @JsonKey(name: "task_statuse_id") final dynamic taskStatuseId,
      @JsonKey(name: "changed_by") final dynamic changedBy}) = _$PivotImpl;

  factory _Pivot.fromJson(Map<String, dynamic> json) = _$PivotImpl.fromJson;

  @override
  @JsonKey(name: "task_id")
  dynamic get taskId;
  @override
  @JsonKey(name: "task_statuse_id")
  dynamic get taskStatuseId;
  @override
  @JsonKey(name: "changed_by")
  dynamic get changedBy;
  @override
  @JsonKey(ignore: true)
  _$$PivotImplCopyWith<_$PivotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
