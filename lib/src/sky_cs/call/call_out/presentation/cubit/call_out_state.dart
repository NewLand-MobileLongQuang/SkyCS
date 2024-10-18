part of 'call_out_cubit.dart';

@immutable
sealed class CallOutState {}

final class CallOutInitial extends CallOutState {}

final class CallOutLoading extends CallOutState {}

final class CallOutCalling extends CallOutState {
  CallOutCalling({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class CallOutCallSuccess extends CallOutState {
  CallOutCallSuccess({required this.hotline, required this.phoneNumber});

  final String hotline;
  final String phoneNumber;
}

final class CallOutInputLoaded extends CallOutState {
  CallOutInputLoaded({required this.phoneNumber});

  final String phoneNumber;
}

final class CallOutError extends CallOutState {
  final String message;

  CallOutError(this.message);
}
