import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/src/sky_cs/customer/presentation/cubit/contact_view_cubit/contact_view_cubit.dart';


class ContactView extends StatefulWidget {
  const ContactView({required this.customerCodeSys, super.key});

  final String customerCodeSys;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ContactViewCubit(searchCustomerContactUseCase: sl())
        ..init(widget.customerCodeSys),
      child: BlocConsumer<ContactViewCubit, ContactViewState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is ContactViewLoading){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
          }
          if(state is ContactViewLoaded) {
            return ListView.builder(
              itemCount: state.listCustomerContact.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                              flex: 2,
                              child: SizedBox(
                                child: Text(
                                  state.listCustomerContact[index].mcc_CustomerName,
                                  style: AppTextStyles.textStyleInterW400S16Black,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  state.listCustomerContact[index].mcc_CustomerPhoneJson,
                                  style: AppTextStyles.textStyleInterW400S14Grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                          state.listCustomerContact[index].LogLUBy,
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
          return Container();
        },
      ),
    );
  }
}
