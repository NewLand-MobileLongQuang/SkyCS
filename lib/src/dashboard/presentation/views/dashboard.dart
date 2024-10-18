import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (_, controller, __) {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex,
          children: controller.screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          elevation: 8,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex==0?IconlyBold.home: IconlyLight.home,
                  color: controller.currentIndex==0?AppColors.primaryColor: Colors.grey,
                ),
                label: 'Home',
                backgroundColor: Colors.white),

            // BottomNavigationBarItem(
            //     icon: Image.asset('${MediaRes.baseSolutionIcons}/work.png'),
            //     label: 'Work',
            //     backgroundColor: Colors.white),
            //
            BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex==2?IconlyBold.profile: IconlyLight.profile,
                  color: controller.currentIndex==2?AppColors.primaryColor: Colors.grey,
                ),
                label: 'Profile',
                backgroundColor: Colors.white),
          ],
        ),
      );
    });
  }
}
