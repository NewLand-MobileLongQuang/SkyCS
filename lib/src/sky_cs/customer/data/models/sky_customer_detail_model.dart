import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_info_model.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';

class SKY_CustomerDetailModel extends SKY_CustomerDetail {
  SKY_CustomerDetailModel({required super.Lst_Mst_Customer});

  factory SKY_CustomerDetailModel.fromJson(Map<String, dynamic> json) {
    return SKY_CustomerDetailModel(
      Lst_Mst_Customer: json['Lst_Mst_Customer'] != null
          ? (json['Lst_Mst_Customer'] as List).map((item) => SKY_CustomerInfoModel.fromJson(item as Map<String, dynamic>)).toList()
          : <SKY_CustomerInfoModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lst_Mst_Customer': Lst_Mst_Customer
    };
  }
}