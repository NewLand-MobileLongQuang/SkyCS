import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/src/sky_cs/call/forward/presentation/cubit/forward_cubit.dart';
import 'package:idnstd/src/sky_cs/call/presentation/cubit/call_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_agent_cubit/campaign_agent_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_customer_detail_cubit/campaign_customer_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_manage_cubit/campaign_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_cubit/campaign_perform_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_detail_cubit/campaign_perform_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/contact_history_cubit/contact_history_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/presentation/cubit/campaign_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/data/datasource/sky_customer_datasource.dart';
import 'package:idnstd/src/sky_cs/customer/data/repos/sky_customer_repo_impl.dart';
import 'package:idnstd/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';
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
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/change_detail_cubit/change_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_create_cubit/customer_skycs_create_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_detail_cubit/customer_skycs_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_create_cubit/eTicket_create_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_detail_cubit/eTicket_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/presentation/cubit/sky_cs_cubit.dart';

Future<void> skyCSManageInit() async {
  sl
    ..registerFactory(SkyCsCubit.new)
    ..registerFactory(CallCubit.new)
    ..registerFactory(ForwardCubit.new)

  // Khach hang
    ..registerFactory(() => CustomerSkyCSManageCubit(
        searchCustomerSkyCSUseCase: sl(),
    ))
    ..registerFactory(() => CustomerSkyCSDetailCubit(
      getByCustomerCodeSysUseCase: sl(),
      getAllByCustomerCodeSysUseCase: sl(),
    ))
    ..registerFactory(() => CustomerSkyCSCreateCubit(
      searchCustomerGroupUseCase: sl(),
      searchCustomerColumnUseCase: sl(),
      getListOptionUseCase: sl(),
      getCustomerCodeSysUseCase: sl(),
      createCustomerSkyCSUseCase: sl(),
      getAllCustomerTypeUseCase: sl(),
      getAllCustomerPartnerTypeUseCase: sl(),
      searchZaloUserUseCase: sl(),
    ))

    ..registerLazySingleton(() => SearchCustomerGroupUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerColumnUseCase(sl()))
    ..registerLazySingleton(() => GetListOptionUseCase(sl()))
    ..registerLazySingleton(() => CreateCustomerSkyCSUseCase(sl()))
    ..registerLazySingleton(() => GetAllCustomerTypeUseCase(sl()))
    ..registerLazySingleton(() => GetAllCustomerPartnerTypeUseCase(sl()))
    ..registerLazySingleton(() => SearchZaloUserUseCase(sl()))


    ..registerLazySingleton(() => SearchCustomerSkyCSUseCase(sl()))
    ..registerLazySingleton(() => GetByCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerHistUseCase(sl()))
    ..registerLazySingleton(() => SearchCustomerContactUseCase(sl()))
    ..registerLazySingleton(() => GetAllByCustomerCodeSysUseCase(sl()))
    ..registerLazySingleton<SKY_CustomerRepository>(() => SKY_CustomerRepositoryImpl(sl()))
    ..registerLazySingleton<SKY_CustomerDataSource>(() => SKY_CustomerDataSource(sl()))

    ..registerFactory(ChangeDetailCubit.new)
    ..registerFactory(CampaignCubit.new)
    ..registerFactory(CampaignManageCubit.new)
    ..registerFactory(CampaignAgentCubit.new)
    ..registerFactory(ContactHistoryCubit.new)
    ..registerFactory(CampaignPerformCubit.new)
    ..registerFactory(CampaignPerformDetailCubit.new)
    ..registerFactory(CampaignCustomerDetailCubit.new)

  //eTicket
    ..registerFactory(eTicketManageCubit.new)
    ..registerFactory(eTicketCreateCubit.new)
    ..registerFactory(eTicketDetailCubit.new);

}