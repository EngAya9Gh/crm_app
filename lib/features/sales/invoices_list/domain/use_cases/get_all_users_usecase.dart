import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/invoices_section_repo.dart';

@lazySingleton
class GetAllUsersUseCase
    extends UseCase<Either<String, List<UserModel>>, GetAllUsersParams> {
  final InvoicesSectionRepo repository;

  GetAllUsersUseCase(this.repository);

  @override
  Future<Either<String, List<UserModel>>> call(GetAllUsersParams params) {
    return repository.getAllUsers(params);
  }
}

class GetAllUsersParams {
  const GetAllUsersParams();
}
