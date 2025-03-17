part of 'versions_bloc.dart';

@immutable
class VersionsState {
  final List<VersionModel> listVersionsState;
  final BlocStatus<List<VersionModel>> getAllVersionsStatus;
  final BlocStatus<IconmmingUpdateInfo> incommingUpdateInfo;
  final GetVersionsParams getVersionsParams;
  final bool hasReachedEnd;
final List<OneItemVersionEntity> listAddNew;
  const VersionsState({
    this.listVersionsState = const [],
    this.listAddNew = const [OneItemVersionEntity(index: 0)],
    this.getAllVersionsStatus = const BlocStatus<List<VersionModel>>.initial(),
    this.getVersionsParams = const GetVersionsParams(),
    this.hasReachedEnd = false,
    this.incommingUpdateInfo=const BlocStatus.initial()
  });

  VersionsState copyWith({
    List<VersionModel>? listVersionsState,
    BlocStatus<List<VersionModel>>? getAllVersionsStatus,
    GetVersionsParams? getVersionsParams,
    bool? hasReachedEnd,
    List<OneItemVersionEntity>? listAddNew,
  BlocStatus<IconmmingUpdateInfo>? incommingUpdateInfo,
  }) {
    return VersionsState(
      listVersionsState: listVersionsState ?? this.listVersionsState,
      getAllVersionsStatus: getAllVersionsStatus ?? this.getAllVersionsStatus,
      getVersionsParams: getVersionsParams ?? this.getVersionsParams,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      listAddNew: listAddNew ?? this.listAddNew,
      incommingUpdateInfo: incommingUpdateInfo ?? this.incommingUpdateInfo,
    );
  }
}
