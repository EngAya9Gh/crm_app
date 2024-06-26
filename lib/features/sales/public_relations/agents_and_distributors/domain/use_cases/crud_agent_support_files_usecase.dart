import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../data/models/agent_distributor_model.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class CrudAgentSupportFilesUsecase extends UseCase<
    Either<String, AgentDistributorModel>, CrudAgentSupportFilesParams> {
  final AgentsDistributorsProfileRepo _repository;

  CrudAgentSupportFilesUsecase(this._repository);

  @override
  Future<Either<String, AgentDistributorModel>> call(
    CrudAgentSupportFilesParams params,
  ) async {
    return await _repository.crudAgentSupportFiles(params);
  }
}

class CrudAgentSupportFilesParams {
  final String agentId;
  final List<String> deletedFiles;
  final List<File> addedFiles;

  const CrudAgentSupportFilesParams({
    required this.agentId,
    required this.deletedFiles,
    required this.addedFiles,
  });

  // to map
  Map<String, dynamic> toMap() {
    final filesParam = <String, dynamic>{};
    for (var i = 0; i < deletedFiles.length; i++) {
      filesParam['id_files[$i]'] = deletedFiles[i];
    }

    return {
      ...filesParam,
    };
  }
}
