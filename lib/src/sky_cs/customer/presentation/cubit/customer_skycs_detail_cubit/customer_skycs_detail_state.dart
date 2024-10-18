part of 'customer_skycs_detail_cubit.dart';

@immutable
sealed class CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailInitial extends CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailLoading extends CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailStateLoaded extends CustomerSkyCSDetailState {
  final SKY_CustomerDetail Customer;
  final List<SKY_CustomerHist> listcushist;
  final List<SKY_CustomerContact> listcuscontract;
  final List<SKY_CustomerGroupModel> listGroupFold;
  final List<SKY_CustomerColumnModel> listColumnFold;

  CustomerSkyCSDetailStateLoaded({
    required this.Customer,
    required this.listcushist,
    required this.listcuscontract,
    required this.listGroupFold,
    required this.listColumnFold,
  });
}

final class CustomerSkyCSDetailStateError extends CustomerSkyCSDetailState {
  final String message;

  CustomerSkyCSDetailStateError(this.message);
}