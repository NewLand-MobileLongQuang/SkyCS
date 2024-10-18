import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

class GeneralInformationView extends StatefulWidget {
  const GeneralInformationView({super.key});

  @override
  State<GeneralInformationView> createState() => _GeneralInformationViewState();
}

class _GeneralInformationViewState extends State<GeneralInformationView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _itemText('Tên chiến dịch:', 'Chiến dịch chăm sóc khách hàng VIP tháng 6'),
          const SizedBox(height: 16),
          _itemText('Loại chiến dịch:', 'Chiến dịch gọi điện'),
          const SizedBox(height: 16),
          _itemText('Thời gian bắt đầu:', '2023-02-10 09:10'),
          const SizedBox(height: 16),
          _itemText('Thời gian kết thúc:', '2023-02-10 09:10'),
          const SizedBox(height: 16),
          _itemStatus('Trạng thái:', 'Chờ duyệt'),
          const SizedBox(height: 16),
          _itemText('Tổng khách hàng:', '15'),
          const SizedBox(height: 16),
          _itemText('SL KH định mức:', '15'),
          const SizedBox(height: 16),
          _itemText('Số lần gọi tối đa:', '2'),
          const SizedBox(height: 16),
          _itemText('Định mức gọi ra:', '15'),
          const SizedBox(height: 16),
          _itemTextList('Phản hồi từ KH:', 'Quan tâm đến sản phẩm, không quan tâm đến dịch vụ'),
          const SizedBox(height: 16),
          _itemAgent('Agent phụ trách:', 'Le Trung'),
          const SizedBox(height: 16),
          _itemText('Mô tả:', '-'),
          const SizedBox(height: 16),
          _itemFile('File đính kèm:', 'a.txt'),
        ],
      ),
    );
  }

  Widget _itemText(String title, String content) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S14Grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            content,
            style: AppTextStyles.textStyleInterW500S14Black,
            textAlign: TextAlign.end,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Widget _itemStatus(String title, String status) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
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
            status,
            style: AppTextStyles.textStyleInterW400S11White,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Widget _itemTextList(String title, String content) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyleInterW400S14Grey,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '   - $content',
          style: AppTextStyles.textStyleInterW500S14Black,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _itemAgent(String title, String name) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyleInterW400S14Grey,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.greenLightColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.circleAvatarColor,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    StringGenerate.getCurrentName(name).toUpperCase(),
                    style: AppTextStyles.textStyleInterW500S16Primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: AppTextStyles.textStyleInterW500S14Black,
                overflow: TextOverflow.ellipsis,
              ),
            ]
          ),
        )
      ],
    );
  }

  Widget _itemFile(String title, String file) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyleInterW400S14Grey,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.greenLightColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.circleAvatarColor,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      StringGenerate.getCurrentName(file).toUpperCase(),
                      style: AppTextStyles.textStyleInterW500S16Primary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  file,
                  style: AppTextStyles.textStyleInterW500S14Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ]
          ),
        )
      ],
    );
  }
}
