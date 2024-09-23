class GetSimilarClientsListParams extends Equatable {
  final String fkCountry;
  final int? download;

  const GetSimilarClientsListParams({
    required this.fkCountry,
    this.download,
  });

  @override
  List<Object?> get props => [fkCountry, download];
}

class GetClientsWithFilterParams extends Equatable {
  final String fkCountry;
  final int? download;

  const GetClientsWithFilterParams({
    required this.fkCountry,
    this.download,
  });

  @override
  List<Object?> get props => [fkCountry, download];
}