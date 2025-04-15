import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/notes/data/models/note_model.dart';
import 'package:taj_elsafa/features/notes/data/repository/notes_repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final _repo = locator<NotesRepo>();
  final String requestId;

  NotesCubit(this.requestId) : super(NotesState.initial());

  bool get isLoading => state._status == _NotesStatus.loading;
  bool get isLoaded => state._result != null;

  List<NoteModel> get notes => state._result?.data ?? [];

  void getNotes() async {
    emit(state._loading());

    final result = await _repo.getNotes();

    result.when(
      success: (result) => emit(state._loaded(result)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
