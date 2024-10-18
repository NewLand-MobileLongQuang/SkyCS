import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forward_state.dart';

class ForwardCubit extends Cubit<ForwardState> {
  ForwardCubit() : super(ForwardInitial());
}
