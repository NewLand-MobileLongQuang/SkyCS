part of 'call_internal_cubit.dart';

@immutable
sealed class CallInternalState {}

final class CallInternalInitial extends CallInternalState {}

final class CallInternalLoading extends CallInternalState {}

final class CallInternalCalling extends CallInternalState {
CallInternalCalling({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class CallInternalCallSuccess extends CallInternalState {}

final class CallInternalInputLoaded extends CallInternalState {
CallInternalInputLoaded({required this.phoneNumber});

  final String phoneNumber;
}

final class CallInternalError extends CallInternalState {
  final String message;

  CallInternalError(this.message);
}
