import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/common/app/providers/tab_navigator.dart';
import 'package:idnstd/core/common/app/providers/user_provider.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  UserProvider get userProvider => read<UserProvider>();
  InosUser? get currentUser => userProvider.user;

  SessionInfo? get sessionInfo => userProvider.session;

  TabNavigator get tabNavigator => read<TabNavigator>();
   void pop()=> tabNavigator.pop();
   void push(Widget page)=>tabNavigator.push(TabItem(child: page));
}
