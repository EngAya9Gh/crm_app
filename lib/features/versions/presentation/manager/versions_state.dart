part of 'versions_bloc.dart';

enum DemandVersionStatus {
  review(text: "مراجعة", color: Colors.deepPurpleAccent),
  secheduled(text: "مجدول", color: Colors.brown),
  suspended(text: "معلق", color: Colors.cyan),
  deleted(text: "محذوف", color: Colors.red),
  inDevelopment(text: "قيد التطوير", color: Colors.pink),
  done(text: "تم الانتهاء", color: Colors.green);

  final String text;
  final Color color;
  const DemandVersionStatus({required this.text, required this.color});
}

@immutable
class VersionsState {
  final FilterDemandEntity filterEntity;

  final List<VersionModel> listVersionsState;
  final BlocStatus<List<VersionModel>> getAllVersionsStatus;
  final BlocStatus<IconmmingUpdateInfo> incommingUpdateInfo;
  final GetVersionsParams getVersionsParams;
  final bool hasReachedMax;
  final List<OneItemVersionEntity> listAddNew;
  final BlocStatus<DemandModel> addDemandStatus;
  final BlocStatus<List<DemandModel>> getListDemands;
  final BlocStatus getDemandStatus;
  final BlocStatus<DemandModel> changeDemandStatus;
  final BlocStatus<CommentModel> addCommentDemand;
  final BlocStatus<List<CommentModel>> getCommentsDemand;
  final GetDemandParams params;
  final int totalDataCount;
  VersionsState({
    final FilterDemandEntity? filterEntity,
    this.listVersionsState = const [],
    this.listAddNew = const [OneItemVersionEntity(index: 0)],
    this.getAllVersionsStatus = const BlocStatus<List<VersionModel>>.initial(),
    this.getVersionsParams = const GetVersionsParams(),
    this.hasReachedMax = false,
    this.incommingUpdateInfo = const BlocStatus.initial(),
    this.addDemandStatus = const BlocStatus.initial(),
    this.getListDemands = const BlocStatus.initial(),
    this.getDemandStatus = const BlocStatus.initial(),
    this.changeDemandStatus = const BlocStatus.initial(),
    this.addCommentDemand = const BlocStatus.initial(),
    this.getCommentsDemand = const BlocStatus.initial(),
    this.params = const GetDemandParams(),
    this.totalDataCount = 0,
  }) : filterEntity = filterEntity ?? FilterDemandEntity();

  VersionsState copyWith({
    List<VersionModel>? listVersionsState,
    BlocStatus<List<VersionModel>>? getAllVersionsStatus,
    GetVersionsParams? getVersionsParams,
    bool? hasReachedMax,
    List<OneItemVersionEntity>? listAddNew,
    BlocStatus<IconmmingUpdateInfo>? incommingUpdateInfo,
    BlocStatus<DemandModel>? addDemandStatus,
    BlocStatus<List<DemandModel>>? getListDemands,
    BlocStatus? getDemandStatus,
    final BlocStatus<DemandModel>? changeDemandStatus,
    final BlocStatus<CommentModel>? addCommentDemand,
    final BlocStatus<List<CommentModel>>? getCommentsDemand,
    GetDemandParams? params,
    int? totalDataCount,
  }) {
    return VersionsState(
      listVersionsState: listVersionsState ?? this.listVersionsState,
      getAllVersionsStatus: getAllVersionsStatus ?? this.getAllVersionsStatus,
      getVersionsParams: getVersionsParams ?? this.getVersionsParams,
      listAddNew: listAddNew ?? this.listAddNew,
      incommingUpdateInfo: incommingUpdateInfo ?? this.incommingUpdateInfo,
      addDemandStatus: addDemandStatus ?? this.addDemandStatus,
      getListDemands: getListDemands ?? this.getListDemands,
      getDemandStatus: getDemandStatus ?? this.getDemandStatus,
      changeDemandStatus: changeDemandStatus ?? this.changeDemandStatus,
      addCommentDemand: addCommentDemand ?? this.addCommentDemand,
      getCommentsDemand: getCommentsDemand ?? this.getCommentsDemand,
      params: params ?? this.params,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalDataCount: totalDataCount ?? this.totalDataCount,
    );
  }
}
