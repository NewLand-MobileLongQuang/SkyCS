import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/common/widgets/main_app_bar.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/apps.dart';
import 'package:idnstd/src/sky_cs/presentation/cubit/sky_cs_cubit.dart';

class SkyCsScreen extends StatefulWidget {
  const SkyCsScreen({super.key});

  static const routeName = '/sky-cs';

  @override
  State<SkyCsScreen> createState() => _SkyCsScreenState();
}

class _SkyCsScreenState extends State<SkyCsScreen> {
  @override
  void initState() {
    context.read<SkyCsCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SkyCsCubit, SkyCsState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is SkyCsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is SkyCsLoaded) {
          return Scaffold(
              appBar: const MainAppBar(title: 'SkyCS', isHeader: true,),
              body: Padding(
                padding: const EdgeInsets.all(32),
                child: GridView.builder(
                  itemCount: AppSkyCs.listSolutionSkyCs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'Gọi điện') {
                          Navigator.pushNamed(context, '/call');
                        }
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'Giám sát') {

                        }
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'eTicket') {
                          Navigator.pushNamed(context, '/eTicket');
                        }
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'Chiến dịch') {
                          Navigator.pushNamed(context, '/campaign');
                        }
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'Khách hàng') {
                          Navigator.pushNamed(context, '/customer-skycs-manage');
                        }
                        if (AppSkyCs.listSolutionSkyCs[index].title == 'Báo cáo') {

                        }
                      },
                      child: Card(
                        color: AppColors.textWhiteColor,
                        shadowColor: AppColors.buttonGreyColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.divideColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        surfaceTintColor: AppColors.textWhiteColor,
                        elevation: 4,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AppSkyCs.listSolutionSkyCs[index].image),
                              const SizedBox(height: 16),
                              Text(
                                AppSkyCs.listSolutionSkyCs[index].title,
                                style: AppTextStyles.textStyleInterW400S16Black,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      )
                    );
                  },
                ),
              )
          );
        }
        return const SizedBox();
      },
    );
  }
}
