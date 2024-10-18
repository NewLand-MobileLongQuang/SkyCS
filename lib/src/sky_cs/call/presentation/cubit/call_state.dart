part of 'call_cubit.dart';

@immutable
sealed class CallState {}

final class CallInitial extends CallState {}

final class CallLoading extends CallState {}

final class CallLoaded extends CallState {}

final class CallError extends CallState {
  final String message;

  CallError(this.message);
}