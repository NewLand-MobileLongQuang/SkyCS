part of 'forward_cubit.dart';

@immutable
sealed class ForwardState {}

final class ForwardInitial extends ForwardState {}

final class ForwardLoading extends ForwardState {}

final class ForwardLoaded extends ForwardState {}

final class ForwardError extends ForwardState {
  final String message;

  ForwardError(this.message);
}