import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'call_internal_state.dart';

class CallInternalCubit extends Cubit<CallInternalState> {
  CallInternalCubit() : super(CallInternalInitial());

  Future<void> input(String number) async {
    emit(CallInternalInputLoaded(phoneNumber: number));
  }

  Future<void> callIn(String hotline, String phoneNumber) async {
    emit(CallInternalCalling(hotline: hotline, phoneNumber: phoneNumber));
    // await Future.delayed(const Duration(seconds: 5));
    // emit(CallInCallSuccess());
  }
}
