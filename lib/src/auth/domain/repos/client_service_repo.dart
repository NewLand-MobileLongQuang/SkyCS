import 'package:idnstd/core/common/app/entities/sys_user.dart';
import 'package:idnstd/core/utils/typedef.dart';

abstract class ClientServiceRepo {
  ResultFuture<DataUser> getForCurrentUser();
}