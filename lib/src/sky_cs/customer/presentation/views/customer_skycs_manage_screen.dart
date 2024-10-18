import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';

import '../../domain/entities/sky_customer_info.dart';

class CustomerSkyCSManageScreen extends StatefulWidget {
  const CustomerSkyCSManageScreen({super.key});

  static const routeName = '/customer-skycs-manage';

  @override
  State<CustomerSkyCSManageScreen> createState() =>
      _CustomerSkyCSManageScreenState();
}

class _CustomerSkyCSManageScreenState extends State<CustomerSkyCSManageScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;

  @override
  void initState() {
    super.initState();
    context.read<CustomerSkyCSManageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildCustomerList(),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.textWhiteColor,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        AppStrings.manageCustomer,
        style: AppTextStyles.textStyleInterW500S18White,
        maxLines: 2,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              // Trigger search in Cubit
              // context.read<CustomerSkyCSManageCubit>().search(_searchController.text);
            },
            onSubmitted: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              // Trigger search in Cubit
              // context.read<CustomerSkyCSManageCubit>().search(_searchController.text);
            },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              suffixIcon: isEmptyData
                  ? PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Tìm kiếm nâng cao'),
                    onTap: () {
                      Navigator.pushNamed(context, '/advanced-search');
                    },
                  ),
                ],
              )
                  : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    isEmptyData = true;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerList() {
    return Expanded(
      child: BlocConsumer<CustomerSkyCSManageCubit, CustomerSkyCSManageState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          if (state is CustomerSkyCSManageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CustomerSkyCSManageLoaded) {
            return ListView.separated(
              itemCount: state.listcusomter.length,
              separatorBuilder: (context, index) => Divider(color: AppColors.divideColor),
              itemBuilder: (context, index) {
                return _CustomerItem(customer: state.listcusomter[index]);
              },
            );
          } else {
            return const Center(
              child: Text('No customers found'),
            );
          }
        },
      ),
    );
  }

  Widget _buildAddButton() {
    return Row(
      children: [
        Expanded(child: Container()),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/customer-skycs-create');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(64, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textWhiteColor,
          ),
        ),
      ],
    );
  }
}

class _CustomerItem extends StatelessWidget {
  final SKY_CustomerInfo customer;

  const _CustomerItem({
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle customer item tap
        // context.read<CustomerManageCubit>().getByCustomerCodeSys(customer.customerCodeSys);
        Navigator.pushNamed(context, '/customer-skycs-detail', arguments: {
          'CustomerCodeSys': customer.CustomerCodeSys,
        });
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
            CircleAvatar(
              child: Text(
                StringGenerate.getCurrentName(customer.CustomerName).toUpperCase(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          customer.CustomerName,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        customer.CustomerCode,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          customer.CustomerPhoneNo,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        customer.CustomerEmail,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
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
