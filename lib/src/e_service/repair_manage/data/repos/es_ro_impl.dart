import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/repair_manage/data/datasource/es_ro_datasource.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_error_type.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_product.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_detail.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/entities/rt_es_ro_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/delete.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/finish.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/get_by_ro_no.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_component.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_error_type.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/search_product.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/usecases/update.dart';

class ES_RORepositoryImpl implements ES_RORepository {

  ES_RORepositoryImpl(this._dataSource);
  final ES_RODataSource _dataSource;

  @override
  ResultFuture<List<ES_RODetail>> search({required SearchROParams params}) async {
    try {
      final result = await _dataSource.search(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_RODetail> getByRONo({required GetByRONoParams params}) async {
    try {
      final result = await _dataSource.getByRONo(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid update({required UpdateROParams params}) async {
    try {
      final result = await _dataSource.update(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid delete({required DeleteROParams params}) async {
    try {
      final result = await _dataSource.delete(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ES_ROErrorType>> searchErrorType({required SearchErrorTypeParams params}) async {
    try {
      final result = await _dataSource.searchErrorType(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ES_ROProduct>> searchProduct({required SearchProductParams params}) async {
    try {
      final result = await _dataSource.searchProduct(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<RT_ES_ROErrorComponent> searchErrorComponent({required SearchErrorComponentParams params}) async {
    try {
      final result = await _dataSource.searchErrorComponent(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid finish({required FinishROParams params}) async {
    try {
      final result = await _dataSource.finish(params: params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}