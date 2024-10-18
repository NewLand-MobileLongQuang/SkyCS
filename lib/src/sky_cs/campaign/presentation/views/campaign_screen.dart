import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  static const routeName = '/campaign';

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              _item(title: 'Quản lý chiến dịch'),
              const Divider(height: 1, color: AppColors.divideColor),
              _item(title: 'Quản lý agent trong chiến dịch'),
              const Divider(height: 1, color: AppColors.divideColor),
              _item(title: 'Thực hiện chiến dịch'),
            ],
          )
        ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.campaignTitle,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _item({required String title}) {
    return InkWell(
      onTap: () {
        if(title == 'Quản lý chiến dịch') {
          Navigator.pushNamed(context, '/campaign-manage');
        }
        if(title == 'Quản lý agent trong chiến dịch') {
          Navigator.pushNamed(context, '/campaign-agent');
        }
        if(title == 'Thực hiện chiến dịch') {
         Navigator.pushNamed(context, '/campaign-perform');
        }
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
              child: SizedBox(
                child: Text(
                    title,
                    style: AppTextStyles.textStyleInterW400S16Black,
                    overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            const Icon(
              Icons.arrow_right,
            )
          ],
        ),
      ),
    );
  }
}
