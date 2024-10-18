import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_detail_cubit/campaign_perform_detail_cubit.dart';

class CampaignPerformDetailScreen extends StatefulWidget {
  const CampaignPerformDetailScreen({super.key});

  static const String routeName = '/campaign-perform-detail';

  @override
  State<CampaignPerformDetailScreen> createState() =>
      _CampaignPerformDetailScreenState();
}

class _CampaignPerformDetailScreenState
    extends State<CampaignPerformDetailScreen> {
  @override
  void initState() {
    context.read<CampaignPerformDetailCubit>().init();
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
      body: BlocConsumer<CampaignPerformDetailCubit, CampaignPerformDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _buttonTop(),
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
                              style: AppTextStyles.textStyleInterW500S14Primary,
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
                              'Điện thoại:',
                              style: AppTextStyles.textStyleInterW400S14Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0123456789',
                              style: AppTextStyles.textStyleInterW500S14Primary,
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
                              'Trạng thái thực hiện:',
                              style: AppTextStyles.textStyleInterW400S14Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.textYellowColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              'Chưa thực hiện',
                              style: AppTextStyles.textStyleInterW400S11White,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ITextField(
                        label: 'Ghi chú',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      ITextField(
                        label: 'Ghi chú',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      ITextField(
                        label: 'Ghi chú',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                buttonBottom(),
              ],
            )
          );
        },
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.campaignPerformDetail,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _buttonTop() {
    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.textWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              'Hẹn gọi lại',
              style: AppTextStyles.textStyleInterW500S14Primary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.textWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              'Không liên hệ',
              style: AppTextStyles.textStyleInterW500S14Primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonBottom() {
    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/contact-history');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              'Lịch sử liên hệ',
              style: AppTextStyles.textStyleInterW500S14White,
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/campaign-customer-detail');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              'Chi tiết KH & Chiến dịch',
              style: AppTextStyles.textStyleInterW500S14White,
            ),
          ),
        ),
      ],
    );
  }

}
