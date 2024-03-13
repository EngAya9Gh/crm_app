import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../features/clients_list/data/models/client_support_file_model.dart';
import '../../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../helpers/check_sorage_permission.dart';

part 'attachments_row_state.dart';

@injectable
class AttachmentsRowCubit extends Cubit<AttachmentsRowState> {
  AttachmentsRowCubit(this._getClientSupportFilesUsecase)
      : super(AttachmentsRowInitial());

  final GetClientSupportFilesUsecase _getClientSupportFilesUsecase;

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

  pickImages() async {
    if (!(await checkStoragePermission())) return;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'webp', 'dng', 'heic', 'pdf'],
      type: FileType.custom,
    );
    if (result == null) {
      return;
    }

    if (result.files.length > 20) {
      emit(AttachmentsRowError(message: 'أكثر عدد مسموح به هو 20 ملف.'));
      return;
    }

    final files = result.files.map((e) {
      return ClientSupportFileModel(
        fileUrl: e.path ?? '',
        invoiceId: '',
        typeFile: '1',
        id: '',
      );
    }).toList();
  }

  void addFile(ClientSupportFileModel file) {
    _selectedFilesList.add(file);
    _allFilesList.add(file);
    emit(AttachmentsRowLoaded());
  }

  void deleteFile(ClientSupportFileModel file) {
    _allFilesList.remove(file);
    _deletedFilesList.add(file);
    emit(AttachmentsRowLoaded());
  }
}
