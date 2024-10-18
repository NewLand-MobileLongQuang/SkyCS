import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/configs/app_config.dart';
import '../../../data/models/sky_customer_column_model.dart';
import '../../../data/models/sky_customer_group_model.dart';
import '../../../domain/entities/sky_customer_contact.dart';
import '../../../domain/entities/sky_customer_detail.dart';
import '../../../domain/entities/sky_customer_hist.dart';
import '../../../domain/usecases/get_by_cutomer_code_sys.dart';
import '../../../domain/usecases/search_customer.dart';
import '../../../domain/usecases/search_customer_column.dart';
import '../../../domain/usecases/search_customer_contact.dart';
import '../../../domain/usecases/search_customer_group.dart';
import '../../../domain/usecases/search_customer_hist.dart';

part 'customer_skycs_detail_state.dart';

class CustomerSkyCSDetailCubit extends Cubit<CustomerSkyCSDetailState> {
  CustomerSkyCSDetailCubit({
    required GetByCustomerCodeSysUseCase getByCustomerCodeSysUseCase,
    required SearchCustomerHistUseCase searchCustomerHistUseCase,
    required SearchCustomerContactUseCase searchCustomerContactUseCase,
    required SearchCustomerGroupUseCase searchCustomerGroupUseCase,
    required SearchCustomerColumnUseCase searchCustomerColumnUseCase,
  }) :_getByCustomerCodeSysUseCase = getByCustomerCodeSysUseCase,
        _searchCustomerHistUseCase = searchCustomerHistUseCase,
        _searchCustomerContactUseCase = searchCustomerContactUseCase,
        _searchCustomerGroupUseCase = searchCustomerGroupUseCase,
        _searchCustomerColumnUseCase = searchCustomerColumnUseCase,
        super(CustomerSkyCSDetailInitial());
  final GetByCustomerCodeSysUseCase _getByCustomerCodeSysUseCase;
  final SearchCustomerHistUseCase _searchCustomerHistUseCase;
  final SearchCustomerContactUseCase _searchCustomerContactUseCase;
  final SearchCustomerGroupUseCase _searchCustomerGroupUseCase;
  final SearchCustomerColumnUseCase _searchCustomerColumnUseCase;

  Future<void> init(String cus) async {
    emit(CustomerSkyCSDetailLoading());
    try {
      final Customer = await _getByCustomerCodeSysUseCase(
        GetByCustomerCodeSysParams(
          ScrTplCodeSys: AppConfig.current().scrTplCodeSys,
          CustomerCodeSys:cus,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final CustomerHist = await _searchCustomerHistUseCase(
        SearchCustomerHistParams(
          CustomerCodeSys: cus,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final CustomerContact = await _searchCustomerContactUseCase(
        SearchCustomerContactParams(
          CustomerCodeSys: cus,
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
          OrderByClause:'',
            FlagActive:''
        ),
      );
      final listGroup = await _searchCustomerGroupUseCase.call(
        const SearchCustomerGroupParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final listColumn = await _searchCustomerColumnUseCase.call(
        const SearchCustomerColumnParams(
          ScrTplCodeSys: 'ScrTplCodeSys.2023',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
          OrderByClause: 'ProvinceCode asc',
        ),
      );
      final listGroupFold = listGroup.fold((l) => l, (r) => r) as List<SKY_CustomerGroupModel>;
      final listColumnFold = listColumn.fold((l) => l, (r) => r) as List<SKY_CustomerColumnModel>;
      final listcusFold = Customer.fold((l) => l, (r) => r) as SKY_CustomerDetail;
      final listcusHistFold = CustomerHist.fold((l) => l, (r) => r) as List<SKY_CustomerHist>;
      final listcusContactFold = CustomerContact.fold((l) => l, (r) => r) as List<SKY_CustomerContact>;

      final jsonpartnertype = jsonDecode(listcusFold.Lst_Mst_Customer.first.CustomerInPartnerTypeJson) as List<dynamic>;
      //final jsonpartner = jsonDecode(jsonpartnertype.first['Mst_PartnerType'].toString()) as List<dynamic>;

      print("LOG: CHECK CUSINFO ${jsonpartnertype.first}");

      emit(CustomerSkyCSDetailStateLoaded(
        Customer: listcusFold,
        listcushist: listcusHistFold,
        listcuscontract: listcusContactFold,
        listGroupFold: listGroupFold,
        listColumnFold: listColumnFold,
      ));
    } catch (e) {
      emit(CustomerSkyCSDetailStateError(e.toString()));
    }
  }
}
