import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';

class ETicketView extends StatefulWidget {
  const ETicketView({super.key});

  @override
  State<ETicketView> createState() => _ETicketViewState();
}

class _ETicketViewState extends State<ETicketView> {
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

            const SizedBox(width: 8,),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hỗ trợ tạo đơn hàng DH001-22003 trên DMS '
                      'cho khách hàng Nguyễn Phương Linh (#TK002)',
                  style: AppTextStyles.textStyleInterW500S14Black,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Text(
                      'TG tạo:',
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
                      'Deadline:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '2024-01-14 09:15',
                      style: AppTextStyles.textStyleInterW500S12Black,
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
                      'Trạng thái:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'New',
                      style: AppTextStyles.textStyleInterW500S12Green,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'TG xử lý:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '1 giờ 3 phút',
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
