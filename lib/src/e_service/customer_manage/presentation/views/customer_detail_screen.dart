import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:idnstd/src/e_service/customer_manage/presentation/cubit/customer_detail_cubit/customer_detail_cubit.dart';

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({required this.customerCodeSys, super.key});

  static const routeName = '/customer-detail';
  final String customerCodeSys;

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  void initState() {
    context.read<CustomerDetailCubit>().init(widget.customerCodeSys);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<CustomerDetailCubit, CustomerDetailState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if (state is CustomerDetailLoading) {
                return const LoadingView();
              }
              if (state is CustomerDetailLoaded) {
                return ListView(
                  children: [
                    _titleCustomerInformation(state.rt_esCustomerDetail),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _textTitle() {
    return Text(
      AppStrings.detailCustomer,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _titleCustomerInformation(RT_ESCustomerDetail rt_esCustomerDetail) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.primaryColor,
          child: rt_esCustomerDetail.Lst_Mst_Customer.first.CustomerAvatarPath != ''
          ? Image.network(
                rt_esCustomerDetail.Lst_Mst_Customer.first.CustomerAvatarPath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
        : const Icon(
            Icons.person,
            size: 50,
            color: AppColors.textWhiteColor,
          ),
        ),
        const SizedBox(height: 16),
        _itemText(value: rt_esCustomerDetail.Lst_Mst_Customer.first.CustomerCode, title: AppStrings.customerIdTitle),
        _itemText(value: rt_esCustomerDetail.Lst_Mst_Customer.first.CustomerName, title: AppStrings.customerNameTitle),
        _itemText(value: rt_esCustomerDetail.Lst_Mst_Customer.first.CustomerAddress, title: AppStrings.customerAddressTitle),
        _itemText(value: rt_esCustomerDetail.Lst_Mst_CustomerPhone.first.CtmPhoneNo, title: AppStrings.customerPhoneTitle),
        _itemText(value: rt_esCustomerDetail.Lst_Mst_CustomerEmail.first.CtmEmail, title: AppStrings.customerEmailTitle),
      ],
    );
  }

  Widget _itemText({required String value ,required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ITextField(
                readOnly: true,
                hintText: value,
                hintStyle: AppTextStyles.textStyleInterW400S14Black,
                label: title,
              ),
            ),
          ],
        )
      ],
    );
  }
}
