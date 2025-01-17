import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/common/widgets/main_app_bar.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/apps.dart';
import 'package:idnstd/src/e_service/presentation/cubit/e_service_cubit/e_service_cubit.dart';


class EServiceScreen extends StatefulWidget {
  const EServiceScreen({super.key});

  static const routeName = '/e-service';

  @override
  State<EServiceScreen> createState() => _EServiceScreenState();
}

class _EServiceScreenState extends State<EServiceScreen> {

  @override
  void initState() {
    context.read<EServiceCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EServiceCubit, EServiceState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is EServiceLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is EServiceLoaded) {
          return Scaffold(
              appBar: const MainAppBar(title: 'E-Service', isHeader: true,),
              body: Padding(
                padding: const EdgeInsets.all(32),
                child: GridView.builder(
                  itemCount: AppEService.listSolutionEService.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (AppEService.listSolutionEService[index].title == 'Quản lí bảo hành') {
                          Navigator.pushNamed(context, '/guarantee-manage');
                        }
                        if (AppEService.listSolutionEService[index].title == 'Quản lí sửa chữa') {
                          Navigator.pushNamed(context, '/repair-manage');
                        }
                        if (AppEService.listSolutionEService[index].title == 'Tra cứu lịch sử sửa chữa') {
                          Navigator.pushNamed(context, '/repair-history-search');
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
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppEService.listSolutionEService[index].image),
                                const SizedBox(height: 16),
                                Text(
                                  AppEService.listSolutionEService[index].title,
                                  style: AppTextStyles.textStyleInterW400S16Black,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
          );
        }
        return Container();
      },
    );
  }
}
