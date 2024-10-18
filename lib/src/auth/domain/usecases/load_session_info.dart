import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';

import '../repos/auth_repo.dart';
import '../repos/local_session_repo.dart';

class LoadSessionInfo extends UsecaseWithoutParamsSync<SessionInfo?> {
  const LoadSessionInfo(this._repo);

  final LocalSessionRepo _repo;

  @override
  ResultSync<SessionInfo?> call() =>_repo.loadSessionInfo();

}
