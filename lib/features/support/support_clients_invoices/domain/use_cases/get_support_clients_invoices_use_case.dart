import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../helpers/support_invoice_filter.dart';
import '../repositories/support_clients_invoices_repo.dart';

@lazySingleton
class GetSupportClientsInvoicesUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>,
    GetSupportClientsInvoicesParams> {
  GetSupportClientsInvoicesUseCase(this._repository);

  final SupportClientsInvoicesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetSupportClientsInvoicesParams params,
  ) async {
    return await _repository.getSupportClientInvoices(params);
  }
}

class GetSupportClientsInvoicesParams {
  final String fkCountry;
  final String? searchQuery;
  final List<CityModel> selectedCities;
  final List<RegionModel> listSelectedRegions;
  final String? state;
  final int page;
  final int limit;

  const GetSupportClientsInvoicesParams({
    required this.fkCountry,
    required this.selectedCities,
    required this.listSelectedRegions,
    this.searchQuery,
    this.state,
    this.page = 1,
    this.limit = AppConstants.kPerPage,
  });

  Map<String, dynamic> toParams() {
    return SupportInvoiceFilter(
      selectedCities: selectedCities,
      listSelectedRegions: listSelectedRegions,
      state: state,
    ).prepareQueryParams(
      fkCountry: fkCountry,
      searchQuery: searchQuery,
      page: ApiHelper.calculatePage(skip: page, limit: limit),
      limit: limit,
    );
  }

  Map<String, dynamic> toBody() {
    return SupportInvoiceFilter(
      selectedCities: selectedCities,
      listSelectedRegions: listSelectedRegions,
      state: state,
    ).prepareData();
  }
}
