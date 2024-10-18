import 'package:idnstd/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingScreenLocalDataSource {
  const OnboardingScreenLocalDataSource();
  Future<void> cacheFirstTimer();
  Future<bool> checkIfUserIsFirstTimer();
}

const kCacheFirstTimer = 'cache_first_timer';

class OnBoardingScreenLocalDataSrcImpl implements OnboardingScreenLocalDataSource {
  const OnBoardingScreenLocalDataSrcImpl(this._pref);

  final SharedPreferences _pref;

  @override
  Future<void> cacheFirstTimer() async {
    try {

      await _pref.setBool(kCacheFirstTimer, false);
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: 'Code');
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      print("AAAAAAAAAAAAAAAAAAAAAAA");
      final result = await _pref.getBool(kCacheFirstTimer);

      if (result != null) return result;

      return true;
    } catch (e) {
      throw CacheException(Message: e.toString(), Code: 'Code');
    }
  }
}
