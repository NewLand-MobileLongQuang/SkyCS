import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/main_app_bar.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/call/forward/presentation/widgets/agent_view.dart';
import 'package:idnstd/src/sky_cs/call/forward/presentation/widgets/phone_views.dart';


class ForwardScreen extends StatefulWidget {
  const ForwardScreen({super.key});

  static const routeName = '/forward';

  @override
  State<ForwardScreen> createState() => _ForwardScreenState();
}

class _ForwardScreenState extends State<ForwardScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: const MainAppBar(title: AppStrings.call, isHeader: false,),
          body: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: 'Agent',
                      ),
                      Tab(
                        text: 'Điện thoại',
                      ),
                    ],
                    indicatorColor: AppColors.primaryColor,
                    labelColor: AppColors.primaryColor,
                    labelStyle: AppTextStyles.textStyleInterW500S14Black,
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      AgentView(),
                      PhoneView(),
                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}
