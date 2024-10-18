import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_perform_detail_state.dart';

class CampaignPerformDetailCubit extends Cubit<CampaignPerformDetailState> {
  CampaignPerformDetailCubit() : super(CampaignPerformDetailInitial());

  Future<void> init() async {
    emit(CampaignPerformDetailLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(CampaignPerformDetailLoaded());
  }
}
