import 'package:flutter/material.dart';
import 'package:idnstd/core/common/widgets/main_app_bar.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/apps.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MainAppBar(title: 'Home', isHeader: true,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: Apps.listApps.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (BuildContext context, int index){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    if(Apps.listApps[index].title == 'E-Service') {
                      Navigator.pushNamed(context, '/e-service');
                    }
                    if(Apps.listApps[index].title == 'SkyCS') {
                      Navigator.pushNamed(context, '/sky-cs');
                    }
                  },
                  child: Image.asset(
                    Apps.listApps[index].image,
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  Apps.listApps[index].title,
                  style: AppTextStyles.textStyleInterW400S16Black,
                  maxLines: 2,
                ),
              ],
            );
          },
        ),
      )
    );
  }
}
