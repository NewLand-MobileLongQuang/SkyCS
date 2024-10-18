import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/core_utils.dart';
import 'package:idnstd/src/auth/presentation/cubit/auth_cubit.dart';

class SelectNetworkScreen extends StatefulWidget {
  const SelectNetworkScreen({super.key});

  static const routeName = '/select-network';

  @override
  State<SelectNetworkScreen> createState() => _SelectNetworkScreenState();
}

class _SelectNetworkScreenState extends State<SelectNetworkScreen> {
  @override
  void initState() {
    context.read<AuthCubit>().getNetworks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is AuthNetworkListLoaded) {
          if (state.networks.isEmpty) {
            CoreUtils.showSnackBar(context, 'No networks');
          }
        } else if (state is AuthNetworkSelected) {
            CoreUtils.showSnackBar(context, 'Network selected ${state.network.Name}.');
            Navigator.pushReplacementNamed(context, '/');
        }
      }, builder: (context, state) {
        if (state is AuthNetworkListLoaded) {
          final orgs = state.networks;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select network',
                    style: AppTextStyles.textStyleInterW500S32Black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<AuthCubit>().selectNetwork(network: orgs[index]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.primaryOpa11,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Text(
                              orgs[index].Name,
                              style: AppTextStyles.textStyleInterW500S16Black,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemCount: orgs.length,
                    ),
                  ),
                ]
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
