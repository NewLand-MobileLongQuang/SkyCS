import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/page_under_construction.dart';
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/core/services/router.dart';
import 'package:idnstd/src/e_service/advanced_search/presentation/cubit/advanced_search_cubit.dart';
import 'package:idnstd/src/e_service/advanced_search/presentation/view/advanced_search_screen.dart';
import 'package:idnstd/src/e_service/advanced_search/search_conditions/presentation/cubit/search_conditions_cubit.dart';
import 'package:idnstd/src/e_service/advanced_search/search_conditions/presentation/view/search_conditions.dart';
import 'package:idnstd/src/e_service/advanced_search/setting_advanced_search/presentation/cubit/setting_advanced_search_cubit.dart';
import 'package:idnstd/src/e_service/advanced_search/setting_advanced_search/presentation/view/setting_advanced_search.dart';
import 'package:idnstd/src/sky_cs/call/forward/presentation/cubit/forward_cubit.dart';
import 'package:idnstd/src/sky_cs/call/forward/presentation/views/forward_screen.dart';
import 'package:idnstd/src/sky_cs/call/presentation/cubit/call_cubit.dart';
import 'package:idnstd/src/sky_cs/call/presentation/views/call_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_agent_cubit/campaign_agent_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_customer_detail_cubit/campaign_customer_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_detail_cubit/campaign_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_manage_cubit/campaign_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_cubit/campaign_perform_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_detail_cubit/campaign_perform_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/contact_history_cubit/contact_history_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_agent_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_customer_detail_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_detail_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_manage_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_perform_detail_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/campaign_perform_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/views/contact_history_screen.dart';
import 'package:idnstd/src/sky_cs/campaign/presentation/cubit/campaign_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/presentation/views/campaign_screen.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/change_detail_cubit/change_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_create_cubit/customer_skycs_create_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_detail_cubit/customer_skycs_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/views/change_detail_screen.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/views/customer_skycs_create_screen.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/views/customer_skycs_detail_screen.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/views/customer_skycs_manage_screen.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_create_cubit/eTicket_create_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_detail_cubit/eTicket_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/views/eTicket_create.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/views/eTicket_detail.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/views/eTicket_manage_screen.dart';
import 'package:idnstd/src/sky_cs/presentation/cubit/sky_cs_cubit.dart';
import 'package:idnstd/src/sky_cs/presentation/views/sky_cs_screen.dart';

PageRouteBuilder? handleCaseSkyCS(RouteSettings settings) {
  switch(settings.name){
    case SkyCsScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<SkyCsCubit>(),
              child: const SkyCsScreen()),
          settings: settings);

    case CallScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CallCubit>(),
              child: const CallScreen()),
          settings: settings);

    case CampaignScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignCubit>(),
              child: const CampaignScreen()),
          settings: settings);

    case CampaignManageScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignManageCubit>(),
              child: const CampaignManageScreen()),
          settings: settings);

    case CampaignAgentScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignAgentCubit>(),
              child: const CampaignAgentScreen()),
          settings: settings);

    case CampaignDetailScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignDetailCubit>(),
              child: const CampaignDetailScreen()),
          settings: settings);

    case ContactHistoryScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<ContactHistoryCubit>(),
              child: const ContactHistoryScreen()),
          settings: settings);

    case CampaignPerformScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignPerformCubit>(),
              child: const CampaignPerformScreen()),
          settings: settings);

    case CampaignPerformDetailScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignPerformDetailCubit>(),
              child: const CampaignPerformDetailScreen()),
          settings: settings);

    case CampaignCustomerDetailScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CampaignCustomerDetailCubit>(),
              child: const CampaignCustomerDetailScreen()),
          settings: settings);

    case CustomerSkyCSManageScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CustomerSkyCSManageCubit>(),
              child: const CustomerSkyCSManageScreen()),
          settings: settings);

    case eTicketManageScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<eTicketManageCubit>(),
              child: const eTicketManageScreen()),
          settings: settings);

    case eTicketDetailScreen.routeName:
      final id = settings.arguments as String;
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<eTicketDetailCubit>(),
              child: eTicketDetailScreen(id: id,)),
          settings: settings);

    // case eTicketCreateScreen.routeName:
    //   return pageBuilder(
    //           (p0) => BlocProvider(
    //           create: (_) => sl<eTicketCreateCubit>(),
    //           child: const eTicketCreateScreen()),
    //       settings: settings);

    case AdvancedSearchScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;

      final function = args?['function'] as String;
      final module = args?['module'] as String;
      return pageBuilder(
            (p0) => BlocProvider(
          create: (_) => sl<AdvancedSearchCubit>(),
          child: AdvancedSearchScreen(function: function, module: module),
        ),
        settings: settings,
      );

    case SettingAdvancedSearchScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;

      final function = args?['function'] as String;
      final module = args?['module'] as String;
      return pageBuilder(
            (p0) => BlocProvider(
          create: (_) => sl<SettingAdvancedSearchCubit>(),
          child: SettingAdvancedSearchScreen(function: function, module: module),
        ),
        settings: settings,
      );

    case SearchConditionsScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;
      final function = args?['function'] as String;
      final module = args?['module'] as String;
      return pageBuilder(
            (p0) => BlocProvider(
          create: (_) => sl<SearchConditionsCubit>(),
          child: SearchConditionsScreen(function: function, module: module),
        ),
        settings: settings,
      );
    case ForwardScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<ForwardCubit>(),
              child: const ForwardScreen()),
          settings: settings);

    case CustomerSkyCSDetailScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;
      final CustomerCodeSys = args?['CustomerCodeSys'] as String;
      return pageBuilder(
            (p0) => BlocProvider(
          create: (_) => sl<CustomerSkyCSDetailCubit>(),
          child: CustomerSkyCSDetailScreen(customerCodeSys: CustomerCodeSys,),
        ),
        settings: settings,
      );
    case CustomerSkyCSCreateScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<CustomerSkyCSCreateCubit>(),
              child: const CustomerSkyCSCreateScreen()),
          settings: settings);

    case ChangeDetailScreen.routeName:
      return pageBuilder(
              (p0) => BlocProvider(
              create: (_) => sl<ChangeDetailCubit>(),
              child: const ChangeDetailScreen()),
          settings: settings);

    default:
      return pageBuilder((p0) => const PageUnderConstruction(),
          settings: settings);
  }
}