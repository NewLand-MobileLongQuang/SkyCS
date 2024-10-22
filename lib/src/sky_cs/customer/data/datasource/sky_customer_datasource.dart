import 'package:idnstd/core/data/datasource/client_service/skycs_data_source.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/rt_sky_customer_all_detail_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/rt_sky_customer_type_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_column_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_contact_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_detail_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_group_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_hist_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_info_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_partner_type_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_zalo_user_model.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/create_customer.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_all_by_customer_code_sys.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_all_customer_partner_type.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_all_customer_type.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_by_cutomer_code_sys.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_list_option.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_column.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_group.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_zalo_user.dart';

class SKY_CustomerDataSource extends SkyCSSvDataSource {
  SKY_CustomerDataSource(super.client);

  Future<List<SKY_CustomerGroupModel>> searchCustomerGroup({required SearchCustomerGroupParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchGroup(
        path: 'MDMetaColGroup/Search',
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

  Future<List<SKY_CustomerColumnModel>> searchCustomerColumn({required SearchCustomerColumnParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
      'OrderByClause': params.OrderByClause,
    };
    try {
      final response = await postSearchColumn(
        path: 'MDMetaColGroupSpec/Search',
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

  Future<List<SKY_CustomerColumnModel>> getListOption({required GetListOptionParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'ColCodeSys': params.ColCodeSys,
      'FlagActive': params.FlagActive,
    };
    try {
      final response = await postGetListOption(
        path: 'MDMetaColGroupSpec/GetListOption',
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

  Future<String> createCustomerSkyCS({required CreateCustomerSkyCSParams params}) async {
    final paramsInit = {
      'strJson': params.strJson,
      'strJsonZaloUserFollower': params.strJsonZaloUserFollower,
      'strJsonEmail': params.strJsonEmail,
      'strJsonPhone': params.strJsonPhone,
      'strJsonCtmGroup': params.strJsonCtmGroup,
      'strJsonCtmPartnerType': params.strJsonCtmPartnerType,
      'strJsonUserManager': params.strJsonUserManager,
      'strJsonGovID': params.strJsonGovID,
      'ScrTplCodeSys': params.ScrTplCodeSys,
    };
    try {
      final response = await postCreateCustomerSkyCS(
        path: 'MstCustomer/Create',
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

  Future<RT_SKY_CustomerTypeModel> getAllCustomerType({required GetAllCustomerTypeParams params}) async {
    try {
      final response = await postGetAllCustomerType(
        path: 'MstCustomerType/GetAllCustomerType',
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

  Future<List<SKY_CustomerPartnerTypeModel>> getAllCustomerPartnerType({required GetAllCustomerPartnerTypeParams params}) async {
    try {
      final response = await postGetAllCustomerPartnerType(
        path: 'MstPartnerType/GetAllActive',
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

  Future<List<SKY_CustomerZaloUserModel>> searchZaloUser({required SearchZaloUserParams params}) async {
    final paramsInit = {
      'ZaloUserName': params.ZaloUserName,
    };
    try {
      final response = await postSearchZaloUser(
        path: 'Zalo/SearchZaloUser',
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

  // manage + detail

  Future<List<SKY_CustomerInfoModel>> searchCustomer({required SearchCustomerSkyCSParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'KeyWord': params.KeyWord,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchCustomer(
        path: 'MstCustomer/Search',
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

  Future<SKY_CustomerDetailModel> getByCustomerCodeSys({required GetByCustomerCodeSysParams params}) async {
    final paramsInit = {
      'ScrTplCodeSys': params.ScrTplCodeSys,
      'CustomerCodeSys': params.CustomerCodeSys,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postGetByCustomerCodeSys(
        path: 'MstCustomer/GetByCustomerCodeSys',
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

  Future<List<SKY_CustomerHistModel>> searchCustomerHist({required SearchCustomerHistParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
    };
    try {
      final response = await postSearchCustomerHist(
        path: 'MstCustomerHist/Search',
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

  Future<List<SKY_CustomerContactModel>> searchCustomerContact({required SearchCustomerContactParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
      'FlagActive': params.FlagActive,
      'Ft_PageIndex': params.Ft_PageIndex,
      'Ft_PageSize': params.Ft_PageSize,
      'OrderByClause': params.OrderByClause,
    };
    try {
      final response = await postSearchCustomerContact(
        path: 'MstCustomerContact/Search',
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

  Future<RT_SKY_CustomerAllDetailModel> getAllByCustomerCodeSys({required GetAllByCustomerCodeSysParams params}) async {
    final paramsInit = {
      'CustomerCodeSys': params.CustomerCodeSys,
    };
    try {
      final response = await postGetAllByCustomerCodeSys(
        path: 'MstCustomer/GetAllByCustomerCodeSys',
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