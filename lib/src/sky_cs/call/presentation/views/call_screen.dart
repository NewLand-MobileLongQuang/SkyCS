import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/main_app_bar.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/views/call_out_view.dart';


class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  static const routeName = '/call';

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: const MainAppBar(title: AppStrings.call, isHeader: false,),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                tabs: const [
                  Tab(
                    text: 'Gọi ra',
                  ),
                  Tab(
                    text: 'Gọi nội bộ',
                  ),
                  Tab(
                    text: 'Gọi vào',
                  )
                ],
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                labelStyle: AppTextStyles.textStyleInterW500S14Black,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  CallOutView(),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
