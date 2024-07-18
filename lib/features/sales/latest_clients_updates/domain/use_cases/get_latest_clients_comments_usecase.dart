import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/latest_clients_updates_repository.dart';

@lazySingleton
class GetLatestClientsUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetLatestClientsParams> {
  GetLatestClientsUseCase(this._repository);

  final LatestClientsUpdatesRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetLatestClientsParams params,
  ) async {
    return await _repository.getLatestClients(params);
  }
}

// [{"key":"fk_country","value":"1","equals":true,"description":null,"enabled":true,"uuid":"322c7908-4c2c-4416-88db-c3ab937d9d10"},{"key":"filter","value":"","equals":true,"description":null,"enabled":true,"uuid":"c5772956-48a0-4d5b-9aa1-e24b4d18cbd1"},{"key":"ismarketing","value":"1","description":null,"enabled":false,"equals":true,"uuid":"e6f1beb7-6fdb-480f-83b6-6ee22af390a3"},{"key":"age_from","value":"","equals":true,"description":null,"enabled":false,"uuid":"99caed79-89cc-428e-80ca-0e3aa0a4e3f7"},{"key":"age_to","value":"","equals":true,"description":null,"enabled":false,"uuid":"a76ab8ab-0915-41e7-8e81-4f3c893b49fc"},{"key":"page","value":"1","equals":true,"description":null,"enabled":true,"uuid":"82e95bd2-8ea2-4dda-aabf-9789300ef2b0"},{"key":"limit","value":"15","equals":true,"description":null,"enabled":true,"uuid":"cea2b63f-01e9-4b57-ad82-568410fdd753"},{"key":"order","value":"asc","equals":true,"description":null,"enabled":true,"uuid":"6329e622-991c-461d-b29c-1c2bcb0bb43c"},{"key":"type_client","value":"مشترك","equals":true,"description":null,"enabled":false,"uuid":"1f12983c-9cc1-4d56-9911-5aeaee6af7cc"},{"key":"fk_regoin","value":"5","equals":true,"description":null,"enabled":false,"uuid":"2c4c6d66-2083-4071-acf9-72f2e15ab3f3"},{"key":"from","value":"2024-06-10","equals":true,"description":null,"enabled":false,"uuid":"c84de009-d30f-41ee-843e-cb5f75008f98"},{"key":"to","value":"2024-07-10","equals":true,"description":null,"enabled":false,"uuid":"f8f98f28-3a10-44fc-aba3-e26cbc573fe1"},{"key":"fk_user","value":"4","equals":true,"description":null,"enabled":false,"uuid":"d98c196b-b978-41ab-8b94-8acf3f060402"}]
class GetLatestClientsParams {
  final String fkCountry;
  final String? filter;
  final String? isMarketing;
  final String? ageFrom;
  final String? ageTo;
  final String skip;
  final String? limit;
  final String? order;
  final String? typeClient;
  final String? fkRegion;
  final String? from;
  final String? to;
  final String? fkUser;

  const GetLatestClientsParams({
    required this.skip,
    required this.fkCountry,
    this.limit,
    this.filter,
    this.isMarketing,
    this.ageFrom,
    this.ageTo,
    this.order,
    this.typeClient,
    this.fkRegion,
    this.from,
    this.to,
    this.fkUser,
  });

  GetLatestClientsParams copyWith({
    String? fkCountry,
    String? filter,
    String? isMarketing,
    String? ageFrom,
    String? ageTo,
    String? skip,
    String? limit,
    String? order,
    String? typeClient,
    String? fkRegion,
    String? from,
    String? to,
    String? fkUser,
  }) {
    return GetLatestClientsParams(
      fkCountry: fkCountry ?? this.fkCountry,
      filter: filter ?? this.filter,
      isMarketing: isMarketing ?? this.isMarketing,
      ageFrom: ageFrom ?? this.ageFrom,
      ageTo: ageTo ?? this.ageTo,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      order: order ?? this.order,
      typeClient: typeClient ?? this.typeClient,
      fkRegion: fkRegion ?? this.fkRegion,
      from: from ?? this.from,
      to: to ?? this.to,
      fkUser: fkUser ?? this.fkUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "fk_country": fkCountry,
      "filter": filter,
      "ismarketing": isMarketing,
      "age_from": ageFrom,
      "age_to": ageTo,
      "page": skip,
      "limit": limit,
      "order": order,
      "type_client": typeClient,
      "fk_regoin": fkRegion,
      "from": from,
      "to": to,
      "fk_user": fkUser,
    };
  }
}
