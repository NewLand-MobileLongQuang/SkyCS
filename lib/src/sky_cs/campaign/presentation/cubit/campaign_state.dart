part of 'campaign_cubit.dart';

@immutable
sealed class CampaignState {}

final class CampaignInitial extends CampaignState {}

final class CampaignLoading extends CampaignState {}

final class CampaignLoaded extends CampaignState {}

final class CampaignError extends CampaignState {
  CampaignError(this.message);

  final String message;
}
