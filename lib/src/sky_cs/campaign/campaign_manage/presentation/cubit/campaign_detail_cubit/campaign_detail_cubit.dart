import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_detail_state.dart';

class CampaignDetailCubit extends Cubit<CampaignDetailState> {
  CampaignDetailCubit() : super(CampaignDetailInitial());
}
