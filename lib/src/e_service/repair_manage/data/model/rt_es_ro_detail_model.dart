import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_attach_file_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_component_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_detail_model.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_detail.dart';

class RT_ES_RODetailModel extends RT_ES_RODetail {
  RT_ES_RODetailModel({required super.Lst_ES_RODetail, required super.Lst_ES_ROComponent, required super.Lst_ES_ROAttachFile});

  factory RT_ES_RODetailModel.fromJson(Map<String, dynamic> json) {
    return RT_ES_RODetailModel(
      Lst_ES_RODetail: json['Lst_ES_RO'] != null
          ? (json['Lst_ES_RO'] as List).map((item) => ES_RODetailModel.fromJson(item as Map<String, dynamic>)).toList()
          : <ES_RODetailModel>[],
      Lst_ES_ROComponent: json['Lst_ES_ROComponent'] != null
          ? (json['Lst_ES_ROComponent'] as List).map((item) => ES_ROComponentModel.fromJson(item as Map<String, dynamic>)).toList()
          : <ES_ROComponentModel>[],
      Lst_ES_ROAttachFile: json['Lst_ES_ROAttachFile'] != null
          ? (json['Lst_ES_ROAttachFile'] as List).map((item) => ES_ROAttachFileModel.fromJson(item as Map<String, dynamic>)).toList()
          : <ES_ROAttachFileModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lst_ES_RODetail': Lst_ES_RODetail,
      'Lst_ES_ROComponent': Lst_ES_ROComponent,
      'Lst_ES_ROAttachFile': Lst_ES_ROAttachFile,
    };
  }
}