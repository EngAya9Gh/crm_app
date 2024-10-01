import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/invoices_section_repo.dart';

@lazySingleton
class GetInvoicesByPrivilegesUsecase extends BaseUsecase<
    Either<String, dynamic>, GetInvoicesByPrivilegesParams> {
  GetInvoicesByPrivilegesUsecase(this._repository);

  final InvoicesSectionRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    GetInvoicesByPrivilegesParams params,
  ) async {
    return await _repository.getInvoiceByPrivileges(params);
  }
}

class GetInvoicesByPrivilegesParams {
  final int skip;
  final int? limit;
  final SellerTypeEnum? typeSeller;
  final String? fkRegionInvoice;
  final String? typeReadyClient;
  final String? from;
  final String? to;
  final String? searchQuery;
  final String? fkAgent;
  final String? participateFk;
  final String? fkIdUser;
  final String? hasDevices;
  final String? download;

  GetInvoicesByPrivilegesParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.typeSeller,
    this.fkRegionInvoice,
    this.typeReadyClient,
    this.from,
    this.to,
    this.searchQuery,
    this.fkAgent,
    this.participateFk,
    this.fkIdUser,
    this.hasDevices,
    this.download,
  });

  GetInvoicesByPrivilegesParams copyWith({
    int? skip,
    int? limit,
    SellerTypeEnum? typeSeller,
    String? fkRegionInvoice,
    String? typeReadyClient,
    String? from,
    String? to,
    String? searchQuery,
    String? fkAgent,
    String? participateFk,
    String? fkIdUser,
    String? hasDevices,
    String? download,
  }) {
    return GetInvoicesByPrivilegesParams(
      skip: skip ?? this.skip,
      limit: limit ?? this.limit ?? AppConstants.kPerPage,
      typeSeller: typeSeller ?? this.typeSeller,
      fkRegionInvoice: fkRegionInvoice ?? this.fkRegionInvoice,
      typeReadyClient: _assignNull(
          currentValue: this.typeReadyClient, newValue: typeReadyClient),
      from: from ?? this.from,
      to: to ?? this.to,
      searchQuery: searchQuery ?? this.searchQuery,
      fkAgent: _assignNull(currentValue: this.fkAgent, newValue: fkAgent),
      participateFk: _assignNull(
          currentValue: this.participateFk, newValue: participateFk),
      fkIdUser: _assignNull(currentValue: this.fkIdUser, newValue: fkIdUser),
      hasDevices:
          _assignNull(currentValue: this.hasDevices, newValue: hasDevices),
      download: download ?? this.download,
    );
  }

  _assignNull({dynamic currentValue, dynamic newValue}) {
    if (newValue == '') {
      return null;
    }
    if (newValue == null) {
      return currentValue;
    }
    return newValue;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = ApiHelper.calculatePage(skip: skip, limit: limit);
    data['limit'] = limit;
    data['type_seller'] = typeSeller?.toParam;
    data['fk_regoin_invoice'] = fkRegionInvoice;
    data['TypeReadyClient'] = typeReadyClient;
    data['from'] = from;
    data['to'] = to;
    data['search_query'] = searchQuery;
    data['fk_agent'] = fkAgent;
    data['participate_fk'] = participateFk;
    data['fk_idUser'] = fkIdUser;
    data['has_devices'] = hasDevices;
    if (download != null) data['download'] = download;
    return data;
  }
}
