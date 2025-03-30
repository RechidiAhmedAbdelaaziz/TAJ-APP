import 'package:flutter_bloc/flutter_bloc.dart';

part 'real_states_state.dart';

class RealStatesCubit extends Cubit<RealStatesState> {
  RealStatesCubit() : super(RealStatesState.initial());
}
