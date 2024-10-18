import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'e_service_state.dart';

class EServiceCubit extends Cubit<EServiceState> {
  EServiceCubit() : super(EServiceInitial());

  Future<void> init() async {
    emit(EServiceLoading());
    try {
      emit(EServiceLoaded());
    } catch (e) {
      emit(EServiceError(e.toString()));
    }
  }
}
