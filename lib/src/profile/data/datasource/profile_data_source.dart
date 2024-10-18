import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/data/datasource/base/base_remote_data_source.dart';
import 'package:idnstd/core/utils/string_generate.dart';

class ProfileDataSource extends BaseRemoteDataSource {
  ProfileDataSource(super.client);

  @override
  String get baseUrl {
    final ss = SessionInfo.current();
    return ss.solutionAPI;
  }

  Future<void> changeLanguage(String language) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
        path: 'api/ChangeLanguage',
        headers: {
          'Authorization': ss.auth.AccessToken,
          'NetworkId': ss.org?.Id.toString() ?? '',
          'OrgId': ss.org?.Id.toString() ?? '',
          'GwUserCode': AppConfig.current().gwUserCodeSolution,
          'GwPassword': AppConfig.current().gwPasswordSolution,
          'UtcOffset': ss.user.TimeZone.toString(),
          'AppAgent': AppConfig.current().appAgent,
          'AppLanguageCode': ss.user.Language,
          'AppVerCode': AppConfig.current().appVerCode,
          'Tid': StringGenerate.getCurrentTime(),
          'AppTId': StringGenerate.getCurrentTime(),
        },
        params: {
          'Language': language,
        },
    );
  }
}