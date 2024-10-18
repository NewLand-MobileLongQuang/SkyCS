import 'dart:core';

import 'package:flutter/material.dart';
import 'package:idnstd/core/common/app/providers/tab_navigator.dart';
import 'package:idnstd/core/common/views/persistent_view.dart';
import 'package:idnstd/src/home/presentation/views/home_screen.dart';
import 'package:idnstd/src/profile/presentation/views/profile_screen.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier
{

  List<int> _indexHistory=[0];
  final List<Widget> _screens =[
    ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: HomeScreen())), child: PersistentView(),),
    ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: ProfileScreen())), child: PersistentView(),),
  ];
  List<Widget> get screens=>_screens;
  int _currentIndex=0;
  int get currentIndex =>_currentIndex;

  void changeIndex(int index)
  {
    if(_currentIndex==index) return;
    _currentIndex=index;
    _indexHistory.add(index);
     notifyListeners();
  }

  void goBack()
  {
    if(_indexHistory.length==1) return;
    _indexHistory.removeLast();
    _currentIndex=_indexHistory.last;
    notifyListeners();
  }

  void resetIndex()
  {
    _indexHistory=[0];
    _currentIndex=0;
    notifyListeners();
  }
}