import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/handingover/data/models/handing_over_module.dart';
import 'package:taj_elsafa/features/handingover/data/repository/handing_over_repository.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';

part 'handing_over_state.dart';

class HandingOverCubit extends Cubit<HandingOverState> {
  final _repo = locator<HandingOverRepo>();
  HandingOverCubit() : super(HandingOverState.initial());

  bool get isLoading => state._status == _HandingOverStatus.loading;
  bool get isLoaded => state._result != null;

  HandingOverModel get handingOver => state._result!;

  void getProjectCondition(RealStateModel state_) async {
    emit(state._loading());

    final result = await _repo.getProjectCondition();
    
    result.when(
      success: (data) => emit(state._loaded(data)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
