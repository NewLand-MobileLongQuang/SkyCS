import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_perform_state.dart';

class CampaignPerformCubit extends Cubit<CampaignPerformState> {
  CampaignPerformCubit() : super(CampaignPerformInitial());

  final List<String> listCampaign = ['Campaign 1', 'Campaign 2', 'Campaign 3'];
  final List<String> listStatus = ['Status 1', 'Status 2', 'Status 3'];

  Future<void> init() async {
    emit(CampaignPerformLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(CampaignPerformLoaded(
        listCampaign: listCampaign,
        listStatus: listStatus,
      ));
    } catch (e) {
      emit(CampaignPerformError(message: e.toString()));
    }
  }
}
