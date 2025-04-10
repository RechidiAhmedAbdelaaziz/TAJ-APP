import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/realstates/data/repository/real_states_repository.dart';

part 'real_states_state.dart';

class RealStatesCubit extends Cubit<RealStatesState> {
  final _repo = locator<RealStatesRepo>();

  final EditingController<RealStateModel> selectedStateController =
      EditingController();

  RealStatesCubit() : super(RealStatesState.initial());

  List<RealStateModel> get states => state._result.data;
  RealStateModel? get selectedRealState => selectedStateController.value;

  void getRealStates() async {
    emit(state._loading());

    final result = await _repo.getRealStates();

    result.when(
      success: (response) {
        emit(state._loaded(response));
        if (response.data.isNotEmpty) {
          selectedStateController.initValue(response.data.first);
        }
      },
      error: (error) => emit(state._error(error.message)),
    );
  }
}
