import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/widgets/pdf_view.dart';
import 'package:taj_elsafa/core/shared/widgets/states_page.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';

part 'widgets/files.dart';
part 'widgets/images.dart';
part 'widgets/info.dart';
part 'widgets/states_header.dart';

class RealStatesScreen extends StatelessWidget {
  const RealStatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatesPage(
      title: "Real State Info",
      builder:
          (context, state) => Column(
            children: [
              heightSpace(25),

              _Info(state),
              heightSpace(45),

              _Files(state),
              heightSpace(45),

              _Images(state.imagesUrls),
              heightSpace(25),
            ],
          ),
    );
  }
}
