import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/notes/data/dto/note_dto.dart';
import 'package:taj_elsafa/features/notes/data/models/note_model.dart';
import 'package:taj_elsafa/features/notes/data/repository/notes_repository.dart';

part 'note_form_state.dart';

abstract class NoteFormCubit<T extends NoteDto>
    extends Cubit<NoteFormState<T>> {
  final _repo = locator<NotesRepo>();

  NoteFormCubit() : super(NoteFormState.initial());

  T get dto => state._dto!;

  bool get isLoaded => state._dto != null;
  bool get isLoading => state._status == _NoteFormStatus.loading;

  void init();

  void save();
}

class CreateNoteCubit extends NoteFormCubit<CreateNoteDto> {
  @override
  void init() => emit(state._loaded(CreateNoteDto()));

  @override
  void save() async {
    emit(state._lodging());

    emit(
      state._success(NoteModel(id: '1')),
    ); //TODO implement the save method
  }
}
