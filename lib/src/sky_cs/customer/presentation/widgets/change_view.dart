import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

import '../../domain/entities/sky_customer_hist.dart';

class ChangeView extends StatefulWidget {
  final List<SKY_CustomerHist> lischange;
  const ChangeView({required this.lischange, super.key});

  @override
  State<ChangeView> createState() => _ChangeViewState();
}

class _ChangeViewState extends State<ChangeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lischange.length,
      itemBuilder: (context, index) {
        final change = widget.lischange[index];
        return InkWell(
          onTap: () {
            // Add your onTap functionality here if needed
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.textWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          change.LUDTimeUTC,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Chi tiết',
                        style: AppTextStyles.textStyleInterW400S12Primary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/change-detail', arguments: change);
                      },
                    ),
                  ],
                ),
                Text(
                  change.LUByName,
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
