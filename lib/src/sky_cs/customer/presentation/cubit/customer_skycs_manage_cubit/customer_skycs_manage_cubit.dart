import 'package:bloc/bloc.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/get_by_cutomer_code_sys.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_contact.dart';
import 'package:idnstd/src/sky_cs/customer/domain/usecases/search_customer_hist.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/sky_customer_info.dart';

part 'customer_skycs_manage_state.dart';

class CustomerSkyCSManageCubit extends Cubit<CustomerSkyCSManageState> {
  CustomerSkyCSManageCubit({
  required SearchCustomerSkyCSUseCase searchCustomerSkyCSUseCase,
  required GetByCustomerCodeSysUseCase getByCustomerCodeSysUseCase,
  required SearchCustomerHistUseCase searchCustomerHistUseCase,
  required SearchCustomerContactUseCase searchCustomerContactUseCase,
  }) : _searchCustomerSkyCSUseCase = searchCustomerSkyCSUseCase,
      _getByCustomerCodeSysUseCase = getByCustomerCodeSysUseCase,
      _searchCustomerHistUseCase = searchCustomerHistUseCase,
      _searchCustomerContactUseCase = searchCustomerContactUseCase,
        super(CustomerSkyCSManageInitial());

  // API day nhung dung o man nao thi chuyen qua man do, ko thia xoa khoi cubit nay
  final SearchCustomerSkyCSUseCase _searchCustomerSkyCSUseCase;
  final GetByCustomerCodeSysUseCase _getByCustomerCodeSysUseCase;
  final SearchCustomerHistUseCase _searchCustomerHistUseCase;
  final SearchCustomerContactUseCase _searchCustomerContactUseCase;

  Future<void> init() async {
    emit(CustomerSkyCSManageLoading());
    try {
      final list = await _searchCustomerContactUseCase(
        SearchCustomerContactParams(
          CustomerCodeSys: '',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
          OrderByClause: 'ProvinceCode asc',
        ),
      );
      final listFold = list.fold((l) => l, (r) => r);
      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: '',
          KeyWord: '',
          FlagActive: '1',
          Ft_PageIndex: '0',
          Ft_PageSize: '1000',
        ),
      );
      final listCustomerFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      emit(CustomerSkyCSManageLoaded(
        listcusomter: listCustomerFold,
      ));
    } catch (e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }
}
