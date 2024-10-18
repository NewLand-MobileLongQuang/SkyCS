part of 'campaign_agent_cubit.dart';

@immutable
sealed class CampaignAgentState {}

final class CampaignAgentInitial extends CampaignAgentState {}

final class CampaignAgentLoading extends CampaignAgentState {}

final class CampaignAgentLoaded extends CampaignAgentState {
  CampaignAgentLoaded({required this.listCampaign, required this.listAgent});

  final List<String> listCampaign;
  final List<String> listAgent;
}

final class CampaignAgentError extends CampaignAgentState {
  CampaignAgentError({required this.message});
  final String message;
}
