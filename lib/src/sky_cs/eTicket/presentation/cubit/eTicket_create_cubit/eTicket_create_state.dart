part of 'eTicket_create_cubit.dart';

@immutable
sealed class eTicketCreateState {}

final class eTicketCreateInitial extends eTicketCreateState {}

final class eTicketCreateLoading extends eTicketCreateState {}

final class eTicketCreateStateLoaded extends eTicketCreateState {}

final class eTicketCreateStateError extends eTicketCreateState {
final String message;

eTicketCreateStateError(this.message);
}