import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'eTicket_create_state.dart';

class eTicketCreateCubit extends Cubit<eTicketCreateState> {
  eTicketCreateCubit() : super(eTicketCreateInitial());
}
