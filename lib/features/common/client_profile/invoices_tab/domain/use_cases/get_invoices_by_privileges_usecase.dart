import 'package:crm_smart/core/common/enums/seller_type_enum.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/repositories/invoices_tab_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';

@lazySingleton
class GetInvoicesByPrivilegesUsecase
    extends UseCase<Either<String, dynamic>, GetInvoicesByPrivilegesParams> {
  GetInvoicesByPrivilegesUsecase(this._repository);

  final InvoicesTabRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    GetInvoicesByPrivilegesParams params,
  ) async {
    return await _repository.getInvoiceByPrivileges(params);
  }
}

class GetInvoicesByPrivilegesParams {
  final int skip;
  final int limit;
  final SellerTypeEnum? typeSeller;
  final String? fkRegionInvoice;
  final String? typeReadyClient;
  final String? from;
  final String? to;
  final String? searchQuery;
  final String? fkAgent;
  final String? participateFk;
  final String? fkIdUser;

  const GetInvoicesByPrivilegesParams({
    this.skip = 1,
    this.limit = 15,
    this.typeSeller,
    this.fkRegionInvoice,
    this.typeReadyClient,
    this.from,
    this.to,
    this.searchQuery,
    this.fkAgent,
    this.participateFk,
    this.fkIdUser,
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
  }) {
    return GetInvoicesByPrivilegesParams(
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
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
    data['page'] = (skip / limit).ceil() + 1;
    data['limit'] = limit;
    data['type_seller'] = typeSeller?.value;
    data['fk_regoin_invoice'] = fkRegionInvoice;
    data['TypeReadyClient'] = typeReadyClient;
    data['from'] = from;
    data['to'] = to;
    data['search_query'] = searchQuery;
    data['fk_agent'] = fkAgent;
    data['participate_fk'] = participateFk;
    data['fk_idUser'] = fkIdUser;
    return data;
  }
}
