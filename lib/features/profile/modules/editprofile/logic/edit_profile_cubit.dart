import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/profile/data/dto/user_dto.dart';
import 'package:taj_elsafa/features/profile/data/repository/profile_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit
    extends Cubit<EditProfileState<UpdateUserDto>> {
  final _repo = locator<ProfileRepo>();
  EditProfileCubit() : super(EditProfileState.initial()) {
    init();
  }

  UpdateUserDto get dto => state._dto!;

  void init() =>
      emit(state._loaded(UpdateUserDto(locator<AuthCache>().user!)));

  void save() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _repo.updateProfile(dto);

    result.when(
      success: (user) async {
        await locator<AuthCache>().setUser(user);
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
