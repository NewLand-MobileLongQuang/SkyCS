import 'package:idnstd/core/common/app/entities/object_result.dart';
import 'package:idnstd/core/common/app/entities/sys_user.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/data/datasource/entry_center_gate_sv/entrycentergate_sv_data_source.dart';
import 'package:idnstd/core/errors/exceptions.dart';

abstract class EntryCenterGateDataSource {
  Future<List<ObjectResult>> getByNetworks({required String networkId});
  Future<DataUser> getForCurrentUser();
}

class EntryCenterGateRemoteDataSource extends EntryCenterGateSvDataSource implements EntryCenterGateDataSource{
  EntryCenterGateRemoteDataSource(super.client);

  @override
  Future<List<ObjectResult>> getByNetworks({required String networkId}) async {
    final params = {
      'SolutionCode': AppConfig.current().solutionCode,
      'NetworkIDSearch': networkId,
    };
    try {
      final response = await post(
          path: '/EntryCtMstNetwork/GetByNetwork',
          params: params,
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }

  @override
  Future<DataUser> getForCurrentUser() async {
    try {
      final response = await postUser(
        path: '/api/GetForCurrentUser',
      );
      return response.objResult!;
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}