import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

class ListCustomerView extends StatefulWidget {
  const ListCustomerView({super.key});

  @override
  State<ListCustomerView> createState() => _ListCustomerViewState();
}

class _ListCustomerViewState extends State<ListCustomerView> {
  TextEditingController statusController = TextEditingController();
  final List<String> listStatus = ['Chờ duyệt', 'Đã duyệt', 'Từ chối', 'Đang chăm sóc', 'Hoàn thành'];

  @override
  void initState() {
    statusController.text = listStatus.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _itemList(title: AppStrings.campaign, controller: statusController, list: listStatus),
          const SizedBox(height: 8),
          _totalCustomer(),
          const SizedBox(height: 8),
          _listCustomer(context),
          const SizedBox(height: 8),
        ],
      ),
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
        Navigator.pushNamed(context, '/contact-history');
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
                  Row(
                    children: [
                      Text(
                        'Lê Quốc Trung',
                        style: AppTextStyles.textStyleInterW400S16Black,
                        maxLines: 3,
                      ),
                      Expanded(child: Container(),),
                      Text(
                        'Chưa thực hiện',
                        style: AppTextStyles.textStyleInterW500S14Yellow,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0123456789',
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Số lần gọi: 3',
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CircleAvatar(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            StringGenerate.getCurrentName('Trung Le').toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
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
