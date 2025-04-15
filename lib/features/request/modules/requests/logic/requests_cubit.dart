import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/request/data/dto/requests_filter.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';
import 'package:taj_elsafa/features/request/data/repository/request_repository.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  final _repo = locator<RequestRepo>();
  final _filter = RequestsFilterDTO();

  RequestsCubit() : super(RequestsState.initial());

  List<RequestModel> get requests => state._result?.data ?? [];
  List<RealStateModel> get states =>
      requests.map((request) => request.realState!).toList();

  RequestsFilterDTO get filter => _filter;



  void getFilteredRequests() {
    emit(RequestsState.initial());
    getRequests();
  }

  void getRequests() async {
    emit(state._loading());
    final result = await _repo.getRequests(_filter);
    result.when(
      success: (result) {
        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }
}
