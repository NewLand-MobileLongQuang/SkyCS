import 'package:idnstd/src/e_service/customer_manage/domain/entities/es_customer_phone.dart';

class ESCustomerPhoneModel extends ESCustomerPhone {
  const ESCustomerPhoneModel({required super.CtmPhoneNo});

  factory ESCustomerPhoneModel.fromJson(Map<String, dynamic> json) {
    return ESCustomerPhoneModel(
      CtmPhoneNo: json['CtmPhoneNo'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CtmPhoneNo': CtmPhoneNo,
    };
  }
}