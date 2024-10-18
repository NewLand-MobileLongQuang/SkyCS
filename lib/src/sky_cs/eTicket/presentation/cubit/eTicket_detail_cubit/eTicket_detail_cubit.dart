import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'eTicket_detail_state.dart';

class eTicketDetailCubit extends Cubit<eTicketDetailState> {
  eTicketDetailCubit() : super(eTicketDetailInitial());
}
