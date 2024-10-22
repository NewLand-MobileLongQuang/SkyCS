part of 'customer_skycs_manage_cubit.dart';

@immutable
sealed class CustomerSkyCSManageState {}

final class CustomerSkyCSManageInitial extends CustomerSkyCSManageState {}

final class CustomerSkyCSManageLoading extends CustomerSkyCSManageState {}

final class CustomerSkyCSManageLoaded extends CustomerSkyCSManageState {
  CustomerSkyCSManageLoaded({
    required this.listCustomer,
  });
  final List<SKY_CustomerInfo> listCustomer;
}

final class CustomerSkyCSManageLoadingMore extends CustomerSkyCSManageLoaded {
  CustomerSkyCSManageLoadingMore({required super.listCustomer});
}

final class CustomerSkyCSManageError extends CustomerSkyCSManageState {

  CustomerSkyCSManageError(this.message);
  final String message;
}
