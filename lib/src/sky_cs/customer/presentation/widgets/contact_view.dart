import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import '../../domain/entities/sky_customer_contact.dart';

class ContactView extends StatefulWidget {
  final List<SKY_CustomerContact> listcuscontract;
  const ContactView({required this.listcuscontract, super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listcuscontract.length,
      itemBuilder: (context, index) {
        final contact = widget.listcuscontract[index];
        return InkWell(
          onTap: () {
            // Add your onTap functionality here
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
                          contact.mcc_CustomerName,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        contact.mcc_CustomerPhoneJson,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Giám đốc', // Replace with appropriate data if available
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  contact.mcc_CustomerEmailJson,
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
