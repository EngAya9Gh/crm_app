part of 'deleted_invoices_cubit.dart';

class DeletedInvoicesState extends Equatable {
  final BlocStatus getDeletedInvoicesStatus;

  DeletedInvoicesState({
    this.getDeletedInvoicesStatus = const BlocStatus.initial(),
  });

  DeletedInvoicesState copyWith({
    BlocStatus<bool>? getDeletedStatus,
  }) {
    return DeletedInvoicesState(
      getDeletedInvoicesStatus:
          getDeletedStatus ?? this.getDeletedInvoicesStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getDeletedInvoicesStatus,
    ];
  }
}
