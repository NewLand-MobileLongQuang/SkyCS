import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';

import 'package:idnstd/core/common/app/entities/session_info.dart';

import '../repos/local_session_repo.dart';

class SaveSessionInfo extends UsecaseWithParams<void, SessionInfo?> {
  const SaveSessionInfo(this._repo);

  final LocalSessionRepo _repo;

  @override
  ResultVoid call(SessionInfo? params) async =>
      _repo.saveSessionInfo(info: params);
}
