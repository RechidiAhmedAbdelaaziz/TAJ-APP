import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
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

    await Future.delayed(const Duration(seconds: 2));

    locator<AuthCubit>().authenticate(
      AuthTokens(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
      ),
    );
    return emit(
      state._success(),
    ); //TODO remove after api is implemented

    // final result = await _authRepo.login(state.loginDTO);

    // result.when(
    //   success: (tokens) {
    //     locator<AuthCubit>().authenticate(tokens);
    //     emit(state._success());
    //   },
    //   error: (error) => emit(state._error(error.message)),
    // );
  }

  @override
  Future<void> close() {
    state.loginDTO.dispose();
    return super.close();
  }
}
