import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/pdf_view.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';

part 'widgets/files.dart';
part 'widgets/images.dart';
part 'widgets/info.dart';
part 'widgets/states_dropdown.dart';

class RealStatesScreen extends StatefulWidget {
  const RealStatesScreen({super.key});

  @override
  State<RealStatesScreen> createState() => _RealStatesScreenState();
}

class _RealStatesScreenState extends State<RealStatesScreen> {
  @override
  Widget build(BuildContext context) {
    final realState =
        context.watch<RealStatesCubit>().selectedRealState;
    return Scaffold(
      appBar: AppBar(
        title: Text("Real State Info"),
        centerTitle: true,
      ),
      body:
          realState == null
              ? const Center(child: Text("There is no real state"))
              : SingleChildScrollView(
                child: Column(
                  children: [
                    _StatesDropdown(
                      realState,
                      onChanged: (value) {
                        if (value == null) return;
                        context
                            .read<RealStatesCubit>()
                            .selectRealState(value);
                      },
                    ),
                    heightSpace(25),

                    _Info(realState),
                    heightSpace(45),

                    _Files(realState),
                    heightSpace(45),

                    _Images(realState.imagesUrls),
                    heightSpace(25),
                  ],
                ),
              ),
    );
  }
}
