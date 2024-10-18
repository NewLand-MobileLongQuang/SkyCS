import 'package:equatable/equatable.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_error_component.dart';

class RT_ES_ROErrorComponent extends Equatable{
  RT_ES_ROErrorComponent({required this.Lst_Mst_ErrorComponent});

  final List<ES_ROErrorComponent> Lst_Mst_ErrorComponent;

  @override
  List<Object?> get props => [Lst_Mst_ErrorComponent];
}