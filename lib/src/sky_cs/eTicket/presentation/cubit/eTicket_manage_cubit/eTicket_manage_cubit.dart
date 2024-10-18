import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../fake_data/fake_data_eTicket.dart';

part 'eTicket_manage_state.dart';

class eTicketManageCubit extends Cubit<eTicketManageState> {
  eTicketManageCubit() : super(eTicketManageInitial());

  Future<void> init() async {
    emit(eTicketManageLoading());
    try {
      final List<Eticketmanage> eticketList = EFake.listeticket;
      emit(eTicketManageLoaded(eticketList));
    } catch (e) {
      emit(eTicketManageError(e.toString()));
    }
  }
}
