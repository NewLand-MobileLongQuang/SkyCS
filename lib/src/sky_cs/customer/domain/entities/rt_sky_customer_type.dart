import 'package:equatable/equatable.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_type.dart';

class RT_SKY_CustomerType extends Equatable {
  RT_SKY_CustomerType({required this.Lst_Mst_CustomerType});

  final List<SKY_CustomerType> Lst_Mst_CustomerType;


  @override
  List<Object?> get props => [Lst_Mst_CustomerType];

}