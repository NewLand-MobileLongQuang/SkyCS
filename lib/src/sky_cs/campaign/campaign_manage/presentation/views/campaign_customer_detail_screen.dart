import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_customer_detail_cubit/campaign_customer_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_detail_cubit/campaign_perform_detail_cubit.dart';

class CampaignCustomerDetailScreen extends StatefulWidget {
  const CampaignCustomerDetailScreen({super.key});

  static const String routeName = '/campaign-customer-detail';

  @override
  State<CampaignCustomerDetailScreen> createState() => _CampaignCustomerDetailScreenState();
}

class _CampaignCustomerDetailScreenState extends State<CampaignCustomerDetailScreen> {
  var _isCustomerTile = true;
  var _isCampaignTile = true;

  @override
  void initState() {
    context.read<CampaignCustomerDetailCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textWhiteColor,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: _textTitle(),
      ),
      body: BlocConsumer<CampaignCustomerDetailCubit, CampaignCustomerDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is CampaignCustomerDetailLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CampaignCustomerDetailLoaded){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  _customerTile(),
                  const SizedBox(height: 16),
                  _campaignTile(),
                ],
              )
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.campaignCustomerDetail,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _customerTile(){
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.symmetric(horizontal:8),
      visualDensity: const VisualDensity(vertical: -4),
      shape: const Border(),
      trailing: _isCustomerTile == false
          ? SvgPicture.asset(AppMediaRes.iconExpandDown)
          : SvgPicture.asset(AppMediaRes.iconExpandUp),
      collapsedBackgroundColor: AppColors.greenLightColor,
      onExpansionChanged: (bool expanded){
        setState(() {
          _isCustomerTile = expanded;
        });
      },
      title: Text(
        AppStrings.customerInformation,
        style: AppTextStyles.textStyleInterW500S14Black,
      ),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Họ và tên:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Lê Quốc Trung',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Email:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'a@gmail.com',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Địa chỉ:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Hà Nội',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Chức vụ:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Phó giám đốc',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Doanh nghiệp:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Công ty CP ABC',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _campaignTile(){
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.symmetric(horizontal:8),
      visualDensity: const VisualDensity(vertical: -4),
      shape: const Border(),
      trailing: _isCustomerTile == false
          ? SvgPicture.asset(AppMediaRes.iconExpandDown)
          : SvgPicture.asset(AppMediaRes.iconExpandUp),
      collapsedBackgroundColor: AppColors.greenLightColor,
      onExpansionChanged: (bool expanded){
        setState(() {
          _isCampaignTile = expanded;
        });
      },
      title: Text(
        AppStrings.campaignInformation,
        style: AppTextStyles.textStyleInterW500S14Black,
      ),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Chiến dịch:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Chiến dịch A',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Khách hàng:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Lê Quốc Trung',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'SĐT:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                '0123456789',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Thời điểm gọi ra:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                '2022-09-10 08:00',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Số lần gọi:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                '3',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Agent phụ trách:',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'Lê Quốc Trung',
                style: AppTextStyles.textStyleInterW500S14Black,
                textAlign: TextAlign.end,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
