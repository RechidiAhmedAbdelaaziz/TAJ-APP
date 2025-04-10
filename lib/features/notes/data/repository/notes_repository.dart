
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/notes_api.dart';



@lazySingleton
class NotesRepo extends NetworkRepository {
  final _notesApi = locator<NotesApi>();
}
