
// part of 'communication_list_bloc.dart';

import 'package:crm_smart/features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/participatModel.dart';
import '../../domain/use_cases/add_participate_comment_usecase.dart';
import '../../domain/use_cases/add_participate_usecase.dart';
import '../../domain/use_cases/edit_paraticipate_usecase.dart';
import '../../domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../domain/use_cases/get_participate_Invoice_list_usecase.dart';
import '../../domain/use_cases/get_participate_comment_list_usecase.dart';

abstract class ParticipateEvent extends Equatable {
  const ParticipateEvent();
}

class GetParticipateListEvent extends ParticipateEvent {
  final String query;

  GetParticipateListEvent(
    {
    required this.query,
  });

  @override
  List<Object?> get props => [
  query];
}

class SearchEvent extends ParticipateEvent {
  final String query;

  SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class AddParticipateEvent extends ParticipateEvent {
  final AddParaticipateParams addParticipateParams;

  final ValueChanged<ParticipateModel>? onSuccess;

  AddParticipateEvent(this.addParticipateParams, {this.onSuccess});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditParticipateEvent extends ParticipateEvent {
  final EditParticipateParams editParticipateParams;
  final ValueChanged<ParticipateModel>? onSuccess;

  EditParticipateEvent(this.editParticipateParams, {this.onSuccess});

  @override
  List<Object?> get props => throw UnimplementedError();
}
class SwitchProfileTabs extends ParticipateEvent{
  final TabEvent indexTab;
   SwitchProfileTabs(this.indexTab);
    @override
  List<Object?> get props => [indexTab];
}
class ChanageCurrentParticipate extends ParticipateEvent{
  late final ParticipateModel participateModel;
   ChanageCurrentParticipate(this.participateModel);
    @override
  List<Object?> get props => [participateModel];
}

enum TabEvent {
  DataTabSelected,
  ClientTabSelected,
  InvoiceTabSelected,
  CommentTabSelected,

}

// enum TabEvent {
//   DataTabSelected(''),
//   ClientTabSelected(''),
//   InvoiceTabSelected(''),
//   CommentTabSelected('');

//  const TabEvent(this.title);
//   final String title;
// }

class GetParticipateClientListEvent extends ParticipateEvent {
  final GetParticipateClientListParams getParticipateClientListParams;
  final String query;

  GetParticipateClientListEvent(
    {
    required this.query,
    required this.getParticipateClientListParams,
  });

  @override
  List<Object?> get props => [query,getParticipateClientListParams];
}

class SearchClientEvent extends ParticipateEvent {
  final String query;

  SearchClientEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class GetParticipateInvoiceListEvent extends ParticipateEvent {
  final GetParticipateInvoiceListParams getParticipateInvoiceListParams;
  final String query;

  GetParticipateInvoiceListEvent(
   
    {
    required this.query,
required this.getParticipateInvoiceListParams,
  });

  @override
  List<Object?> get props => [query,getParticipateInvoiceListParams];
}

class SearchInvoiceEvent extends ParticipateEvent {
  final String query;

  SearchInvoiceEvent(this.query);

  @override
  List<Object?> get props => [query];
}
class GetInvoiceByIdEvent extends ParticipateEvent{
  late final GetInvoiceByIdParams getInvoiceByIdParams;
  final ValueChanged<InvoiceModel>? onSuccess;

  GetInvoiceByIdEvent(this.getInvoiceByIdParams, {this.onSuccess});
    @override
  List<Object?> get props => [getInvoiceByIdParams];
}
class GetParticipateCommentListEvent extends ParticipateEvent {
  final GetParticipateCommentListParams getParticipateCommentListParams;


  GetParticipateCommentListEvent(
    {required this.getParticipateCommentListParams});

  @override
  List<Object?> get props => [
    // query,
  getParticipateCommentListParams];
}

class AddParticipateCommentEvent extends ParticipateEvent {
  final AddParticipateCommentParams addParticipateCommentParams;
  final ValueChanged<String?>? onSuccess;
  AddParticipateCommentEvent(this.addParticipateCommentParams, {this.onSuccess});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
