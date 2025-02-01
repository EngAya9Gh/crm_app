import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

import '../../../../../core/common/enums/client/client_debt_type_enum.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/invoices_section_repo.dart';

@lazySingleton
class GetInvoicesByPrivilegesUsecase extends BaseUsecase<Either<String, dynamic>, GetInvoicesByPrivilegesParams> {
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
  final int page;
  final int? limit;
  final int? statusInvoice;
  final SellerTypeEnum? typeSeller;
  final String? fkRegionInvoice;
  final String? fkRegion;
  final String? filter;
  final String? typeReadyClient;
  final List<TypeOfInvoice>? invoiceType;
  final String? from;
  final String? to;
  final String? searchQuery;
  final String? fkAgent;
  final String? participateFk;
  final String? fkIdUser;
  final String? hasDevices;
  final String? download;
  final bool? fromPage;

  const GetInvoicesByPrivilegesParams({
    this.skip = 0,
    this.page = 1,
    this.limit = AppConstants.kPerPage,
    this.typeSeller,
    this.fkRegionInvoice,
    this.fkRegion,
    this.typeReadyClient,
    this.invoiceType,
    this.from,
    this.statusInvoice,
    this.to,
    this.searchQuery,
    this.filter,
    this.fkAgent,
    this.participateFk,
    this.fkIdUser,
    this.hasDevices,
    this.download,
    this.fromPage,
  });

  GetInvoicesByPrivilegesParams copyWith({
    int? skip,
    int? page,
    int? limit,
    int? statusInvoice,
    SellerTypeEnum? typeSeller,
    String? fkRegionInvoice,
    ValueGetter<String?>? fkRegion,
    String? typeReadyClient,
    ValueGetter<List<TypeOfInvoice>>? invoiceType,
    String? from,
    String? to,
    String? searchQuery,
    ValueGetter<String?>? filter,
    String? fkAgent,
    String? participateFk,
    String? fkIdUser,
    String? hasDevices,
    String? download,
    bool? fromPage,
  }) {
    return GetInvoicesByPrivilegesParams(
      skip: skip ?? this.skip,
      page: page ?? this.page,
      limit: limit ?? this.limit ?? AppConstants.kPerPage,
      typeSeller: typeSeller ?? this.typeSeller,
      fkRegionInvoice: fkRegionInvoice ?? this.fkRegionInvoice,
      typeReadyClient: _assignNull(currentValue: this.typeReadyClient, newValue: typeReadyClient),
      from: from ?? this.from,
      to: to ?? this.to,
      searchQuery: searchQuery ?? this.searchQuery,
      filter: filter != null ? filter() : this.filter,
      fkAgent: _assignNull(currentValue: this.fkAgent, newValue: fkAgent),
      participateFk: _assignNull(currentValue: this.participateFk, newValue: participateFk),
      fkIdUser: _assignNull(currentValue: this.fkIdUser, newValue: fkIdUser),
      hasDevices: _assignNull(currentValue: this.hasDevices, newValue: hasDevices),
      download: download ?? this.download,
      statusInvoice: statusInvoice ?? this.statusInvoice,
      invoiceType: invoiceType != null ? invoiceType() : this.invoiceType,
      fromPage: fromPage ?? this.fromPage,
      fkRegion: fkRegion != null ? fkRegion() : this.fkRegion,
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
    var mapType = {};
    invoiceType?.forEachIndexed(
      (index, element) => mapType.addAll({
        'state_invoice[$index]': element.value,
      }),
    );
    data['page'] = (fromPage ?? false) ? page : ApiHelper.calculatePage(skip: skip, limit: limit);
    data['limit'] = limit;
    data['type_seller'] = typeSeller?.toParam;
    data['fk_regoin_invoice'] = fkRegionInvoice;
    data['fk_regoin'] = fkRegion;
    data['TypeReadyClient'] = typeReadyClient;
    if (statusInvoice == StatusOfInvoice.cancelApprovement.value) data['cancel_approvement'] = 1;
    if (statusInvoice == StatusOfInvoice.cancelWithdraw.value) data['cancel_withdraw'] = 1;
    data['from'] = from;
    data['to'] = to;
    data['search_query'] = searchQuery;
    if (filter != null) data['filter'] = filter;
    data['fk_agent'] = fkAgent;
    data['participate_fk'] = participateFk;
    data['fk_idUser'] = fkIdUser;
    data['has_devices'] = hasDevices;
    if (download != null) data['download'] = download;
    return data..addAll({if (mapType.isNotEmpty) ...mapType});
  }
}
