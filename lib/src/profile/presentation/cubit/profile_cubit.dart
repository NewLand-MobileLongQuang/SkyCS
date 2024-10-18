import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/src/auth/domain/usecases/get_current_user.dart';
import 'package:idnstd/src/auth/domain/usecases/save_user_profile.dart';
import 'package:idnstd/src/profile/domain/usecases/change_language.dart';

import '../../../../core/common/app/entities/inos_user.dart';
import '../../../auth/domain/usecases/save_session_info.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
      {required SaveUserProfile saveUserProfile,
      required SaveSessionInfo saveSessionInfo,
      required ChangeLanguage changeLanguage,
      required GetCurrentUser getCurrentUser})
      : _saveUserProfile = saveUserProfile,
        _saveSessionInfo = saveSessionInfo,
        _changeLanguage = changeLanguage,
        _getCurrentUser = getCurrentUser,
        super(const ProfileInitial());

  final SaveUserProfile _saveUserProfile;
  final SaveSessionInfo _saveSessionInfo;
  final ChangeLanguage _changeLanguage;
  final GetCurrentUser _getCurrentUser;


  Future<void> saveUserProfile(
      {required String accessToken,
      required String name,
      String avatar = '',
      String language = '',
      String currentPassword = '',
      String newPassword = ''}) async {
    emit(const ProfileStateLoading());
    final result = await _saveUserProfile(EditProfileParams(
        name: name,
        avatar: avatar,
        language: language,
        ));

    result.fold((failure) => emit(ProfileStateError(message: failure.Message)),
        (r) async{
          final currentSs= SessionInfo.current();
          final session = SessionInfo(user: r, auth: currentSs.auth, org: currentSs.org, solutionAPI: currentSs.solutionAPI);
          await _saveSessionInfo(session);

          SessionInfo.reset();
      emit(ProfileStateSaved(currentUser: r));
    });
  }

  Future<void> changeLanguage(String language) async {
    emit(const ProfileStateLoading());
    final result = await _changeLanguage(language);

    result.fold((failure) => emit(ProfileStateError(message: failure.Message)),
        (r) => emit(const ProfileStateChanged()));
  }
}
