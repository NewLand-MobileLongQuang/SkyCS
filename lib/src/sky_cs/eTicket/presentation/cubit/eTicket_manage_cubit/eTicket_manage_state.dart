part of 'eTicket_manage_cubit.dart';

@immutable
sealed class eTicketManageState {}

final class eTicketManageInitial extends eTicketManageState {}

final class eTicketManageLoading extends eTicketManageState {}

final class eTicketManageLoaded extends eTicketManageState {
final List<Eticketmanage> eticketList;
eTicketManageLoaded(this.eticketList);
}

final class eTicketManageError extends eTicketManageState {
final String message;
eTicketManageError(this.message);
}
