import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

import 'package:idnstd/src/sky_cs/eTicket/presentation/widgets/Filedoc_tab.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/widgets/detail_tab.dart';
import 'package:idnstd/src/sky_cs/eTicket/presentation/widgets/interact_tab.dart';

class eTicketDetailScreen extends StatefulWidget {
  const eTicketDetailScreen({required String id,super.key });

  static const routeName = '/eTicket_detail';

  @override
  State<eTicketDetailScreen> createState() => _eTicketDetailScreenState();
}

class _eTicketDetailScreenState extends State<eTicketDetailScreen> {
  TextEditingController phoneController = TextEditingController();
  final List<String> listPhone = ['0123456789', '0123456788', '0123456787', '0123456786'];

  @override
  void initState() {
    phoneController.text = listPhone.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
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
        body: Column(
            children: [
              _customerView(),
              _tabBar(),
              _tabBarView(),
            ]
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.eTicketdetail,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _customerView() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Hỗ trợ tạo đơn hàng cho khách hàng Nguyễn Văn A trên hệ thống DMS (#TK005)"
            ,style: AppTextStyles.textStyleInterW400S16Black,),
          Row(
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
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'Nguyen Van An',
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // Expanded(
                          //     child: ISelectField(
                          //       getLabel: (String value) => value,
                          //       options: listPhone,
                          //       hintText: 'phone',
                          //       value: phoneController.text,
                          //       onChanged: (String? newValue) {
                          //         if (newValue != null) {
                          //           phoneController.text = newValue;
                          //         }
                          //       },
                          //     )
                          // ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Icon(
                                Icons.call,
                                size: 28,
                                color: AppColors.textWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ],
      )

    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 50,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        tabs: const [
          Tab(
            text: 'Tương tác',
          ),
          Tab(
            text: 'Chi tiết',
          ),
          Tab(
            text: 'Tài liệu đính kèm ',
          ),
        ],
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        labelStyle: AppTextStyles.textStyleInterW500S14Black,
      ),
    );
  }

  Widget _tabBarView() {
    return const Expanded(
      child: TabBarView(
        children: [
          ListViewCustomerDetail(type: 'Tương tác'),
          ViewDetail(type: 'Chi tiết'),
          ListViewCustomerDetail(type: 'Tài liệu đính kèm'),
        ],
      ),
    );
  }
}

class ListViewCustomerDetail extends StatefulWidget {
  const ListViewCustomerDetail({super.key, required this.type});

  final String type;

  @override
  State<ListViewCustomerDetail> createState() => _ListViewCustomerDetailState();
}

class _ListViewCustomerDetailState extends State<ListViewCustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if(widget.type == 'Tương tác') {
          return InteractView();
        }
        if (widget.type == 'Tài liệu đính kèm') {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Implement add action here
                  },
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  icon: Icons.more_horiz,
                  label: 'Thêm',
                ),
                SlidableAction(
                  onPressed: (context) {
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Xóa',
                ),

              ],
            ),
            child: const FiledocView(),
          );
        }
        return Container();
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.divideColor,
      ),
      itemCount: 10,
    );
  }
}



