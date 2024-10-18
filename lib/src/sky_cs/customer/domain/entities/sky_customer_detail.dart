import 'package:equatable/equatable.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_info.dart';

class SKY_CustomerDetail extends Equatable {
  SKY_CustomerDetail({required this.Lst_Mst_Customer});

  final List<SKY_CustomerInfo> Lst_Mst_Customer;

  @override
  List<Object?> get props => [Lst_Mst_Customer];
}