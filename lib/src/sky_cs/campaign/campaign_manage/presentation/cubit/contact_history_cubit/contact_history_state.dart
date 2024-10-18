part of 'contact_history_cubit.dart';

@immutable
sealed class ContactHistoryState {}

final class ContactHistoryInitial extends ContactHistoryState {}

final class ContactHistoryLoading extends ContactHistoryState {}

final class ContactHistoryLoaded extends ContactHistoryState {}

final class ContactHistoryError extends ContactHistoryState {
  final String message;

  ContactHistoryError(this.message);
}
