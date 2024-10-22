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
  }) : _searchCustomerSkyCSUseCase = searchCustomerSkyCSUseCase,
        super(CustomerSkyCSManageInitial());

  // API day nhung dung o man nao thi chuyen qua man do, ko thia xoa khoi cubit nay
  final SearchCustomerSkyCSUseCase _searchCustomerSkyCSUseCase;
  int pageIndex = 0;
  bool loadingMore = true;
  static const int pageSize = 10;

  Future<void> init() async {
    emit(CustomerSkyCSManageLoading());
    try {
      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: 'SCRTPLCODESYS.2023',
          KeyWord: '',
          FlagActive: '1',
          Ft_PageIndex: pageIndex.toString(),
          Ft_PageSize: pageSize.toString(),
        ),
      );
      loadingMore = (listCustomer.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
      ++pageIndex;
      final listCustomerFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      emit(CustomerSkyCSManageLoaded(
        listCustomer: listCustomerFold,
      ));
    } catch (e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    try{
      if(state is CustomerSkyCSManageLoaded && state is! CustomerSkyCSManageLoadingMore && loadingMore) {
        emit(CustomerSkyCSManageLoadingMore(listCustomer: (state as CustomerSkyCSManageLoaded).listCustomer));
        final listLoadMore = await _searchCustomerSkyCSUseCase(
          SearchCustomerSkyCSParams(
            ScrTplCodeSys: '',
            KeyWord: '',
            FlagActive: '1',
            Ft_PageIndex: pageIndex.toString(),
            Ft_PageSize: pageSize.toString(),
          ),
        );
        final listLoadMoreFold = listLoadMore.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
        emit(CustomerSkyCSManageLoaded(listCustomer: (state as CustomerSkyCSManageLoaded).listCustomer + listLoadMoreFold));
        loadingMore = (listLoadMore.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
        ++pageIndex;
      }
    }
    catch(e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    pageIndex = 0;
    loadingMore = true;
    emit(CustomerSkyCSManageLoading());
    try{
      final listCustomer = await _searchCustomerSkyCSUseCase(
        SearchCustomerSkyCSParams(
          ScrTplCodeSys: 'SCRTPLCODESYS.2023',
          KeyWord: query,
          FlagActive: '1',
          Ft_PageIndex: pageIndex.toString(),
          Ft_PageSize: pageSize.toString(),
        ),
      );
      final listCustomerFold = listCustomer.fold((l) => l, (r) => r) as List<SKY_CustomerInfo>;
      print('TrungLQ: $listCustomerFold');
      emit(CustomerSkyCSManageLoaded(listCustomer: listCustomerFold));
      loadingMore = (listCustomer.fold((l) => null, (r) => r)?.length ?? 0) == pageSize;
      ++pageIndex;
    }
    catch (e) {
      emit(CustomerSkyCSManageError(e.toString()));
    }
  }
}
