import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notes/data/models/note_model.dart';

import '../logic/notes_cubit.dart';
import 'notes_details.dart';

part 'widget/notes.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (NotesCubit cubit) => cubit.isLoading && !cubit.isLoaded,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attached Notes"),
        leading: AppBackButton(),
      ),

      body: ConditionalBuilder(
        condition: isLoading,
        builder: (_) => AppLoadignIndicator(),
        fallback: (_) => _Notes(),
      ),
    );
  }
}
