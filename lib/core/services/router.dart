import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnstd/core/common/views/page_under_construction.dart';
import 'package:idnstd/core/services/router/auth_router.dart';
import 'package:idnstd/core/services/router/e_service_router.dart';
import 'package:idnstd/core/services/router/sky_cs_router.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  return handleCaseAuth(settings)
      ?? handleCaseEService(settings)
      ?? handleCaseSkyCS(settings)
      ?? handleDefault(settings);
}

PageRouteBuilder handleDefault(RouteSettings settings) {
  return pageBuilder((p0) => const PageUnderConstruction(),
      settings: settings);
}

PageRouteBuilder<dynamic> pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      pageBuilder: (context, _, __) => page(context));
}
