part of 'versions_bloc.dart';

enum DemandVersion {
  review(text: "مراجعة",color:Colors.deepPurpleAccent),
  secheduled(text: "مجدول",color:Colors.deepPurple),
  suspended(text: "معلق",color:Colors.purple),
  deleted(text: "محذوف",color:Colors.red),
  inDevelopment(text: "قيد التطوير",color:Colors.lightGreenAccent),
  done(text: "تم الانتهاء",color:Colors.green);

  final String text;
  final Color color;
  const DemandVersion({required this.text,required this.color});
}

@immutable
class VersionsState {
  final List<VersionModel> listVersionsState;
  final BlocStatus<List<VersionModel>> getAllVersionsStatus;
  final BlocStatus<IconmmingUpdateInfo> incommingUpdateInfo;
  final GetVersionsParams getVersionsParams;
  final bool hasReachedEnd;
  final List<OneItemVersionEntity> listAddNew;
  final BlocStatus<DemandModel> addDemandStatus;
  final BlocStatus<List<DemandModel>> getDemands;
  const VersionsState({
    this.listVersionsState = const [],
    this.listAddNew = const [OneItemVersionEntity(index: 0)],
    this.getAllVersionsStatus = const BlocStatus<List<VersionModel>>.initial(),
    this.getVersionsParams = const GetVersionsParams(),
    this.hasReachedEnd = false,
    this.incommingUpdateInfo = const BlocStatus.initial(),
    this.addDemandStatus = const BlocStatus.initial(),
    this.getDemands = const BlocStatus.initial(),
  });

  VersionsState copyWith({
    List<VersionModel>? listVersionsState,
    BlocStatus<List<VersionModel>>? getAllVersionsStatus,
    GetVersionsParams? getVersionsParams,
    bool? hasReachedEnd,
    List<OneItemVersionEntity>? listAddNew,
    BlocStatus<IconmmingUpdateInfo>? incommingUpdateInfo,
    BlocStatus<DemandModel>? addDemandStatus,
    BlocStatus<List<DemandModel>>? getDemands,
  }) {
    return VersionsState(
      listVersionsState: listVersionsState ?? this.listVersionsState,
      getAllVersionsStatus: getAllVersionsStatus ?? this.getAllVersionsStatus,
      getVersionsParams: getVersionsParams ?? this.getVersionsParams,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      listAddNew: listAddNew ?? this.listAddNew,
      incommingUpdateInfo: incommingUpdateInfo ?? this.incommingUpdateInfo,
      addDemandStatus: addDemandStatus ?? this.addDemandStatus,
      getDemands: getDemands ?? this.getDemands,
    );
  }
}
