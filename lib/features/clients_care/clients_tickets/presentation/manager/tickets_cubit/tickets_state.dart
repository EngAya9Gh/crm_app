part of 'tickets_cubit.dart';

@immutable
class TicketsState extends Equatable {
  final BlocStatus getTicketsStatus;
  final BlocStatus getTicketByIdStatus;
  final BlocStatus categoriesStatus;
  final BlocStatus subCategoriesStatus;
  final BlocStatus getClientsTicketsStatus;

  const TicketsState({
    this.getTicketsStatus = const BlocStatus.initial(),
    this.getTicketByIdStatus = const BlocStatus.initial(),
    this.categoriesStatus = const BlocStatus.initial(),
    this.subCategoriesStatus = const BlocStatus.initial(),
    this.getClientsTicketsStatus = const BlocStatus.initial(),
  });

  TicketsState copyWith({
    BlocStatus? getTicketsStatus,
    BlocStatus? getTicketByIdStatus,
    BlocStatus? categoriesStatus,
    BlocStatus? subCategoriesStatus,
    BlocStatus? getClientsTicketsStatus,
  }) {
    return TicketsState(
      getTicketsStatus: getTicketsStatus ?? this.getTicketsStatus,
      getTicketByIdStatus: getTicketByIdStatus ?? this.getTicketByIdStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      subCategoriesStatus: subCategoriesStatus ?? this.subCategoriesStatus,
      getClientsTicketsStatus:
          getClientsTicketsStatus ?? this.getClientsTicketsStatus,
    );
  }

  @override
  List<Object> get props => [
        getTicketsStatus,
        getTicketByIdStatus,
        categoriesStatus,
        subCategoriesStatus,
        getClientsTicketsStatus,
      ];
}
