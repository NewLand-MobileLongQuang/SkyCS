import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/customer_skycs_manage_cubit/customer_skycs_manage_cubit.dart';

import '../../domain/entities/sky_customer_info.dart';


class CustomerSkyCSManageScreen extends StatelessWidget {
  const CustomerSkyCSManageScreen({super.key});

  static const routeName = '/customer-skycs-manage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerSkyCSManageCubit(searchCustomerSkyCSUseCase: sl())..init(),
      child: const CustomerSkyCSManageUIScreen(),
    );
  }
}

class CustomerSkyCSManageUIScreen extends StatefulWidget {
  const CustomerSkyCSManageUIScreen({super.key});

  @override
  State<CustomerSkyCSManageUIScreen> createState() => _CustomerSkyCSManageUIScreenState();
}

class _CustomerSkyCSManageUIScreenState extends State<CustomerSkyCSManageUIScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<CustomerSkyCSManageCubit>().loadMore();
      }
    });
    super.initState();
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
            _buildSearchBar(context),
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

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              if(value.isEmpty) {
                context.read<CustomerSkyCSManageCubit>().init();
              }
              //context.read<CustomerSkyCSManageCubit>().search(_searchController.text);
            },
            onSubmitted: (value) {
              context.read<CustomerSkyCSManageCubit>().search(_searchController.text);
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
                itemBuilder: (context) =>
                [
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
                  context.read<CustomerSkyCSManageCubit>().init();
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
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
          }
          if (state is CustomerSkyCSManageError) {
            return Text(
              state.message,
            );
          }
          if (state is CustomerSkyCSManageLoaded) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.listCustomer.length,
                    separatorBuilder: (context, index) => const Divider(color: AppColors.divideColor),
                    itemBuilder: (context, index) {
                      return _customerItem(customer: state.listCustomer[index]);
                    },
                  ),
                  if(state is CustomerSkyCSManageLoadingMore)...[
                    const LoadingView(),
                  ],
                ],
              ),
            );
          }
          return const Center(
            child: Text('No customers found'),
          );
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

  Widget _customerItem({required SKY_CustomerInfo customer}) {
    return InkWell(
      onTap: () {
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