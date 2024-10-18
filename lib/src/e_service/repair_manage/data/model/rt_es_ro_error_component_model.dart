import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_error_component_model.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_error_component.dart';

class RT_ES_ROErrorComponentModel extends RT_ES_ROErrorComponent{
  RT_ES_ROErrorComponentModel({required super.Lst_Mst_ErrorComponent});

  factory RT_ES_ROErrorComponentModel.fromJson(Map<String, dynamic> json) {
    return RT_ES_ROErrorComponentModel(
      Lst_Mst_ErrorComponent: json['Lst_Mst_ErrorComponent'] != null
          ? (json['Lst_Mst_ErrorComponent'] as List).map((item) => ES_ROErrorComponentModel.fromJson(item as Map<String, dynamic>)).toList()
          : <ES_ROErrorComponentModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lst_Mst_ErrorComponent': Lst_Mst_ErrorComponent,
    };
  }
}