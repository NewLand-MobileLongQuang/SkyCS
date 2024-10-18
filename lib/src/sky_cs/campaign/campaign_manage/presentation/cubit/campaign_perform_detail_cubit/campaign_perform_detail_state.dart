part of 'campaign_perform_detail_cubit.dart';

@immutable
sealed class CampaignPerformDetailState {}

final class CampaignPerformDetailInitial extends CampaignPerformDetailState {}

final class CampaignPerformDetailLoading extends CampaignPerformDetailState {}

final class CampaignPerformDetailLoaded extends CampaignPerformDetailState {}

final class CampaignPerformDetailError extends CampaignPerformDetailState {
  final String message;

  CampaignPerformDetailError(this.message);
}