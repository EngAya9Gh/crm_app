part of 'agents_distributors_profile_bloc.dart';

@immutable
abstract class AgentsDistributorsProfileEvent {}

class GetAgentClientListEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetAgentClientListParams getAgentClientListParams;
  final String query;

  GetAgentClientListEvent({
    required this.query,
    required this.getAgentClientListParams,
  });

  @override
  List<Object?> get props => [query, getAgentClientListParams];
}

class SearchClientEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final String query;

  SearchClientEvent(this.query);

  @override
  List<Object?> get props => [query];
}
//
// class GetAgentInvoiceListEvent extends AgentsDistributorsProfileEvent {
//   final GetAgentInvoiceListParams getAgentInvoiceListParams;
//   final String query;
//
//   GetAgentInvoiceListEvent(
//
//       {
//         required this.query,
//         required this.getAgentInvoiceListParams,
//       });
//
//   @override
//   List<Object?> get props => [query,getAgentInvoiceListParams];
// }
//
// class SearchInvoiceEvent extends AgentsDistributorsProfileEvent {
//   final String query;
//
//   SearchInvoiceEvent(this.query);
//
//   @override
//   List<Object?> get props => [query];
// }
// class GetInvoiceByIdEvent extends AgentsDistributorsProfileEvent{
//   late final GetInvoiceByIdParams getInvoiceByIdParams;
//   final ValueChanged<InvoiceModel>? onSuccess;
//
//   GetInvoiceByIdEvent(this.getInvoiceByIdParams, {this.onSuccess});
//   @override
//   List<Object?> get props => [getInvoiceByIdParams];
// }
// class GetAgentCommentListEvent extends AgentsDistributorsProfileEvent {
//   final GetAgentCommentListParams getAgentCommentListParams;
//
//
//   GetAgentCommentListEvent(
//       {required this.getAgentCommentListParams});
//
//   @override
//   List<Object?> get props => [
//     // query,
//     getAgentCommentListParams];
// }
//
// class AddAgentCommentEvent extends AgentsDistributorsProfileEvent {
//   final AddAgentCommentParams addAgentCommentParams;
//   final ValueChanged<String?>? onSuccess;
//   AddAgentCommentEvent(this.addAgentCommentParams, {this.onSuccess});
//
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
