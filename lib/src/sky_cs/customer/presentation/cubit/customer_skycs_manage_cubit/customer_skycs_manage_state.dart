part of 'customer_skycs_manage_cubit.dart';

@immutable
sealed class CustomerSkyCSManageState {}

final class CustomerSkyCSManageInitial extends CustomerSkyCSManageState {}

final class CustomerSkyCSManageLoading extends CustomerSkyCSManageState {}

final class CustomerSkyCSManageLoaded extends CustomerSkyCSManageState {
  final List<SKY_CustomerInfo> listcusomter;

  CustomerSkyCSManageLoaded({
    required this.listcusomter,
  });
}

final class CustomerSkyCSManageError extends CustomerSkyCSManageState {
  final String message;

  CustomerSkyCSManageError(this.message);
}
