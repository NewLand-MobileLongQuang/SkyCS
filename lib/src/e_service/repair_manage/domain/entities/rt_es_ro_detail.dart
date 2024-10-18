import 'package:equatable/equatable.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';

class RT_ES_RODetail extends Equatable {
  RT_ES_RODetail({required this.Lst_ES_RODetail, required this.Lst_ES_ROComponent, required this.Lst_ES_ROAttachFile});


  final List<ES_RODetail> Lst_ES_RODetail;
  final List<ES_ROComponent> Lst_ES_ROComponent;
  final List<ES_ROAttachFile> Lst_ES_ROAttachFile;

  @override
  List<Object?> get props => [Lst_ES_RODetail, Lst_ES_ROComponent, Lst_ES_ROAttachFile];
}