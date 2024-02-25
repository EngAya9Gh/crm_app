// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'communication_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunicationListResponse _$CommunicationListResponseFromJson(
    Map<String, dynamic> json) {
  return _CommunicationListResponse.fromJson(json);
}

/// @nodoc
mixin _$CommunicationListResponse {
  @JsonKey(name: "result")
  String? get result => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  List<Communication>? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunicationListResponseCopyWith<CommunicationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationListResponseCopyWith<$Res> {
  factory $CommunicationListResponseCopyWith(CommunicationListResponse value,
          $Res Function(CommunicationListResponse) then) =
      _$CommunicationListResponseCopyWithImpl<$Res, CommunicationListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "result") String? result,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "message") List<Communication>? message});
}

/// @nodoc
class _$CommunicationListResponseCopyWithImpl<$Res,
        $Val extends CommunicationListResponse>
    implements $CommunicationListResponseCopyWith<$Res> {
  _$CommunicationListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Communication>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunicationListResponseImplCopyWith<$Res>
    implements $CommunicationListResponseCopyWith<$Res> {
  factory _$$CommunicationListResponseImplCopyWith(
          _$CommunicationListResponseImpl value,
          $Res Function(_$CommunicationListResponseImpl) then) =
      __$$CommunicationListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "result") String? result,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "message") List<Communication>? message});
}

/// @nodoc
class __$$CommunicationListResponseImplCopyWithImpl<$Res>
    extends _$CommunicationListResponseCopyWithImpl<$Res,
        _$CommunicationListResponseImpl>
    implements _$$CommunicationListResponseImplCopyWith<$Res> {
  __$$CommunicationListResponseImplCopyWithImpl(
      _$CommunicationListResponseImpl _value,
      $Res Function(_$CommunicationListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$CommunicationListResponseImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Communication>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunicationListResponseImpl implements _CommunicationListResponse {
  const _$CommunicationListResponseImpl(
      {@JsonKey(name: "result") this.result,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "message") final List<Communication>? message})
      : _message = message;

  factory _$CommunicationListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationListResponseImplFromJson(json);

  @override
  @JsonKey(name: "result")
  final String? result;
  @override
  @JsonKey(name: "code")
  final String? code;
  final List<Communication>? _message;
  @override
  @JsonKey(name: "message")
  List<Communication>? get message {
    final value = _message;
    if (value == null) return null;
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommunicationListResponse(result: $result, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationListResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, code, const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunicationListResponseImplCopyWith<_$CommunicationListResponseImpl>
      get copyWith => __$$CommunicationListResponseImplCopyWithImpl<
          _$CommunicationListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunicationListResponseImplToJson(
      this,
    );
  }
}

abstract class _CommunicationListResponse implements CommunicationListResponse {
  const factory _CommunicationListResponse(
          {@JsonKey(name: "result") final String? result,
          @JsonKey(name: "code") final String? code,
          @JsonKey(name: "message") final List<Communication>? message}) =
      _$CommunicationListResponseImpl;

  factory _CommunicationListResponse.fromJson(Map<String, dynamic> json) =
      _$CommunicationListResponseImpl.fromJson;

  @override
  @JsonKey(name: "result")
  String? get result;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "message")
  List<Communication>? get message;
  @override
  @JsonKey(ignore: true)
  _$$CommunicationListResponseImplCopyWith<_$CommunicationListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Communication _$CommunicationFromJson(Map<String, dynamic> json) {
  return _Communication.fromJson(json);
}

/// @nodoc
mixin _$Communication {
  @JsonKey(name: "id_communication")
  String? get idCommunication => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_client")
  String? get fkClient => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_user")
  String? get fkUser => throw _privateConstructorUsedError;
  @JsonKey(name: "date_communication")
  dynamic get dateCommunication => throw _privateConstructorUsedError;
  @JsonKey(name: "result")
  dynamic get result => throw _privateConstructorUsedError;
  @JsonKey(name: "notes")
  dynamic get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "rate")
  dynamic get rate => throw _privateConstructorUsedError;
  @JsonKey(name: "type_communcation")
  String? get typeCommuncation => throw _privateConstructorUsedError;
  @JsonKey(name: "number_wrong")
  String? get numberWrong => throw _privateConstructorUsedError;
  @JsonKey(name: "client_repeat")
  String? get clientRepeat => throw _privateConstructorUsedError;
  @JsonKey(name: "date_next")
  DateTime? get dateNext => throw _privateConstructorUsedError;
  @JsonKey(name: "id_invoice")
  dynamic get idInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: "IDcustomer")
  dynamic get iDcustomer => throw _privateConstructorUsedError;
  @JsonKey(name: "user_do")
  dynamic get userDo => throw _privateConstructorUsedError;
  @JsonKey(name: "name_enterprisecom")
  dynamic get nameEnterprisecom => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  dynamic get address => throw _privateConstructorUsedError;
  @JsonKey(name: "type_install")
  dynamic get typeInstall => throw _privateConstructorUsedError;
  @JsonKey(name: "date_last_com_install")
  dynamic get dateLastComInstall => throw _privateConstructorUsedError;
  @JsonKey(name: "client_out")
  dynamic get clientOut => throw _privateConstructorUsedError;
  @JsonKey(name: "school")
  String? get school => throw _privateConstructorUsedError;
  @JsonKey(name: "is_suspend")
  String? get isSuspend => throw _privateConstructorUsedError;
  @JsonKey(name: "isRecommendation")
  dynamic get isRecommendation => throw _privateConstructorUsedError;
  @JsonKey(name: "is_visit")
  dynamic get isVisit => throw _privateConstructorUsedError;
  @JsonKey(name: "user_update")
  dynamic get userUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise => throw _privateConstructorUsedError;
  @JsonKey(name: "nameUser")
  String? get nameUser => throw _privateConstructorUsedError;
  @JsonKey(name: "date_create")
  dynamic get dateCreate => throw _privateConstructorUsedError;
  @JsonKey(name: "date_approve")
  dynamic get dateApprove => throw _privateConstructorUsedError;
  @JsonKey(name: "dateinstall_done")
  dynamic get dateinstallDone => throw _privateConstructorUsedError;
  @JsonKey(name: "mobile")
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_regoin")
  String? get fkRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "name_regoin")
  String? get nameRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "name_client")
  String? get nameClient => throw _privateConstructorUsedError;
  @JsonKey(name: "hoursdelaylabel")
  String? get hoursdelaylabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunicationCopyWith<Communication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationCopyWith<$Res> {
  factory $CommunicationCopyWith(
          Communication value, $Res Function(Communication) then) =
      _$CommunicationCopyWithImpl<$Res, Communication>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_communication") String? idCommunication,
      @JsonKey(name: "fk_client") String? fkClient,
      @JsonKey(name: "fk_user") String? fkUser,
      @JsonKey(name: "date_communication") dynamic dateCommunication,
      @JsonKey(name: "result") dynamic result,
      @JsonKey(name: "notes") dynamic notes,
      @JsonKey(name: "rate") dynamic rate,
      @JsonKey(name: "type_communcation") String? typeCommuncation,
      @JsonKey(name: "number_wrong") String? numberWrong,
      @JsonKey(name: "client_repeat") String? clientRepeat,
      @JsonKey(name: "date_next") DateTime? dateNext,
      @JsonKey(name: "id_invoice") dynamic idInvoice,
      @JsonKey(name: "IDcustomer") dynamic iDcustomer,
      @JsonKey(name: "user_do") dynamic userDo,
      @JsonKey(name: "name_enterprisecom") dynamic nameEnterprisecom,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "type_install") dynamic typeInstall,
      @JsonKey(name: "date_last_com_install") dynamic dateLastComInstall,
      @JsonKey(name: "client_out") dynamic clientOut,
      @JsonKey(name: "school") String? school,
      @JsonKey(name: "is_suspend") String? isSuspend,
      @JsonKey(name: "isRecommendation") dynamic isRecommendation,
      @JsonKey(name: "is_visit") dynamic isVisit,
      @JsonKey(name: "user_update") dynamic userUpdate,
      @JsonKey(name: "name_enterprise") String? nameEnterprise,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "date_create") dynamic dateCreate,
      @JsonKey(name: "date_approve") dynamic dateApprove,
      @JsonKey(name: "dateinstall_done") dynamic dateinstallDone,
      @JsonKey(name: "mobile") String? mobile,
      @JsonKey(name: "fk_regoin") String? fkRegoin,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "name_client") String? nameClient,
      @JsonKey(name: "hoursdelaylabel") String? hoursdelaylabel});
}

/// @nodoc
class _$CommunicationCopyWithImpl<$Res, $Val extends Communication>
    implements $CommunicationCopyWith<$Res> {
  _$CommunicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCommunication = freezed,
    Object? fkClient = freezed,
    Object? fkUser = freezed,
    Object? dateCommunication = freezed,
    Object? result = freezed,
    Object? notes = freezed,
    Object? rate = freezed,
    Object? typeCommuncation = freezed,
    Object? numberWrong = freezed,
    Object? clientRepeat = freezed,
    Object? dateNext = freezed,
    Object? idInvoice = freezed,
    Object? iDcustomer = freezed,
    Object? userDo = freezed,
    Object? nameEnterprisecom = freezed,
    Object? address = freezed,
    Object? typeInstall = freezed,
    Object? dateLastComInstall = freezed,
    Object? clientOut = freezed,
    Object? school = freezed,
    Object? isSuspend = freezed,
    Object? isRecommendation = freezed,
    Object? isVisit = freezed,
    Object? userUpdate = freezed,
    Object? nameEnterprise = freezed,
    Object? nameUser = freezed,
    Object? dateCreate = freezed,
    Object? dateApprove = freezed,
    Object? dateinstallDone = freezed,
    Object? mobile = freezed,
    Object? fkRegoin = freezed,
    Object? nameRegoin = freezed,
    Object? nameClient = freezed,
    Object? hoursdelaylabel = freezed,
  }) {
    return _then(_value.copyWith(
      idCommunication: freezed == idCommunication
          ? _value.idCommunication
          : idCommunication // ignore: cast_nullable_to_non_nullable
              as String?,
      fkClient: freezed == fkClient
          ? _value.fkClient
          : fkClient // ignore: cast_nullable_to_non_nullable
              as String?,
      fkUser: freezed == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCommunication: freezed == dateCommunication
          ? _value.dateCommunication
          : dateCommunication // ignore: cast_nullable_to_non_nullable
              as dynamic,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeCommuncation: freezed == typeCommuncation
          ? _value.typeCommuncation
          : typeCommuncation // ignore: cast_nullable_to_non_nullable
              as String?,
      numberWrong: freezed == numberWrong
          ? _value.numberWrong
          : numberWrong // ignore: cast_nullable_to_non_nullable
              as String?,
      clientRepeat: freezed == clientRepeat
          ? _value.clientRepeat
          : clientRepeat // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNext: freezed == dateNext
          ? _value.dateNext
          : dateNext // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idInvoice: freezed == idInvoice
          ? _value.idInvoice
          : idInvoice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      iDcustomer: freezed == iDcustomer
          ? _value.iDcustomer
          : iDcustomer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userDo: freezed == userDo
          ? _value.userDo
          : userDo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprisecom: freezed == nameEnterprisecom
          ? _value.nameEnterprisecom
          : nameEnterprisecom // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeInstall: freezed == typeInstall
          ? _value.typeInstall
          : typeInstall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateLastComInstall: freezed == dateLastComInstall
          ? _value.dateLastComInstall
          : dateLastComInstall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientOut: freezed == clientOut
          ? _value.clientOut
          : clientOut // ignore: cast_nullable_to_non_nullable
              as dynamic,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuspend: freezed == isSuspend
          ? _value.isSuspend
          : isSuspend // ignore: cast_nullable_to_non_nullable
              as String?,
      isRecommendation: freezed == isRecommendation
          ? _value.isRecommendation
          : isRecommendation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isVisit: freezed == isVisit
          ? _value.isVisit
          : isVisit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userUpdate: freezed == userUpdate
          ? _value.userUpdate
          : userUpdate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreate: freezed == dateCreate
          ? _value.dateCreate
          : dateCreate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateApprove: freezed == dateApprove
          ? _value.dateApprove
          : dateApprove // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateinstallDone: freezed == dateinstallDone
          ? _value.dateinstallDone
          : dateinstallDone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameClient: freezed == nameClient
          ? _value.nameClient
          : nameClient // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursdelaylabel: freezed == hoursdelaylabel
          ? _value.hoursdelaylabel
          : hoursdelaylabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunicationImplCopyWith<$Res>
    implements $CommunicationCopyWith<$Res> {
  factory _$$CommunicationImplCopyWith(
          _$CommunicationImpl value, $Res Function(_$CommunicationImpl) then) =
      __$$CommunicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_communication") String? idCommunication,
      @JsonKey(name: "fk_client") String? fkClient,
      @JsonKey(name: "fk_user") String? fkUser,
      @JsonKey(name: "date_communication") dynamic dateCommunication,
      @JsonKey(name: "result") dynamic result,
      @JsonKey(name: "notes") dynamic notes,
      @JsonKey(name: "rate") dynamic rate,
      @JsonKey(name: "type_communcation") String? typeCommuncation,
      @JsonKey(name: "number_wrong") String? numberWrong,
      @JsonKey(name: "client_repeat") String? clientRepeat,
      @JsonKey(name: "date_next") DateTime? dateNext,
      @JsonKey(name: "id_invoice") dynamic idInvoice,
      @JsonKey(name: "IDcustomer") dynamic iDcustomer,
      @JsonKey(name: "user_do") dynamic userDo,
      @JsonKey(name: "name_enterprisecom") dynamic nameEnterprisecom,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "type_install") dynamic typeInstall,
      @JsonKey(name: "date_last_com_install") dynamic dateLastComInstall,
      @JsonKey(name: "client_out") dynamic clientOut,
      @JsonKey(name: "school") String? school,
      @JsonKey(name: "is_suspend") String? isSuspend,
      @JsonKey(name: "isRecommendation") dynamic isRecommendation,
      @JsonKey(name: "is_visit") dynamic isVisit,
      @JsonKey(name: "user_update") dynamic userUpdate,
      @JsonKey(name: "name_enterprise") String? nameEnterprise,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "date_create") dynamic dateCreate,
      @JsonKey(name: "date_approve") dynamic dateApprove,
      @JsonKey(name: "dateinstall_done") dynamic dateinstallDone,
      @JsonKey(name: "mobile") String? mobile,
      @JsonKey(name: "fk_regoin") String? fkRegoin,
      @JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "name_client") String? nameClient,
      @JsonKey(name: "hoursdelaylabel") String? hoursdelaylabel});
}

/// @nodoc
class __$$CommunicationImplCopyWithImpl<$Res>
    extends _$CommunicationCopyWithImpl<$Res, _$CommunicationImpl>
    implements _$$CommunicationImplCopyWith<$Res> {
  __$$CommunicationImplCopyWithImpl(
      _$CommunicationImpl _value, $Res Function(_$CommunicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCommunication = freezed,
    Object? fkClient = freezed,
    Object? fkUser = freezed,
    Object? dateCommunication = freezed,
    Object? result = freezed,
    Object? notes = freezed,
    Object? rate = freezed,
    Object? typeCommuncation = freezed,
    Object? numberWrong = freezed,
    Object? clientRepeat = freezed,
    Object? dateNext = freezed,
    Object? idInvoice = freezed,
    Object? iDcustomer = freezed,
    Object? userDo = freezed,
    Object? nameEnterprisecom = freezed,
    Object? address = freezed,
    Object? typeInstall = freezed,
    Object? dateLastComInstall = freezed,
    Object? clientOut = freezed,
    Object? school = freezed,
    Object? isSuspend = freezed,
    Object? isRecommendation = freezed,
    Object? isVisit = freezed,
    Object? userUpdate = freezed,
    Object? nameEnterprise = freezed,
    Object? nameUser = freezed,
    Object? dateCreate = freezed,
    Object? dateApprove = freezed,
    Object? dateinstallDone = freezed,
    Object? mobile = freezed,
    Object? fkRegoin = freezed,
    Object? nameRegoin = freezed,
    Object? nameClient = freezed,
    Object? hoursdelaylabel = freezed,
  }) {
    return _then(_$CommunicationImpl(
      idCommunication: freezed == idCommunication
          ? _value.idCommunication
          : idCommunication // ignore: cast_nullable_to_non_nullable
              as String?,
      fkClient: freezed == fkClient
          ? _value.fkClient
          : fkClient // ignore: cast_nullable_to_non_nullable
              as String?,
      fkUser: freezed == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCommunication: freezed == dateCommunication
          ? _value.dateCommunication
          : dateCommunication // ignore: cast_nullable_to_non_nullable
              as dynamic,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeCommuncation: freezed == typeCommuncation
          ? _value.typeCommuncation
          : typeCommuncation // ignore: cast_nullable_to_non_nullable
              as String?,
      numberWrong: freezed == numberWrong
          ? _value.numberWrong
          : numberWrong // ignore: cast_nullable_to_non_nullable
              as String?,
      clientRepeat: freezed == clientRepeat
          ? _value.clientRepeat
          : clientRepeat // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNext: freezed == dateNext
          ? _value.dateNext
          : dateNext // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idInvoice: freezed == idInvoice
          ? _value.idInvoice
          : idInvoice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      iDcustomer: freezed == iDcustomer
          ? _value.iDcustomer
          : iDcustomer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userDo: freezed == userDo
          ? _value.userDo
          : userDo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprisecom: freezed == nameEnterprisecom
          ? _value.nameEnterprisecom
          : nameEnterprisecom // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      typeInstall: freezed == typeInstall
          ? _value.typeInstall
          : typeInstall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateLastComInstall: freezed == dateLastComInstall
          ? _value.dateLastComInstall
          : dateLastComInstall // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientOut: freezed == clientOut
          ? _value.clientOut
          : clientOut // ignore: cast_nullable_to_non_nullable
              as dynamic,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuspend: freezed == isSuspend
          ? _value.isSuspend
          : isSuspend // ignore: cast_nullable_to_non_nullable
              as String?,
      isRecommendation: freezed == isRecommendation
          ? _value.isRecommendation
          : isRecommendation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isVisit: freezed == isVisit
          ? _value.isVisit
          : isVisit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userUpdate: freezed == userUpdate
          ? _value.userUpdate
          : userUpdate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreate: freezed == dateCreate
          ? _value.dateCreate
          : dateCreate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateApprove: freezed == dateApprove
          ? _value.dateApprove
          : dateApprove // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateinstallDone: freezed == dateinstallDone
          ? _value.dateinstallDone
          : dateinstallDone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      nameClient: freezed == nameClient
          ? _value.nameClient
          : nameClient // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursdelaylabel: freezed == hoursdelaylabel
          ? _value.hoursdelaylabel
          : hoursdelaylabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunicationImpl implements _Communication {
  const _$CommunicationImpl(
      {@JsonKey(name: "id_communication") this.idCommunication,
      @JsonKey(name: "fk_client") this.fkClient,
      @JsonKey(name: "fk_user") this.fkUser,
      @JsonKey(name: "date_communication") this.dateCommunication,
      @JsonKey(name: "result") this.result,
      @JsonKey(name: "notes") this.notes,
      @JsonKey(name: "rate") this.rate,
      @JsonKey(name: "type_communcation") this.typeCommuncation,
      @JsonKey(name: "number_wrong") this.numberWrong,
      @JsonKey(name: "client_repeat") this.clientRepeat,
      @JsonKey(name: "date_next") this.dateNext,
      @JsonKey(name: "id_invoice") this.idInvoice,
      @JsonKey(name: "IDcustomer") this.iDcustomer,
      @JsonKey(name: "user_do") this.userDo,
      @JsonKey(name: "name_enterprisecom") this.nameEnterprisecom,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "type_install") this.typeInstall,
      @JsonKey(name: "date_last_com_install") this.dateLastComInstall,
      @JsonKey(name: "client_out") this.clientOut,
      @JsonKey(name: "school") this.school,
      @JsonKey(name: "is_suspend") this.isSuspend,
      @JsonKey(name: "isRecommendation") this.isRecommendation,
      @JsonKey(name: "is_visit") this.isVisit,
      @JsonKey(name: "user_update") this.userUpdate,
      @JsonKey(name: "name_enterprise") this.nameEnterprise,
      @JsonKey(name: "nameUser") this.nameUser,
      @JsonKey(name: "date_create") this.dateCreate,
      @JsonKey(name: "date_approve") this.dateApprove,
      @JsonKey(name: "dateinstall_done") this.dateinstallDone,
      @JsonKey(name: "mobile") this.mobile,
      @JsonKey(name: "fk_regoin") this.fkRegoin,
      @JsonKey(name: "name_regoin") this.nameRegoin,
      @JsonKey(name: "name_client") this.nameClient,
      @JsonKey(name: "hoursdelaylabel") this.hoursdelaylabel});

  factory _$CommunicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationImplFromJson(json);

  @override
  @JsonKey(name: "id_communication")
  final String? idCommunication;
  @override
  @JsonKey(name: "fk_client")
  final String? fkClient;
  @override
  @JsonKey(name: "fk_user")
  final String? fkUser;
  @override
  @JsonKey(name: "date_communication")
  final dynamic dateCommunication;
  @override
  @JsonKey(name: "result")
  final dynamic result;
  @override
  @JsonKey(name: "notes")
  final dynamic notes;
  @override
  @JsonKey(name: "rate")
  final dynamic rate;
  @override
  @JsonKey(name: "type_communcation")
  final String? typeCommuncation;
  @override
  @JsonKey(name: "number_wrong")
  final String? numberWrong;
  @override
  @JsonKey(name: "client_repeat")
  final String? clientRepeat;
  @override
  @JsonKey(name: "date_next")
  final DateTime? dateNext;
  @override
  @JsonKey(name: "id_invoice")
  final dynamic idInvoice;
  @override
  @JsonKey(name: "IDcustomer")
  final dynamic iDcustomer;
  @override
  @JsonKey(name: "user_do")
  final dynamic userDo;
  @override
  @JsonKey(name: "name_enterprisecom")
  final dynamic nameEnterprisecom;
  @override
  @JsonKey(name: "address")
  final dynamic address;
  @override
  @JsonKey(name: "type_install")
  final dynamic typeInstall;
  @override
  @JsonKey(name: "date_last_com_install")
  final dynamic dateLastComInstall;
  @override
  @JsonKey(name: "client_out")
  final dynamic clientOut;
  @override
  @JsonKey(name: "school")
  final String? school;
  @override
  @JsonKey(name: "is_suspend")
  final String? isSuspend;
  @override
  @JsonKey(name: "isRecommendation")
  final dynamic isRecommendation;
  @override
  @JsonKey(name: "is_visit")
  final dynamic isVisit;
  @override
  @JsonKey(name: "user_update")
  final dynamic userUpdate;
  @override
  @JsonKey(name: "name_enterprise")
  final String? nameEnterprise;
  @override
  @JsonKey(name: "nameUser")
  final String? nameUser;
  @override
  @JsonKey(name: "date_create")
  final dynamic dateCreate;
  @override
  @JsonKey(name: "date_approve")
  final dynamic dateApprove;
  @override
  @JsonKey(name: "dateinstall_done")
  final dynamic dateinstallDone;
  @override
  @JsonKey(name: "mobile")
  final String? mobile;
  @override
  @JsonKey(name: "fk_regoin")
  final String? fkRegoin;
  @override
  @JsonKey(name: "name_regoin")
  final String? nameRegoin;
  @override
  @JsonKey(name: "name_client")
  final String? nameClient;
  @override
  @JsonKey(name: "hoursdelaylabel")
  final String? hoursdelaylabel;

  @override
  String toString() {
    return 'Communication(idCommunication: $idCommunication, fkClient: $fkClient, fkUser: $fkUser, dateCommunication: $dateCommunication, result: $result, notes: $notes, rate: $rate, typeCommuncation: $typeCommuncation, numberWrong: $numberWrong, clientRepeat: $clientRepeat, dateNext: $dateNext, idInvoice: $idInvoice, iDcustomer: $iDcustomer, userDo: $userDo, nameEnterprisecom: $nameEnterprisecom, address: $address, typeInstall: $typeInstall, dateLastComInstall: $dateLastComInstall, clientOut: $clientOut, school: $school, isSuspend: $isSuspend, isRecommendation: $isRecommendation, isVisit: $isVisit, userUpdate: $userUpdate, nameEnterprise: $nameEnterprise, nameUser: $nameUser, dateCreate: $dateCreate, dateApprove: $dateApprove, dateinstallDone: $dateinstallDone, mobile: $mobile, fkRegoin: $fkRegoin, nameRegoin: $nameRegoin, nameClient: $nameClient, hoursdelaylabel: $hoursdelaylabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationImpl &&
            (identical(other.idCommunication, idCommunication) ||
                other.idCommunication == idCommunication) &&
            (identical(other.fkClient, fkClient) ||
                other.fkClient == fkClient) &&
            (identical(other.fkUser, fkUser) || other.fkUser == fkUser) &&
            const DeepCollectionEquality()
                .equals(other.dateCommunication, dateCommunication) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            (identical(other.typeCommuncation, typeCommuncation) ||
                other.typeCommuncation == typeCommuncation) &&
            (identical(other.numberWrong, numberWrong) ||
                other.numberWrong == numberWrong) &&
            (identical(other.clientRepeat, clientRepeat) ||
                other.clientRepeat == clientRepeat) &&
            (identical(other.dateNext, dateNext) ||
                other.dateNext == dateNext) &&
            const DeepCollectionEquality().equals(other.idInvoice, idInvoice) &&
            const DeepCollectionEquality()
                .equals(other.iDcustomer, iDcustomer) &&
            const DeepCollectionEquality().equals(other.userDo, userDo) &&
            const DeepCollectionEquality()
                .equals(other.nameEnterprisecom, nameEnterprisecom) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.typeInstall, typeInstall) &&
            const DeepCollectionEquality()
                .equals(other.dateLastComInstall, dateLastComInstall) &&
            const DeepCollectionEquality().equals(other.clientOut, clientOut) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.isSuspend, isSuspend) ||
                other.isSuspend == isSuspend) &&
            const DeepCollectionEquality()
                .equals(other.isRecommendation, isRecommendation) &&
            const DeepCollectionEquality().equals(other.isVisit, isVisit) &&
            const DeepCollectionEquality()
                .equals(other.userUpdate, userUpdate) &&
            (identical(other.nameEnterprise, nameEnterprise) ||
                other.nameEnterprise == nameEnterprise) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            const DeepCollectionEquality()
                .equals(other.dateCreate, dateCreate) &&
            const DeepCollectionEquality()
                .equals(other.dateApprove, dateApprove) &&
            const DeepCollectionEquality()
                .equals(other.dateinstallDone, dateinstallDone) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.fkRegoin, fkRegoin) ||
                other.fkRegoin == fkRegoin) &&
            (identical(other.nameRegoin, nameRegoin) ||
                other.nameRegoin == nameRegoin) &&
            (identical(other.nameClient, nameClient) ||
                other.nameClient == nameClient) &&
            (identical(other.hoursdelaylabel, hoursdelaylabel) ||
                other.hoursdelaylabel == hoursdelaylabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idCommunication,
        fkClient,
        fkUser,
        const DeepCollectionEquality().hash(dateCommunication),
        const DeepCollectionEquality().hash(result),
        const DeepCollectionEquality().hash(notes),
        const DeepCollectionEquality().hash(rate),
        typeCommuncation,
        numberWrong,
        clientRepeat,
        dateNext,
        const DeepCollectionEquality().hash(idInvoice),
        const DeepCollectionEquality().hash(iDcustomer),
        const DeepCollectionEquality().hash(userDo),
        const DeepCollectionEquality().hash(nameEnterprisecom),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(typeInstall),
        const DeepCollectionEquality().hash(dateLastComInstall),
        const DeepCollectionEquality().hash(clientOut),
        school,
        isSuspend,
        const DeepCollectionEquality().hash(isRecommendation),
        const DeepCollectionEquality().hash(isVisit),
        const DeepCollectionEquality().hash(userUpdate),
        nameEnterprise,
        nameUser,
        const DeepCollectionEquality().hash(dateCreate),
        const DeepCollectionEquality().hash(dateApprove),
        const DeepCollectionEquality().hash(dateinstallDone),
        mobile,
        fkRegoin,
        nameRegoin,
        nameClient,
        hoursdelaylabel
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunicationImplCopyWith<_$CommunicationImpl> get copyWith =>
      __$$CommunicationImplCopyWithImpl<_$CommunicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunicationImplToJson(
      this,
    );
  }
}

abstract class _Communication implements Communication {
  const factory _Communication(
      {@JsonKey(name: "id_communication") final String? idCommunication,
      @JsonKey(name: "fk_client") final String? fkClient,
      @JsonKey(name: "fk_user") final String? fkUser,
      @JsonKey(name: "date_communication") final dynamic dateCommunication,
      @JsonKey(name: "result") final dynamic result,
      @JsonKey(name: "notes") final dynamic notes,
      @JsonKey(name: "rate") final dynamic rate,
      @JsonKey(name: "type_communcation") final String? typeCommuncation,
      @JsonKey(name: "number_wrong") final String? numberWrong,
      @JsonKey(name: "client_repeat") final String? clientRepeat,
      @JsonKey(name: "date_next") final DateTime? dateNext,
      @JsonKey(name: "id_invoice") final dynamic idInvoice,
      @JsonKey(name: "IDcustomer") final dynamic iDcustomer,
      @JsonKey(name: "user_do") final dynamic userDo,
      @JsonKey(name: "name_enterprisecom") final dynamic nameEnterprisecom,
      @JsonKey(name: "address") final dynamic address,
      @JsonKey(name: "type_install") final dynamic typeInstall,
      @JsonKey(name: "date_last_com_install") final dynamic dateLastComInstall,
      @JsonKey(name: "client_out") final dynamic clientOut,
      @JsonKey(name: "school") final String? school,
      @JsonKey(name: "is_suspend") final String? isSuspend,
      @JsonKey(name: "isRecommendation") final dynamic isRecommendation,
      @JsonKey(name: "is_visit") final dynamic isVisit,
      @JsonKey(name: "user_update") final dynamic userUpdate,
      @JsonKey(name: "name_enterprise") final String? nameEnterprise,
      @JsonKey(name: "nameUser") final String? nameUser,
      @JsonKey(name: "date_create") final dynamic dateCreate,
      @JsonKey(name: "date_approve") final dynamic dateApprove,
      @JsonKey(name: "dateinstall_done") final dynamic dateinstallDone,
      @JsonKey(name: "mobile") final String? mobile,
      @JsonKey(name: "fk_regoin") final String? fkRegoin,
      @JsonKey(name: "name_regoin") final String? nameRegoin,
      @JsonKey(name: "name_client") final String? nameClient,
      @JsonKey(name: "hoursdelaylabel")
      final String? hoursdelaylabel}) = _$CommunicationImpl;

  factory _Communication.fromJson(Map<String, dynamic> json) =
      _$CommunicationImpl.fromJson;

  @override
  @JsonKey(name: "id_communication")
  String? get idCommunication;
  @override
  @JsonKey(name: "fk_client")
  String? get fkClient;
  @override
  @JsonKey(name: "fk_user")
  String? get fkUser;
  @override
  @JsonKey(name: "date_communication")
  dynamic get dateCommunication;
  @override
  @JsonKey(name: "result")
  dynamic get result;
  @override
  @JsonKey(name: "notes")
  dynamic get notes;
  @override
  @JsonKey(name: "rate")
  dynamic get rate;
  @override
  @JsonKey(name: "type_communcation")
  String? get typeCommuncation;
  @override
  @JsonKey(name: "number_wrong")
  String? get numberWrong;
  @override
  @JsonKey(name: "client_repeat")
  String? get clientRepeat;
  @override
  @JsonKey(name: "date_next")
  DateTime? get dateNext;
  @override
  @JsonKey(name: "id_invoice")
  dynamic get idInvoice;
  @override
  @JsonKey(name: "IDcustomer")
  dynamic get iDcustomer;
  @override
  @JsonKey(name: "user_do")
  dynamic get userDo;
  @override
  @JsonKey(name: "name_enterprisecom")
  dynamic get nameEnterprisecom;
  @override
  @JsonKey(name: "address")
  dynamic get address;
  @override
  @JsonKey(name: "type_install")
  dynamic get typeInstall;
  @override
  @JsonKey(name: "date_last_com_install")
  dynamic get dateLastComInstall;
  @override
  @JsonKey(name: "client_out")
  dynamic get clientOut;
  @override
  @JsonKey(name: "school")
  String? get school;
  @override
  @JsonKey(name: "is_suspend")
  String? get isSuspend;
  @override
  @JsonKey(name: "isRecommendation")
  dynamic get isRecommendation;
  @override
  @JsonKey(name: "is_visit")
  dynamic get isVisit;
  @override
  @JsonKey(name: "user_update")
  dynamic get userUpdate;
  @override
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise;
  @override
  @JsonKey(name: "nameUser")
  String? get nameUser;
  @override
  @JsonKey(name: "date_create")
  dynamic get dateCreate;
  @override
  @JsonKey(name: "date_approve")
  dynamic get dateApprove;
  @override
  @JsonKey(name: "dateinstall_done")
  dynamic get dateinstallDone;
  @override
  @JsonKey(name: "mobile")
  String? get mobile;
  @override
  @JsonKey(name: "fk_regoin")
  String? get fkRegoin;
  @override
  @JsonKey(name: "name_regoin")
  String? get nameRegoin;
  @override
  @JsonKey(name: "name_client")
  String? get nameClient;
  @override
  @JsonKey(name: "hoursdelaylabel")
  String? get hoursdelaylabel;
  @override
  @JsonKey(ignore: true)
  _$$CommunicationImplCopyWith<_$CommunicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
