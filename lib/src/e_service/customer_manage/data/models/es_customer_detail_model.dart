import 'package:idnstd/src/e_service/customer_manage/domain/entities/es_customer_detail.dart';

class ESCustomerDetailModel extends ESCustomerDetail {
  const ESCustomerDetailModel({required super.CustomerCode, required super.CustomerName, required super.CustomerAddress, required super.CustomerAvatarPath});

  factory ESCustomerDetailModel.fromJson(Map<String, dynamic> json) {
    return ESCustomerDetailModel(
      CustomerCode: json['CustomerCode'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      CustomerAvatarPath: json['CustomerAvatarPath'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerCode': CustomerCode,
      'CustomerName': CustomerName,
      'CustomerAddress': CustomerAddress,
      'CustomerAvatarPath': CustomerAvatarPath,
    };
  }
}