part of 'campaign_customer_detail_cubit.dart';

@immutable
sealed class CampaignCustomerDetailState {}

final class CampaignCustomerDetailInitial extends CampaignCustomerDetailState {}

final class CampaignCustomerDetailLoading extends CampaignCustomerDetailState {}

final class CampaignCustomerDetailLoaded extends CampaignCustomerDetailState {}

final class CampaignCustomerDetailError extends CampaignCustomerDetailState {
  final String message;

  CampaignCustomerDetailError(this.message);
}