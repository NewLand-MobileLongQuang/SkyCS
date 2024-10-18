import 'package:equatable/equatable.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/entities/es_warranty_create.dart';

import 'es_advanced_search.dart';

class RQ_ES_AdvancedSearch extends Equatable{
  RQ_ES_AdvancedSearch({required this.es_AdvancedSearch, required this.Lst_ES_AdvancedSearch});

  final ES_AdvancedSearch es_AdvancedSearch;
  final List<ES_AdvancedSearch> Lst_ES_AdvancedSearch;

  @override
  List<Object?> get props => [es_AdvancedSearch, Lst_ES_AdvancedSearch];

}