// ignore_for_file: library_private_types_in_public_api

part of 'note_form_cubit.dart';

enum _NoteFormStatus { initial, loading, loaded, sucess, error }

class NoteFormState<T> extends CubitErrorState {
  final T? _dto;
  final _NoteFormStatus _status;

  NoteFormState({
    T? dto,
    required _NoteFormStatus status,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  factory NoteFormState.initial() =>
      NoteFormState<T>(status: _NoteFormStatus.initial);


  NoteFormState<T> _copyWith({
    T? dto,
    _NoteFormStatus? status,
    String? error,
  }) {
    return NoteFormState<T>(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  NoteFormState<T> _lodging() =>
      _copyWith(status: _NoteFormStatus.loading);

  NoteFormState<T> _loaded(T dto) =>
      _copyWith(status: _NoteFormStatus.loaded, dto: dto);

  NoteFormState<T> _success(NoteModel note) => _Success(note, this);

  NoteFormState<T> _error(String error) =>
      _copyWith(status: _NoteFormStatus.error, error: error);

  void onSave(void Function(NoteModel note) onSuccess) {}
}

class _Success<T> extends NoteFormState<T> {
  final NoteModel note;

  _Success(this.note, NoteFormState<T> state)
    : super(dto: state._dto, status: _NoteFormStatus.sucess);

  @override
  void onSave(void Function(NoteModel note) onSuccess) =>
      onSuccess(note);
}
