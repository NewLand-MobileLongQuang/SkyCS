import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_call_call.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_cpn_campaign_customer.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_detail.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_et_ticket.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_detail_cubit/customer_skycs_detail_cubit.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/called_view.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/campaign_view.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/change_view.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/contact_view.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/e_ticket_view.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/widgets/info_customer_view.dart';

class CustomerSkyCSDetailScreen extends StatefulWidget {
  final String customerCodeSys;
  const CustomerSkyCSDetailScreen({
    required this.customerCodeSys,
    super.key,
  });

  static const routeName = '/customer-skycs-detail';

  @override
  State<CustomerSkyCSDetailScreen> createState() => _CustomerSkyCSDetailScreenState();
}

class _CustomerSkyCSDetailScreenState extends State<CustomerSkyCSDetailScreen> {
  TextEditingController phoneController = TextEditingController();
  final List<String> listPhone = ['0123456789', '0123456788', '0123456787', '0123456786'];
  late String customerCodeSys;

  @override
  void initState() {
    phoneController.text = listPhone.first;
    customerCodeSys = widget.customerCodeSys;
    super.initState();
    context.read<CustomerSkyCSDetailCubit>().init(customerCodeSys);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerSkyCSDetailCubit, CustomerSkyCSDetailState>(
      builder: (context, state) {
        if (state is CustomerSkyCSDetailLoading) {
          return Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: AppColors.textWhiteColor,
            child: const LoadingView(),
          );
        }
        if (state is CustomerSkyCSDetailStateLoaded) {
          return DefaultTabController(
            initialIndex: 0,
            length: 7,
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
                  _customerView(state.customerDetail),
                  _tabBar(),
                  _tabBarView(
                    customer: state.customerDetail,
                    listCall: state.listCall,
                    listTicket: state.listTicket,
                    listCampaign: state.listCampaign,
                  ),
                ],
              ),
            ),
          );
        }
        if (state is CustomerSkyCSDetailStateError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      }
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.infoCustomer,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _customerView(SKY_CustomerDetail customer) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                StringGenerate.getCurrentName(customer.Lst_Mst_Customer.first.CustomerName).toUpperCase(),
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
                  customer.Lst_Mst_Customer.first.CustomerName,
                  style: AppTextStyles.textStyleInterW400S16Black,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  customer.Lst_Mst_Customer.first.CustomerCode,
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  customer.Lst_Mst_Customer.first.CustomerEmail,
                  style: AppTextStyles.textStyleInterW400S14Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Expanded(
                    //   child: ISelectField(
                    //     getLabel: (String value) => value,
                    //     options: listPhone,
                    //     hintText: 'phone',
                    //     value: phoneController.text,
                    //     onChanged: (String? newValue) {
                    //       if (newValue != null) {
                    //         phoneController.text = newValue;
                    //       }
                    //     },
                    //   ),
                    // ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        // Add functionality for phone call
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 50,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: const [
          Tab(text: 'Tất cả'),
          Tab(text: 'Cuộc gọi'),
          Tab(text: 'eTicket'),
          Tab(text: 'Chiến dịch'),
          Tab(text: 'Chi tiết KH'),
          Tab(text: 'DS liên hệ'),
          Tab(text: 'LS thay đổi'),
        ],
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        labelStyle: AppTextStyles.textStyleInterW500S14Black,
      ),
    );
  }

  Widget _tabBarView({
    required SKY_CustomerDetail customer,
    required List<SKY_CustomerCallCall> listCall,
    required List<SKY_CustomerETTicket> listTicket,
    required List<SKY_CustomerCpnCampaignCustomer> listCampaign,
  }) {
    return Expanded(
      child: TabBarView(
        children: [
          CalledView(listCall: listCall),
          CalledView(listCall: listCall),

          ETicketView(listTicket: listTicket),
          CampaignView(listCampaign: listCampaign),
          InfoCustomerView(customer: customer),
          ContactView(customerCodeSys: customerCodeSys),
          ChangeView(customerCodeSys: customerCodeSys),
        ],
      ),
    );
  }
}