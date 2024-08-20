import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../data/models/company_com_model.dart';
import '../../domain/use_cases/addcomment_usecase.dart';
import '../../domain/use_cases/getcomment_usecase.dart';

part 'company_state.dart';

@injectable
class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(
    this._getCommentUsecase,
    this._addCommentUsecase,
  ) : super(CompanyState());

  final GetCommentUsecase _getCommentUsecase;
  final AddCommentUsecase _addCommentUsecase;

  void getComment({
    required GetCommentParams getcommentParams,
  }) async {
    emit(state.copyWith(allLinkList: const PageState.loading()));
    final allLinks = await _getCommentUsecase(getcommentParams);

    allLinks.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(allLinkList: const PageState.error()));
      },
      (value) => emit(
        state.copyWith(
          allLinkList: PageState.loaded(data: value.data!),
          allLinks: value.data,
        ),
      ),
    );
  }

  actionComment({
    // CompanyCommentModel? updateLink,
    required AddCommentParams addcommentParams,
    required ValueChanged<String?> onSuccess,
  }) async {
    emit(state.copyWith(actionLinkState: BlocStatus.loading()));

    final response = await _addCommentUsecase(addcommentParams);

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(actionLinkState: BlocStatus.fail(error: message)));
      },
      (value) {
        final comment_data = value.data!;

        if (comment_data.id == '0') {
          onSuccess.call("repeat");
          return;
        }
        List<CompanyCommentModel> comment = state.allComments;

        comment.insert(0, comment_data);
        final usersState = PageState.loaded(data: comment);
        emit(
          state.copyWith(
            actionLinkState: BlocStatus.success(),
            allLinkList: usersState,
            allLinks: comment,
            // currentLink: updateLink != null ? link : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }
}
