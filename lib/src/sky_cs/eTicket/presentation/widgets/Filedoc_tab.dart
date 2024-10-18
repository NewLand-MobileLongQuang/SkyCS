import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/test_style.dart';


class FiledocView extends StatefulWidget {
  const FiledocView({super.key});

  @override
  State<FiledocView> createState() => _FiledocViewState();
}

class _FiledocViewState extends State<FiledocView> {

  @override
  void initState() {
    super.initState();
  }


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
            Column(
              children: [
                SvgPicture.asset(AppMediaRes.iconCallOut,),
              ],
            ),
            const SizedBox(width: 3,),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tài liệu hướng dẫn.docx',
                  style: AppTextStyles.textStyleInterW500S14Black,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Text(
                      'Định dạng:Docx',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'Nguyễn Văn Bình',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Dung lượng:120KB',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '2023-03-02 09:15',
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
