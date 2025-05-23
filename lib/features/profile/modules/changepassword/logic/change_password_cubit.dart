import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/profile/data/dto/update_password_dto.dart';
import 'package:taj_elsafa/features/profile/data/dto/user_dto.dart';
import 'package:taj_elsafa/features/profile/data/repository/profile_repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final  dto = UpdatePasswordDto();
  final _repo = locator<ProfileRepo>();

  ChangePasswordCubit() : super(ChangePasswordState.initial());

  void changePassword() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _repo.changePassword(dto);

    result.when(
      success: (response) {
        emit(state._success());
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  Future<void> close() {
    dto.dispose();
    return super.close();
  }
}
