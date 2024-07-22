import '../use_cases/get_all_users_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../model/usermodel.dart';
import '../use_cases/get_invoices_by_privileges_usecase.dart';

abstract interface class InvoicesSectionRepo {
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
      GetInvoicesByPrivilegesParams params);

  Future<Either<String, List<UserModel>>> getAllUsers(GetAllUsersParams params);
}
