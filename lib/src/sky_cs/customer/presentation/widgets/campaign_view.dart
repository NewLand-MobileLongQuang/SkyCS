import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/test_style.dart';

class CampaignView extends StatefulWidget {
  const CampaignView({super.key});

  @override
  State<CampaignView> createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

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
            SvgPicture.asset(AppMediaRes.iconBlueCampaign,),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chiến dịch chăm sóc khách hàng VIP tháng 1 năm 2024',
                  style: AppTextStyles.textStyleInterW500S14Black,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Text(
                      'TT chiến dịch:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'Kết thúc',
                      style: AppTextStyles.textStyleInterW500S12Blue,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'TT thực hiện:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'Thành công',
                      style: AppTextStyles.textStyleInterW500S12Blue,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Agent phụ trách:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'Lê Quốc Trung',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'TG thực hiện:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '2024-01-14 09:15:00',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Loại chiến dịch',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'Chăm sóc khách hàng',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
