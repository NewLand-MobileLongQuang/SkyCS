part of 'campaign_manage_cubit.dart';

@immutable
sealed class CampaignManageState {}

final class CampaignManageInitial extends CampaignManageState {}

final class CampaignManageLoading extends CampaignManageState {}

final class CampaignManageLoaded extends CampaignManageState {
  CampaignManageLoaded({required this.checkPress});

  final List<bool> checkPress;
}

final class CampaignManageError extends CampaignManageState {

  CampaignManageError({required this.message});
  final String message;
}