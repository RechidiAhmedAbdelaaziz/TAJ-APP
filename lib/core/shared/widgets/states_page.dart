import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/logic/real_states_cubit.dart';
import 'package:taj_elsafa/features/realstates/module/realstates/ui/real_states_screen.dart';

class StatesPage extends StatelessWidget {
  final String title;

  final Widget Function(BuildContext context, RealStateModel state)
  builder;

  final Widget? floatingActionButton;
  final Widget Function(BuildContext context)? bottomNavigationBar;

  const StatesPage({
    super.key,
    required this.title,
    required this.builder,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        context.read<RealStatesCubit>().selectedStateController;

    return Scaffold(
      body: Column(
        children: [
          _AppBar(title),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: controller,

              builder: (context, state, _) {
                return state == null
                    ? Center(
                      child: Text(
                        "There is no state selected",
                        style: AppTextStyles.large,
                      ),
                    )
                    : SingleChildScrollView(
                      child: builder(context, state),
                    );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar:
          bottomNavigationBar != null
              ? bottomNavigationBar!(context)
              : null,
    );
  }
}

class _AppBar extends StatelessWidget {
  final String title;

  const _AppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          AppBar(title: Text(title), leading: AppBackButton()),

          StatesHeader(),
        ],
      ),
    );
  }
}
