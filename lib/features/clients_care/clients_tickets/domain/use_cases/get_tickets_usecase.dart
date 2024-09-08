import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../data/models/ticket_category_model.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class GetTicketsUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetTicketsParams> {
  GetTicketsUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetTicketsParams params,
  ) async {
    return await _repository.getTickets(params);
  }
}

class GetTicketsParams {
  final int skip;
  final int limit;
  final String filter;
  final TicketTypesEnum ticketType;
  final UserEntity? user;
  final TicketSourceEnum? ticketSource;
  final List<TicketCategoryModel> ticketCategory;
  final double? rate;
  final String? dateFrom;
  final String? dateTo;

  const GetTicketsParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter = '',
    required this.ticketType,
    this.user,
    this.ticketSource,
    this.ticketCategory = const [],
    this.rate,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    final Map<String, dynamic> map = {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'fk_state': ticketType.toParam,
      'fk_user': user?.id,
      'ticket_source': ticketSource?.value,
      if ((rate ?? 0) > 0) 'rate': rate,
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');

    return {
      ...map,
      'filter': filter,
      ...ApiHelper.prepareParamsList(
        key: 'categories',
        values: ticketCategory.map((e) => e.id).toList(),
      ),
    };
  }
}
