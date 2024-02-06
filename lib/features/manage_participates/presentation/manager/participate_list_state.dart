// part of 'communication_list_bloc.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_participates/data/models/participate_invoice_model.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../data/models/participate_client_model.dart';


class ParticipateListState extends Equatable {
   ParticipateListState({
    this.particiPateListState = const PageState.init(),
    this.allParticipateState = const <ParticipateModel>[],
    this.actionParticipateBlocStatus = const BlocStatus.initial(),
    this.currentProfileTab = TabEvent.DataTabSelected,
    this.currentPaticipate,
     this.particiPateClientsListState = const PageState.init(),
    this.allParticipateClientsState = const <ParticipateClientModel>[],
    this.particiPateInvoicesListState = const PageState.init(),
    this.allParticipateInvoicesState = const <ParticipateInvoiceModel>[],
  });

  final PageState<List<ParticipateModel>> particiPateListState;
  final List<ParticipateModel> allParticipateState;
  final ParticipateModel? currentPaticipate;

  final BlocStatus actionParticipateBlocStatus;
  final TabEvent currentProfileTab;
   final PageState<List<ParticipateClientModel>> particiPateClientsListState;
   final List<ParticipateClientModel> allParticipateClientsState;
      final PageState<List<ParticipateInvoiceModel>> particiPateInvoicesListState;
   final List<ParticipateInvoiceModel> allParticipateInvoicesState;


  @override
  List<Object?> get props => [particiPateListState,allParticipateState,actionParticipateBlocStatus,currentProfileTab,currentPaticipate,particiPateClientsListState,
  allParticipateClientsState,particiPateInvoicesListState,allParticipateInvoicesState
  ];
  ParticipateListState copyWith({
    PageState<List<ParticipateModel>>? particiPateListState,
    List<ParticipateModel>? allParticipateState,
    BlocStatus? actionParticipateBlocStatus,
    TabEvent? currentProfileTab,
    ParticipateModel? currentPaticipate,
    PageState<List<ParticipateClientModel>>? particiPateClientsListState,
    List<ParticipateClientModel>? allParticipateClientsState,
    PageState<List<ParticipateInvoiceModel>>? particiPateInvoicesListState,
    List<ParticipateInvoiceModel>? allParticipateInvoicesState,
  }) {
 
   return ParticipateListState(
      particiPateListState: particiPateListState ?? this.particiPateListState,
      allParticipateState: allParticipateState ?? this.allParticipateState,
      actionParticipateBlocStatus: actionParticipateBlocStatus ??   this.actionParticipateBlocStatus,
      currentProfileTab: currentProfileTab ??   this.currentProfileTab,
      currentPaticipate: currentPaticipate ??   this.currentPaticipate,
      particiPateClientsListState: particiPateClientsListState ?? this.particiPateClientsListState,
      allParticipateClientsState: allParticipateClientsState ?? this.allParticipateClientsState,
      particiPateInvoicesListState: particiPateInvoicesListState ?? this.particiPateInvoicesListState,
      allParticipateInvoicesState: allParticipateInvoicesState ?? this.allParticipateInvoicesState,
    );
  }
}
