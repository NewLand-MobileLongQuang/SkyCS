import 'dart:io';


import 'package:flutter/material.dart';
import 'package:idnstd/core/common/app/providers/user_provider.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/fonts.dart';
import 'package:idnstd/core/services/router.dart';
import 'package:idnstd/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:provider/provider.dart';
import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await init(AppEnviroments.development);
  //await init(AppEnviroments.production);
  runApp(const MyApp());
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController())
      ],
      child: MaterialApp(
        title: 'Ecore Std',
        theme: ThemeData(
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: AppFonts.interFont,
            scaffoldBackgroundColor: AppColors.textWhiteColor,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
