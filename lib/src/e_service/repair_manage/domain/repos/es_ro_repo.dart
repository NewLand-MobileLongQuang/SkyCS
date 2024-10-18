import 'dart:io';

import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_error_type.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_product.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_detail.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/delete.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/finish.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/get_by_ro_no.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_type.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_product.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/update.dart';

abstract class ES_RORepository {
  ResultFuture<List<ES_RODetail>> search({required SearchROParams params});
  ResultFuture<RT_ES_RODetail> getByRONo({required GetByRONoParams params});
  ResultVoid update({required UpdateROParams params});
  ResultVoid delete({required DeleteROParams params});
  ResultFuture<List<ES_ROErrorType>> searchErrorType({required SearchErrorTypeParams params});
  ResultFuture<List<ES_ROProduct>> searchProduct({required SearchProductParams params});
  ResultFuture<RT_ES_ROErrorComponent> searchErrorComponent({required SearchErrorComponentParams params});
  ResultVoid finish({required FinishROParams params});
}