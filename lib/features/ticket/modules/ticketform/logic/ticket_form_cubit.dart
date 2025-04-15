import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/ticket/data/dto/ticket_dto.dart';
import 'package:taj_elsafa/features/ticket/data/models/ticket_model.dart';
import 'package:taj_elsafa/features/ticket/data/repository/ticket_repository.dart';

part 'ticket_form_state.dart';

abstract class TicketFormCubit<T extends TicketDto>
    extends Cubit<TicketFormState<T>> {
  final _repo = locator<TicketRepo>();

  TicketFormCubit() : super(TicketFormState.initial());

  bool get isLoading => state._status == _TicketFormStatus.loading;
  bool get isLoaded => state._dto != null;
  T get dto => state._dto!;

  void init();

  void submit();
}

class CreateTicketCubit extends TicketFormCubit<CreateTicketDto> {
  @override
  void init() => emit(state._loaded(CreateTicketDto()));

  @override
  void submit() async {
    emit(state._loading());

    await Future.delayed(const Duration(seconds: 2));

    emit(state._success(TicketModel()));
  }
}
