import '../../utils/app_constants.dart';

int calculatePage({required int skip, int? limit}) {
  limit ??= AppConstants.kPerPage;
  return (skip / limit).ceil() + 1;
}
