part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
const ProfileInitial();
}



final class ProfileStatePickingImage extends ProfileState
{
  const ProfileStatePickingImage();



}

final class ProfileStateLoading extends ProfileState
{
  const ProfileStateLoading();



}

final class ProfileStateError extends ProfileState
{
  const ProfileStateError({required this.message});

  final String message;

}


final class ProfileStateSaved extends ProfileState
{
  const ProfileStateSaved({required this.currentUser});

  final InosUser currentUser;


}

final class ProfileStateChanged extends ProfileState
{
  const ProfileStateChanged();

}
