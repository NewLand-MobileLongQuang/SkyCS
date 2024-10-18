import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/widgets/general_information_view.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/widgets/list_customer_view.dart';

class CampaignDetailScreen extends StatefulWidget {
  const CampaignDetailScreen({super.key});

  static const String routeName = '/campaign-detail';

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textWhiteColor,
            ),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          actions: const [
            Icon(
              Icons.expand_circle_down_outlined,
              color: AppColors.textWhiteColor,
            ),
            SizedBox(width: 8),
            Icon(
              Icons.delete_outline_outlined,
              color: AppColors.textWhiteColor,
            )
          ],
          title: _textTitle(),
        ),
        body: Column(
            children: [
              _tabBar(),
              _tabBarView(),
            ]
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.infoCustomer,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 50,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: const [
          Tab(
            text: 'Thông tin chung',
          ),
          Tab(
            text: 'Danh sách khách hàng',
          ),
        ],
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        labelStyle: AppTextStyles.textStyleInterW500S14Black,
      ),
    );
  }

  Widget _tabBarView() {
    return const Expanded(
      child: TabBarView(
        children: [
          GeneralInformationView(),
          ListCustomerView()
        ],
      ),
    );
  }
}


