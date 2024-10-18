import 'dart:convert';

import 'package:idnstd/src/auth/domain/entities/sso_data.dart';

import '../../../../core/utils/typedef.dart';

class SSODataModel extends SSOData {
  SSODataModel({required super.Data});


  SSODataModel.fromBase(SSOData base)
      : this(
    Data: base.Data
  );


  SSODataModel.fromMap(DataMap map)
      : this(
          Data: map['Data'] as String,
        );

  DataMap toMap() => {
        'Data': Data,
      };

  factory SSODataModel.fromJson(String source) =>
      SSODataModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  SSODataModel copyWith({
    String? Data,
  }) {
    return SSODataModel(
      Data: Data ?? this.Data,
    );
  }
}
