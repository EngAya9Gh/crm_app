import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/communication_list/data/data_sources/communication_list_datasource.dart';
import 'package:crm_smart/features/communication_list/data/models/communication_list_response.dart';
import 'package:crm_smart/features/communication_list/domain/repositories/communication_list_repository.dart';
import 'package:crm_smart/features/invoices/domain/repositories/invoices_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InvoicesRepository)
class InvoicesRepositoryImpl implements InvoicesRepository {
  final InvoicesRepository datasource;

  InvoicesRepositoryImpl(this.datasource);


}
