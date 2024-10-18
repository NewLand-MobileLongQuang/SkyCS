import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_perform_cubit/campaign_perform_cubit.dart';

class CampaignPerformScreen extends StatefulWidget {
  const CampaignPerformScreen({super.key});

  static const String routeName = '/campaign-perform';

  @override
  State<CampaignPerformScreen> createState() => _CampaignPerformScreenState();
}

class _CampaignPerformScreenState extends State<CampaignPerformScreen> {
  TextEditingController campaignController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController customerController = TextEditingController();

  @override
  void initState() {
    context.read<CampaignPerformCubit>().init();
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
      body: BlocConsumer<CampaignPerformCubit, CampaignPerformState>(
        listener: (context, state) {
          if(state is CampaignPerformLoaded){
            campaignController.text = state.listCampaign.first;
            statusController.text = state.listStatus.first;
            customerController.text = '';
          }
        },
        builder: (context, state) {
          if(state is CampaignPerformLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is CampaignPerformLoaded){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _itemList(title: AppStrings.campaign, controller: campaignController, list: state.listCampaign),
                  _itemList(title: AppStrings.status, controller: statusController, list: state.listStatus),
                  _itemText(title: AppStrings.customer, controller: customerController),
                  const SizedBox(height: 8),
                  _totalCustomer(),
                  const SizedBox(height: 8),
                  _listCustomer(context),
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
      AppStrings.campaignPerform,
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

  Widget _itemText({
    required TextEditingController controller ,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ITextField(
          controller: controller,
          label: title,
          hintText: 'Nhập mã, tên, SĐT, email',
        )
      ],
    );
  }

  Widget _totalCustomer() {
    return Row(
      children: [
        Text(
          'Danh sách khách hàng',
          style: AppTextStyles.textStyleInterW400S14Grey,
        ),
        Expanded(child: Container()),
        Text(
          'Tổng: 15',
          style: AppTextStyles.textStyleInterW400S14Grey,
        ),
      ],
    );
  }

  Widget _listCustomer(BuildContext context) {
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
          return _itemCustomer(context);
        }
      )
    );
  }

  Widget _itemCustomer(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/campaign-perform-detail');
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
            CircleAvatar(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  StringGenerate.getCurrentName('Trung Le').toUpperCase(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lê Quốc Trung',
                    style: AppTextStyles.textStyleInterW400S16Black,
                    maxLines: 3,
                  ),
                  Text(
                    '0123456789',
                    style: AppTextStyles.textStyleInterW400S14Grey,
                    maxLines: 3,
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
