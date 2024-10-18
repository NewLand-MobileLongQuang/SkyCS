import 'package:idnstd/core/common/app/entities/object_result.dart';
import 'package:idnstd/core/common/app/entities/sys_user.dart';
import 'package:idnstd/core/utils/typedef.dart';

abstract class EntryCenterGateRepo {
  ResultFuture<List<ObjectResult>> getByNetworks({required String networkId});
  ResultFuture<DataUser> getForCurrentUser();
}