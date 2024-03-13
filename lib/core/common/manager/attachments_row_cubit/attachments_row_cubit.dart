import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../features/clients_list/data/models/client_support_file_model.dart';
import '../../../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart';
import '../../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';

part 'attachments_row_state.dart';

@injectable
class AttachmentsRowCubit extends Cubit<AttachmentsRowState> {
  AttachmentsRowCubit(
    this._getClientSupportFilesUsecase,
    this._crudClientSupportFilesUsecase,
  ) : super(AttachmentsRowInitial());

  final GetClientSupportFilesUsecase _getClientSupportFilesUsecase;
  final CrudClientSupportFilesUsecase _crudClientSupportFilesUsecase;

  String invoiceId = '';
  List<ClientSupportFileModel> _selectedFilesList = [];

  List<ClientSupportFileModel> get selectedFilesList => _selectedFilesList;
  List<ClientSupportFileModel> _allFilesList = [];

  List<ClientSupportFileModel> get allFilesList => _allFilesList;
  List<ClientSupportFileModel> _deletedFilesList = [];

  List<ClientSupportFileModel> get deletedFilesList => _deletedFilesList;

  Future<void> getClientSupportFiles(GetClientSupportFilesParams params) async {
    emit(AttachmentsRowLoading());

    final response = await _getClientSupportFilesUsecase(params);

    response.fold((l) {
      emit(AttachmentsRowError(message: l));
    }, (r) {
      _allFilesList = r;
      emit(AttachmentsRowLoaded());
    });
  }

  void addFile(File file) {
    final fileModel = ClientSupportFileModel.fromFile(file);
    _selectedFilesList.add(fileModel);
    _allFilesList.add(fileModel);
    emit(AttachmentsRowLoaded());
  }

  void deleteFile(ClientSupportFileModel file) {
    _allFilesList.remove(file);
    _deletedFilesList.add(file);
    emit(AttachmentsRowLoaded());
  }

  FutureOr<void> saveFilesChanges() async {
    emit(SaveChangesLoading());

    final params = CrudClientSupportFilesParams(
      invoiceId: invoiceId,
      deletedFiles: _deletedFilesList.map((e) => e.id).toList(),
      addedFiles: _selectedFilesList.map((e) => e.file!).toList(),
    );

    final response = await _crudClientSupportFilesUsecase(params);

    response.fold((l) {
      emit(SaveChangesError(message: l));
    }, (r) {
      clear();
      emit(SaveChangesSuccess());
    });
  }

  // clear function
  void clear() {
    _selectedFilesList.clear();
    _deletedFilesList.clear();
  }
}
