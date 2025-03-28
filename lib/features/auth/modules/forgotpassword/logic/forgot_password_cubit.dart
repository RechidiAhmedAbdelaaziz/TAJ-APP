import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/auth/data/dto/reset_password_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/features/auth/data/repository/auth_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo _authRepo;

  ForgotPasswordCubit()
    : _authRepo = locator(),
      super(ForgotPasswordState.initial());

  ForgotPasswordDto get dto => state._dto;

  void submit() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    await Future.delayed(const Duration(seconds: 2));

    return emit(
      state._success(),
    ); //TODO remove after api is implemented

    // final result = await _authRepo.forgotPassword(state._dto);

    // result.when(
    //   success: (_) => emit(state._success()),
    //   error: (error) => emit(state._error(error.message)),
    // );
  }

  @override
  Future<void> close() {
    dto.dispose();
    return super.close();
  }
}
