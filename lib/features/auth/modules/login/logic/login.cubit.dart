import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/auth/data/dto/login.dto.dart';
import 'package:taj_elsafa/features/auth/data/repository/auth_repository.dart';
import 'package:taj_elsafa/features/auth/logic/auth.cubit.dart';

part 'login.state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _authRepo = locator<AuthRepo>();

  LoginCubit() : super(LoginState.initial());

  void login() async {
    if (state.isLoading || !state.loginDTO.validate()) return;

    emit(state._loading());

    final result = await _authRepo.login(state.loginDTO);

    result.when(
      success: (response) async{
     await   locator<AuthCubit>().authenticate(
          response.apiToken,
          response.user,
        );
        emit(state._success());
      },
      error: (error) {
        emit(state._error(error.message));
      },
    );
  }

  @override
  Future<void> close() {
    state.loginDTO.dispose();
    return super.close();
  }
}
