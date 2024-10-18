import 'package:flutter/cupertino.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';
import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier {
  SessionInfo? _session;

  InosUser? get user => _session?.user;

  SessionInfo? get session => _session;

  void initSession(SessionInfo? session) {
    if (_session != session) _session = session;
  }

  set session(SessionInfo? session) {
    if (_session != session) {
      _session=session;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
