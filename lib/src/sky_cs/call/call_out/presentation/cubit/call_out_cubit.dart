import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'call_out_state.dart';

class CallOutCubit extends Cubit<CallOutState> {
  CallOutCubit() : super(CallOutInitial());

  Future<void> input(String number) async {
    emit(CallOutInputLoaded(phoneNumber: number));
  }

  Future<void> call(String hotline, String phoneNumber) async {
    emit(CallOutCalling(hotline: hotline, phoneNumber: phoneNumber));
    await Future.delayed(const Duration(seconds: 1));
    emit(CallOutCallSuccess(hotline: hotline, phoneNumber: phoneNumber));
  }

}
