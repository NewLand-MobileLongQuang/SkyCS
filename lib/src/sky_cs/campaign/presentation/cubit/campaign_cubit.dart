import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_state.dart';

class CampaignCubit extends Cubit<CampaignState> {
  CampaignCubit() : super(CampaignInitial());
}
