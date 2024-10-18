import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_customer_detail_state.dart';

class CampaignCustomerDetailCubit extends Cubit<CampaignCustomerDetailState> {
  CampaignCustomerDetailCubit() : super(CampaignCustomerDetailInitial());

  Future<void> init() async {
    emit(CampaignCustomerDetailLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(CampaignCustomerDetailLoaded());
  }
}
