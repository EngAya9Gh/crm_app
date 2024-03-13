part of 'attachments_row_cubit.dart';

@immutable
abstract class AttachmentsRowState {}

class AttachmentsRowInitial extends AttachmentsRowState {}

class AttachmentsRowLoading extends AttachmentsRowState {}

class AttachmentsRowLoaded extends AttachmentsRowState {}

class AttachmentsRowError extends AttachmentsRowState {
  final String message;

  AttachmentsRowError({required this.message});
}
