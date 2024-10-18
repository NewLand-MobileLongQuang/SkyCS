part of 'campaign_perform_cubit.dart';

@immutable
sealed class CampaignPerformState {}

final class CampaignPerformInitial extends CampaignPerformState {}

final class CampaignPerformLoading extends CampaignPerformState {}

final class CampaignPerformLoaded extends CampaignPerformState {
  CampaignPerformLoaded({
    required this.listCampaign,
    required this.listStatus,
  });

  final List<String> listCampaign;
  final List<String> listStatus;
}

final class CampaignPerformError extends CampaignPerformState {
  CampaignPerformError({
    required this.message,
  });

  final String message;
}