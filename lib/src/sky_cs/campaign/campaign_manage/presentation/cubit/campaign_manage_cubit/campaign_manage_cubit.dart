import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_manage_state.dart';

class CampaignManageCubit extends Cubit<CampaignManageState> {
  CampaignManageCubit() : super(CampaignManageInitial());

  List<bool> checkPress = [false, false, false, false, false, false, false, false, false, false];

  Future<void> init() async {
    emit(CampaignManageLoading());
    try {
      emit(CampaignManageLoaded(checkPress: checkPress));
    } catch (e) {
      emit(CampaignManageError(message: e.toString()));
    }
  }

  Future<void> chooseCampaign(int index) async {
    checkPress[index] = !checkPress[index];
    emit(CampaignManageLoaded(checkPress: checkPress));
  }
}
