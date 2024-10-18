import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';

import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_column_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_group_model.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';

import '../../../../../core/common/widgets/inputs/i_text_field.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/media_res.dart';
import '../../../../../core/res/test_style.dart';

class InfoCustomerView extends StatelessWidget {
  final SKY_CustomerDetail customer;
  final List<SKY_CustomerGroupModel> listGroupFold;
  final List<SKY_CustomerColumnModel> listColumnFold;

  const InfoCustomerView({
    Key? key,
    required this.customer,
    required this.listGroupFold,
    required this.listColumnFold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerInfo = customer.Lst_Mst_Customer.first;
    final jsonCustomerInfo = jsonDecode(customerInfo.JsonCustomerInfo) as List<dynamic>;
    final jsonpartnertype = jsonDecode(customerInfo.CustomerInPartnerTypeJson) as List<dynamic>;
    return ListView.builder(
      itemCount: listGroupFold.length,
      itemBuilder: (context, index) {
        final group = listGroupFold[index];
        final columns = listColumnFold
            .where((col) => col.ColGrpCodeSys == group.ColGrpCodeSys)
            .toList();
        bool isExpanded = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return ExpansionTile(
              initiallyExpanded: true,
              tilePadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(vertical: -4),
              shape: const Border(),
              trailing: isExpanded
                  ? SvgPicture.asset(AppMediaRes.iconExpandUp)
                  : SvgPicture.asset(AppMediaRes.iconExpandDown),
              collapsedBackgroundColor: AppColors.greenLightColor,
              onExpansionChanged: (bool expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              title: Text(
                group.ColGrpName,
                style: AppTextStyles.textStyleInterW500S14Black,
              ),
              children: columns.map((col) {
                Widget inputWidget;
                String? value;
                final dynamicField;

                if (col.ColCodeSys == 'CustomerName') {
                  value = customerInfo.CustomerName;
                }
                else if (col.ColCodeSys == 'CustomerCode') {
                  value = customerInfo.CustomerCode;
                }
                else if (col.ColCodeSys == 'CustomerType') {
                  value = customerInfo.CustomerType;
                }
                else if (col.ColCodeSys == 'PartnerType') {
                   dynamicField = jsonpartnertype.first;
                   value = dynamicField['Mst_PartnerType'][0]['PartnerTypeName'] as String? ?? '';
                }
                else {
                   dynamicField = jsonCustomerInfo.firstWhere(
                        (info) => info['ColCodeSys'] == col.ColCodeSys,
                    orElse: () => null,
                  );
                  value = dynamicField?['ColValue'] as String? ?? '';
                }


                switch (col.ColDataType) {
                  case 'TEXT':
                    inputWidget = ITextField(
                      controller: TextEditingController(text: value),
                      label: col.ColCaption,
                      readOnly: true,
                    );
                    break;
                  default:
                    inputWidget = ITextField(
                      controller: TextEditingController(text: value),
                      label: col.ColCaption,
                      readOnly: true,
                    );
                }
                return ListTile(
                  title: inputWidget,
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
