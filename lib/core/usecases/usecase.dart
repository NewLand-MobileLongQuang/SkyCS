import 'package:dartz/dartz.dart';
import 'package:idnstd/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  ResultFuture<Type> call();
}

abstract class UsecaseWithParamsSync<Type, Params> {
  const UsecaseWithParamsSync();
  ResultSync<Type> call(Params params);
}

abstract class UsecaseWithoutParamsSync<Type> {
  const UsecaseWithoutParamsSync();
  ResultSync<Type> call();
}



