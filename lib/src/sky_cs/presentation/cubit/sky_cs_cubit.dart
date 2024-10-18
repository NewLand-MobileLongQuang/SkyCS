import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sky_cs_state.dart';

class SkyCsCubit extends Cubit<SkyCsState> {
  SkyCsCubit() : super(SkyCsInitial());

  Future<void> init() async {
    emit(SkyCsLoading());
    try {
      // final data = await _skyCsRepository.getSkyCs();
      // emit(SkyCsLoaded(data));
      emit(SkyCsLoaded());
    } catch (e) {
      emit(SkyCsError(e.toString()));
    }
  }
}
