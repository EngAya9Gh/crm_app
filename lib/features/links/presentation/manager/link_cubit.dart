import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/link_model.dart';
import '../../domain/use_cases/action_link_usercase.dart';
import '../../domain/use_cases/get_link_usecase.dart';

part 'link_state.dart';

@injectable
class LinkCubit extends Cubit<LinksState> {
  LinkCubit(
    this._getLinkUsecase,
    this._actionLinkUsecase,
  ) : super(LinksState());

  final GetLinkUsecase _getLinkUsecase;
  final ActionLinkUsecase _actionLinkUsecase;

  void getLinks() async {
    emit(state.copyWith(allLinkList: const PageState.loading()));
    final allLinks = await _getLinkUsecase();

    allLinks.fold(
      (exception, message) =>
          emit(state.copyWith(allLinkList: const PageState.error())),
      (value) => emit(
        state.copyWith(
          allLinkList: PageState.loaded(data: value.data!),
          allLinks: value.data,
        ),
      ),
    );
  }

  storeCurrentUser(LinkImportantModel linkModel) {
    emit(state.copyWith(currentLink: linkModel));
  }

  onSearch(String query) {
    emit(
        state.copyWith(allLinkList: PageState.loaded(data: filterList(query))));
  }

  List<LinkImportantModel> filterList(String query) {
    List<LinkImportantModel> list =
        List<LinkImportantModel>.from(state.allLinks);
    list = list
        .where((element) =>
            (element.title?.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }

  actionLink({
    LinkImportantModel? updateLink,
    required ActionLinksParams addLinkParams,
    required ValueChanged<String?> onSuccess,
  }) async {
    emit(state.copyWith(actionLinkState: BlocStatus.loading()));

    final response = await _actionLinkUsecase(addLinkParams);

    response.fold(
      (exception, message) => emit(
          state.copyWith(actionLinkState: BlocStatus.fail(error: message))),
      (value) {
        final link = value.data!;

        if (link.id == '0') {
          onSuccess.call("repeat");
          return;
        }
        List<LinkImportantModel> users = state.allLinks;

        // if (updateLink != null) {
        //   users = users.map((e) => e.id == link.id ? link : e).toList();
        // } else {
        //   users.insert(0, link);
        // }

        final usersState = PageState.loaded(data: users);
        emit(
          state.copyWith(
            actionLinkState: BlocStatus.success(),
            allLinkList: usersState,
            allLinks: users,
            currentLink: updateLink != null ? link : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }
}
