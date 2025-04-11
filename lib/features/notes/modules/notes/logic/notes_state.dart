part of 'notes_cubit.dart';

enum _NotesStatus { initial, loading, loaded, error }

class NotesState extends CubitErrorState {
  final PaginationResult<NoteModel>? _result;
  final _NotesStatus _status;

  NotesState({
    PaginationResult<NoteModel>? result,
    _NotesStatus status = _NotesStatus.initial,
    String? error,
  }) : _status = status,
       _result = result,
       super(error);

  factory NotesState.initial() => NotesState();

  NotesState _copyWith({
    PaginationResult<NoteModel>? result,
    _NotesStatus? status,
    String? error,
  }) {
    return NotesState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }

  NotesState _loading() => _copyWith(status: _NotesStatus.loading);

  NotesState _loaded(PaginationResult<NoteModel> result) => _copyWith(
    result: _result?.addAll(result) ?? result,
    status: _NotesStatus.loaded,
  );

  NotesState _error(String error) =>
      _copyWith(status: _NotesStatus.error, error: error);
}
