// ignore_for_file: library_private_types_in_public_api

part of 'edit_profile_cubit.dart';

enum _EditProfileStatus { initial, loading, loaded, success, error }

class EditProfileState<T> extends CubitErrorState {
  final T? _dto;
  final _EditProfileStatus _status;

  EditProfileState({
    T? dto,
    _EditProfileStatus? status,
    String? error,
  }) : _dto = dto,
       _status = status ?? _EditProfileStatus.initial,
       super(error);

  factory EditProfileState.initial() => EditProfileState();

  bool get isLoading =>
      _status == _EditProfileStatus.loading ||
      _status == _EditProfileStatus.initial;

  EditProfileState<T> _copyWith({
    T? dto,
    _EditProfileStatus? status,
    String? error,
  }) {
    return EditProfileState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  EditProfileState<T> _loading() =>
      _copyWith(status: _EditProfileStatus.loading);

  EditProfileState<T> _loaded(T dto) =>
      _copyWith(status: _EditProfileStatus.loaded, dto: dto);

  EditProfileState<T> _success() =>
      _copyWith(status: _EditProfileStatus.success);

  EditProfileState<T> _error(String error) =>
      _copyWith(status: _EditProfileStatus.error, error: error);

  void onSuccess(VoidCallback callback) {
    if (_status == _EditProfileStatus.success) {
      callback();
    }
  }
}
