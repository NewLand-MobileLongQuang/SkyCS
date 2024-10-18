import 'package:idnstd/core/data/datasource/client_service/e_service_datasource.dart';
import 'package:idnstd/core/errors/exceptions.dart';

import '../models/adsearch_model.dart';

class ADSearchDataSource extends EServiceSvDataSource {
  ADSearchDataSource(super.client);

  Future<MDMetaColGroupSpecSearchModel> getAdvancedSearch({required String params}) async {
    final paramsInit = {
      'GroupSpecSearch': params,
    };
    try {
      final response = await postGetaAdvancedSearch(
        path: 'GroupSpecSearch/GroupSpecSearch',
        params: paramsInit,
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