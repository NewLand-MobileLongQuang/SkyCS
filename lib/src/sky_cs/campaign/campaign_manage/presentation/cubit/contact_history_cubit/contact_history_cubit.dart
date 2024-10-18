import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_history_state.dart';

class ContactHistoryCubit extends Cubit<ContactHistoryState> {
  ContactHistoryCubit() : super(ContactHistoryInitial());

  Future<void> init() async {
    emit(ContactHistoryLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(ContactHistoryLoaded());
  }
}
