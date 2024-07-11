// part of 'communication_list_bloce.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/common/models/profile_invoice_model.dart';
import 'package:crm_smart/features/sales/public_relations/participates/data/models/participat_model.dart';
import 'package:crm_smart/features/sales/public_relations/participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../data/models/participate_client_model.dart';

class ParticipateListState extends Equatable {
  ParticipateListState({
    this.getParticipatesState = const BlocStatus.initial(),
    // this.participatesListState = const PageState.init(),
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
    this.allParticipateCommentsState = const <ProfileCommentModel>[],
    this.actionCommentState = const BlocStatus.initial(),
  });

  final BlocStatus<bool> getParticipatesState;

  // final PageState<List<ParticipateModel>> participatesListState;
  final ParticipateModel? currentPaticipate;

  final BlocStatus actionParticipateBlocStatus;
  final TabEvent currentProfileTab;
  final PageState<List<ParticipateClientModel>> particiPateClientsListState;
  final List<ParticipateClientModel> allParticipateClientsState;
  final PageState<List<ProfileInvoiceModel>> particiPateInvoicesListState;
  final List<ProfileInvoiceModel> allParticipateInvoicesState;
  final InvoiceModel? currentInvoice;
  final BlocStatus dialogProgressState;

  final PageState<List<ProfileCommentModel>> particiPateCommentsListState;
  final List<ProfileCommentModel> allParticipateCommentsState;
  final BlocStatus actionCommentState;

  @override
  List<Object?> get props => [
        getParticipatesState,
        // participatesListState,
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
    BlocStatus<bool>? getParticipatesState,
    // PageState<List<ParticipateModel>>? participatesListState,
    BlocStatus? actionParticipateBlocStatus,
    TabEvent? currentProfileTab,
    ParticipateModel? currentPaticipate,
    PageState<List<ParticipateClientModel>>? particiPateClientsListState,
    List<ParticipateClientModel>? allParticipateClientsState,
    PageState<List<ProfileInvoiceModel>>? particiPateInvoicesListState,
    List<ProfileInvoiceModel>? allParticipateInvoicesState,
    InvoiceModel? currentInvoice,
    BlocStatus? dialogProgressState,
    PageState<List<ProfileCommentModel>>? particiPateCommentsListState,
    List<ProfileCommentModel>? allParticipateCommentsState,
    BlocStatus? actionCommentState,
  }) {
    return ParticipateListState(
      getParticipatesState: getParticipatesState ?? this.getParticipatesState,
      // participatesListState:
      //     participatesListState ?? this.participatesListState,
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
