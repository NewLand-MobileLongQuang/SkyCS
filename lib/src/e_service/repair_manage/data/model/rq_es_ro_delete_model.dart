import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_delete_model.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rq_es_ro_delete.dart';

class RQ_ES_RODeleteModel extends RQ_ES_RODelete {
  RQ_ES_RODeleteModel({required super.es_RODelete});

  factory RQ_ES_RODeleteModel.fromJson(Map<String, dynamic> json) {
    return RQ_ES_RODeleteModel(
      es_RODelete: json['ES_RO'] as ES_RODeleteModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ES_RO': es_RODelete,
    };
  }
}