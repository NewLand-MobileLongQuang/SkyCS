import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_agent_cubit/campaign_agent_cubit.dart';

class CampaignAgentScreen extends StatefulWidget {
  const CampaignAgentScreen({super.key});

  static const String routeName = '/campaign-agent';

  @override
  State<CampaignAgentScreen> createState() => _CampaignAgentScreenState();
}

class _CampaignAgentScreenState extends State<CampaignAgentScreen> {
  TextEditingController campaignController = TextEditingController();
  TextEditingController agentController = TextEditingController();

  @override
  void initState() {
    context.read<CampaignAgentCubit>().init();
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
      body: BlocConsumer<CampaignAgentCubit, CampaignAgentState>(
        listener: (context, state) {
          if(state is CampaignAgentLoaded){
            campaignController.text = state.listCampaign.first;
            agentController.text = state.listAgent.first;
          }
        },
        builder: (context, state) {
          if(state is CampaignAgentLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is CampaignAgentLoaded){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _itemList(title: AppStrings.campaign, controller: campaignController, list: state.listCampaign),
                  _itemList(title: AppStrings.agent, controller: agentController, list: state.listAgent),
                  const SizedBox(height: 8),
                  _totalCampaign(),
                  const SizedBox(height: 8),
                  _listCampaign(context),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.campaignAgent,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _itemList({
    required TextEditingController controller ,
    required String title,
    required List<String> list,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        // ISelectField(
        //   getLabel: (String value) => value,
        //   options: list,
        //   hintText: title,
        //   value: controller.text,
        //   onChanged: (String? newValue) {
        //     if (newValue != null) {
        //       controller.text = newValue;
        //     }
        //   },
        // ),
      ],
    );
  }

  Widget _totalCampaign() {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(
          'Tổng: 15',
          style: AppTextStyles.textStyleInterW400S14Grey,
        ),
      ],
    );
  }

  Widget _listCampaign(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          itemCount: 15,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: AppColors.divideColor,
            indent: 8,
            endIndent: 8,
          ),
          itemBuilder: (context, index) {
            return _itemCampaign(context);
          }
        )
    );
  }

  Widget _itemCampaign(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.textWhiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chiến dịch chăm sóc khách hàng VIP tháng 1 năm 2024',
                    style: AppTextStyles.textStyleInterW400S16Black,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            StringGenerate.getCurrentName('Trung Le').toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Lê Quốc Trung - máy lẻ: 10003',
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'SL KH phụ trách: 0/100',
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(child: Container(),),
                      Text(
                        'Kết thúc',
                        style: AppTextStyles.textStyleInterW500S14Blue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
