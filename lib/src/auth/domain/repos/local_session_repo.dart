import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';


abstract class LocalSessionRepo {
  const LocalSessionRepo();

  ResultVoid saveSessionInfo({required SessionInfo? info});

  ResultSync<SessionInfo?> loadSessionInfo();
}
