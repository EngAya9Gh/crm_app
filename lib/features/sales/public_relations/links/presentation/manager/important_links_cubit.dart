import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../data/models/important_link_model.dart';
import '../../domain/entities/important_links_page_variables_entity.dart';
import '../../domain/use_cases/action_link_usercase.dart';
import '../../domain/use_cases/get_important_links_usecase.dart';

part 'important_links_state.dart';

@injectable
class ImportantLinksCubit extends Cubit<ImportantLinksState> {
  final GetImportantLinksUsecase _getImportantLinksUsecase;
  final ActionLinkUsecase _actionLinkUsecase;

  ImportantLinksCubit(
    this._getImportantLinksUsecase,
    this._actionLinkUsecase,
  ) : super(ImportantLinksState());

  ImportantLinksPageVariablesEntity pageVariables =
      ImportantLinksPageVariablesEntity();

  void init() {
    pageVariables = ImportantLinksPageVariablesEntity();
  }

  Future<void> getImportantLinks({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getImportantLinksStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getImportantLinksStatus: BlocStatus.loading()));
        final result = await _getImportantLinksUsecase(
          GetImportantLinksParams(
            skip: pageVariables.allList.length,
            searchQuery: pageVariables.searchController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getImportantLinksStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            print(
                "pageVariables.allList.length: ${pageVariables.allList.length}");
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getImportantLinksStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getImportantLinksStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_important_links',
      isDebounced: isDebounced,
    );
  }

  // void getImportantLinks() async {
  //   emit(state.copyWith(allLinkList: const PageState.loading()));
  //   final allLinks = await _getImportantLinksUsecase(
  //     GetImportantLinksParams(),
  //   );
  //   allLinks.fold(
  //     (l) {
  //       if (AppConstants.shouldReturnEarly(l)) return;
  //       emit(state.copyWith(allLinkList: const PageState.error()));
  //     },
  //     (r) {
  //       emit(
  //         state.copyWith(
  //           allLinkList: PageState.loaded(data: r.data!),
  //           allLinks: r.data,
  //         ),
  //       );
  //     },
  //   );
  // }

  storeCurrentUser(ImportantLinkModel linkModel) {
    emit(state.copyWith(currentLink: linkModel));
  }

  actionLink({
    ImportantLinkModel? updateLink,
    required ActionLinksParams addLinkParams,
    required ValueChanged<String?> onSuccess,
  }) async {
    emit(state.copyWith(actionLinkState: BlocStatus.loading()));

    final response = await _actionLinkUsecase(addLinkParams);

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(actionLinkState: BlocStatus.fail(error: message)));
      },
      (value) {
        final link = value.data!;

        if (link.id == '0') {
          onSuccess.call("repeat");
          return;
        }
        List<ImportantLinkModel> users = List.from(pageVariables.allList);

        // if (updateLink != null) {
        //   users = users.map((e) => e.id == link.id ? link : e).toList();
        // } else {
        //   users.insert(0, link);
        // }

        final usersState = PageState.loaded(data: users);
        emit(
          state.copyWith(
            actionLinkState: BlocStatus.success(),
            currentLink: updateLink != null ? link : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }
}
