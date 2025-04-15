import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/ticket/data/dto/tickets_filter.dart';
import 'package:taj_elsafa/features/ticket/data/models/ticket_model.dart';
import 'package:taj_elsafa/features/ticket/data/repository/ticket_repository.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final _repo = locator<TicketRepo>();
  final _filter = TicketsFilterDTO();

  TicketsCubit() : super(TicketsState.initial());

  List<TicketModel> get tickets => state._result?.data ?? [];
  List<RealStateModel> get states =>
      tickets.map((ticket) => ticket.realState!).toList();

  TicketsFilterDTO get filter => _filter;

  void getFilteredTickets() {
    emit(TicketsState.initial());
    getTickets();
  }

  void getTickets() async {
    emit(state._loading());
    final result = await _repo.getTickets(_filter);
    result.when(
      success: (result) {
        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }
}
