import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_agent_state.dart';

class CampaignAgentCubit extends Cubit<CampaignAgentState> {
  CampaignAgentCubit() : super(CampaignAgentInitial());

  final List<String> listCampaign = <String>['Chiến dịch 1', 'Chiến dịch 2', 'Chiến dịch 3', 'Chiến dịch 4'];
  final List<String> listAgent = <String>['Agent 1', 'Agent 2', 'Agent 3', 'Agent 4'];

  Future<void> init() async {
    emit(CampaignAgentLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(CampaignAgentLoaded(listCampaign: listCampaign, listAgent: listAgent));
  }
}
