// part of 'communication_list_bloce.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/common/models/profile_invoice_model.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../data/models/participate_client_model.dart';
import '../../data/models/participate_comments_model.dart';

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
    this.allParticipateInvoicesState = const <ProfileInvoiceModel>[],
    this.currentInvoice,
    this.dialogProgressState = const BlocStatus.initial(),
    this.particiPateCommentsListState = const PageState.init(),
    this.allParticipateCommentsState = const <ParticipateCommentModel>[],
    this.actionCommentState = const BlocStatus.initial(),
  });

  final PageState<List<ParticipateModel>> particiPateListState;
  final List<ParticipateModel> allParticipateState;
  final ParticipateModel? currentPaticipate;

  final BlocStatus actionParticipateBlocStatus;
  final TabEvent currentProfileTab;
  final PageState<List<ParticipateClientModel>> particiPateClientsListState;
  final List<ParticipateClientModel> allParticipateClientsState;
  final PageState<List<ProfileInvoiceModel>> particiPateInvoicesListState;
  final List<ProfileInvoiceModel> allParticipateInvoicesState;
  final InvoiceModel? currentInvoice;
  final BlocStatus dialogProgressState;

  final PageState<List<ParticipateCommentModel>> particiPateCommentsListState;
  final List<ParticipateCommentModel> allParticipateCommentsState;
  final BlocStatus actionCommentState;
  @override
  List<Object?> get props => [
        particiPateListState,
        allParticipateState,
        actionParticipateBlocStatus,
        currentProfileTab,
        currentPaticipate,
        particiPateClientsListState,
        allParticipateClientsState,
        particiPateInvoicesListState,
        allParticipateInvoicesState,
        currentInvoice,
        dialogProgressState,
        dialogProgressState,
        particiPateCommentsListState,
        allParticipateCommentsState,
        actionCommentState,
      ];
  ParticipateListState copyWith({
    PageState<List<ParticipateModel>>? particiPateListState,
    List<ParticipateModel>? allParticipateState,
    BlocStatus? actionParticipateBlocStatus,
    TabEvent? currentProfileTab,
    ParticipateModel? currentPaticipate,
    PageState<List<ParticipateClientModel>>? particiPateClientsListState,
    List<ParticipateClientModel>? allParticipateClientsState,
    PageState<List<ProfileInvoiceModel>>? particiPateInvoicesListState,
    List<ProfileInvoiceModel>? allParticipateInvoicesState,
    InvoiceModel? currentInvoice,
    BlocStatus? dialogProgressState,
    PageState<List<ParticipateCommentModel>>? particiPateCommentsListState,
    List<ParticipateCommentModel>? allParticipateCommentsState,
    BlocStatus? actionCommentState,
  }) {
    return ParticipateListState(
      particiPateListState: particiPateListState ?? this.particiPateListState,
      allParticipateState: allParticipateState ?? this.allParticipateState,
      actionParticipateBlocStatus:
          actionParticipateBlocStatus ?? this.actionParticipateBlocStatus,
      currentProfileTab: currentProfileTab ?? this.currentProfileTab,
      currentPaticipate: currentPaticipate ?? this.currentPaticipate,
      particiPateClientsListState:
          particiPateClientsListState ?? this.particiPateClientsListState,
      allParticipateClientsState:
          allParticipateClientsState ?? this.allParticipateClientsState,
      particiPateInvoicesListState:
          particiPateInvoicesListState ?? this.particiPateInvoicesListState,
      allParticipateInvoicesState:
          allParticipateInvoicesState ?? this.allParticipateInvoicesState,
      currentInvoice: currentInvoice ?? this.currentInvoice,
      dialogProgressState: dialogProgressState ?? this.dialogProgressState,
      particiPateCommentsListState:
          particiPateCommentsListState ?? this.particiPateCommentsListState,
      allParticipateCommentsState:
          allParticipateCommentsState ?? this.allParticipateCommentsState,
      actionCommentState: actionCommentState ?? this.actionCommentState,
    );
  }
}
