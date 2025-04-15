import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/notes/data/models/note_model.dart';

import '../source/notes_api.dart';
import '../source/notes_cache.dart';

@lazySingleton
class NotesRepo extends NetworkRepository {
  final _notesApi = locator<NotesApi>();
  final _notesCache = locator<NotesCache>();

  RepoListResult<NoteModel> getNotes() {
    return tryApiCall(
      apiCall: () => throw UnimplementedError(),
      localApiCall: () => _notesCache.getNotes(),
      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: NoteModel.fromJson,
          ),
    );
  }
}
