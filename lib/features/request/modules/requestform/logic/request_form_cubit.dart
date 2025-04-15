import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/request/data/dto/request_dto.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';
import 'package:taj_elsafa/features/request/data/repository/request_repository.dart';

part 'request_form_state.dart';

abstract class RequestFormCubit<T extends RequestDto>
    extends Cubit<RequestFormState<T>> {
  final _repo = locator<RequestRepo>();

  RequestFormCubit() : super(RequestFormState.initial());

  bool get isLoading => state._status == _RequestFormStatus.loading;
  bool get isLoaded => state._dto != null;
  T get dto => state._dto!;

  void init();

  void submit();
}

class CreateRequestCubit extends RequestFormCubit<CreateRequestDto> {
  @override
  void init() => emit(state._loaded(CreateRequestDto()));

  @override
  void submit() async {
    emit(state._loading());

    await Future.delayed(const Duration(seconds: 2));

    emit(state._success(RequestModel()));
  }
}
