import 'package:flutter_bloc/flutter_bloc.dart';

part 'documents_state.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  DocumentsCubit() : super(DocumentsState.initial());
}
