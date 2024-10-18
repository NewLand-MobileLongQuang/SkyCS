import 'dart:io';

import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/entities/es_warranty_detail.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_detail.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/create.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/delete.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/get_by_warranty_no.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/get_input_by_serial_no.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/search.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/usecases/update.dart';

import '../entities/es_advanced_search.dart';
import '../usecase/search.dart';


abstract class ES_AdvancedRepository {
  ResultFuture<List<ES_AdvancedSearch>> search({required SearchAdvancedParams params});
  ResultFuture<ES_AdvancedSearch> getByAdvancedNo({required SearchAdvancedParams params});
}