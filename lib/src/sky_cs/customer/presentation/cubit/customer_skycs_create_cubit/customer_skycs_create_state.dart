part of 'customer_skycs_create_cubit.dart';

@immutable
sealed class CustomerSkyCSCreateState {}

final class CustomerSkyCSCreateStateInitial extends CustomerSkyCSCreateState {}

final class CustomerSkyCSCreateLoading extends CustomerSkyCSCreateState {}

class CustomerSkyCSCreateLoaded extends CustomerSkyCSCreateState {
final List<SKY_CustomerGroupModel> listGroupFold;
final List<SKY_CustomerColumnModel> listColumnFold;
final RT_SKY_CustomerType listcustomerTypeFold;
final List<SKY_CustomerPartnerType> listcustomerPartnerTypeFold;
final List<SKY_CustomerZaloUser> listzaloUserFold;

  CustomerSkyCSCreateLoaded({
    required this.listGroupFold,
    required this.listColumnFold,
    required this.listcustomerTypeFold,
    required this.listcustomerPartnerTypeFold,
    required this.listzaloUserFold,
  });
}

class CustomerSkyCSCreateCheck extends CustomerSkyCSCreateLoaded {
  CustomerSkyCSCreateCheck({required super.listGroupFold,
                            required super.listColumnFold,
                            required super.listcustomerTypeFold,
                            required super.listcustomerPartnerTypeFold,
                            required super.listzaloUserFold,});
}

final class CustomerSkyCSCreateError extends CustomerSkyCSCreateState {

  CustomerSkyCSCreateError(this.message);
  final String message;
}

final class CustomerSkyCSCreateSuccess extends CustomerSkyCSCreateState {

}