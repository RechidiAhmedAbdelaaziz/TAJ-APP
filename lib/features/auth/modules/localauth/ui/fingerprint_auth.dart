import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';
import 'package:taj_elsafa/features/auth/modules/localauth/logic/local_auth_cubit.dart';
import 'package:taj_elsafa/features/home/config/home_navigator.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class FingerprintAuthWidget extends StatelessWidget {
  const FingerprintAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocalAuthCubit(),
      child: BlocListener<LocalAuthCubit, LocalAuthState>(
        listener: (context, state) {
          state.onError(context.showErrorDialog);
          state.onSuccess(() {
            // context.showSuccessSnackbar("")
            context.to(HomeNavigator());
          });
        },
        child: Builder(
          builder: (context) {
            return InkWell(
              onTap:
                  () => context.read<LocalAuthCubit>().authenticate(),
              child: SvgPicture.asset(
                Assets.icons.fingerprint,
                width: 55.r,
                height: 55.r,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
