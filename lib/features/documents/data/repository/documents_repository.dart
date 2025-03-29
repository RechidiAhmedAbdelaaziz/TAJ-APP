
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';

import '../source/documents_api.dart';



@lazySingleton
class DocumentsRepo extends NetworkRepository {
  final _documentsApi = locator<DocumentsApi>();
}
