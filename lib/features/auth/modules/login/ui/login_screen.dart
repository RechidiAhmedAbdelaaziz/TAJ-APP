import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/widgets/auth_screen.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/features/auth/configs/auth_navigator.dart';
import 'package:taj_elsafa/features/auth/modules/login/logic/login.cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        // state.onSuccess(() => context.offAll(HomeNavigator())); //TODO go to home
      },
      child: AuthScreen(
        title: 'Login'.tr(context),
        form: const _Form(),
        submitButton: AppButton.primary(
          text: 'Login'.tr(context),
          onPressed: context.read<LoginCubit>().login,
          isLoading:
              (ctx) => ctx.select(
                (LoginCubit cubit) => cubit.state.isLoading,
              ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<LoginCubit>().state.loginDTO;
    return Form(
      key: dto.formKey,
      child: Column(
        children: [
          AppInputField(
            controller: dto.emailController,
            hintText: 'Email'.tr(context),
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            validator: (value) => dto.validateEmail(value, context),
          ),
          heightSpace(15),
          AppInputField.password(
            controller: dto.passwordController,
            hintText: 'Password'.tr(context),
            validator:
                (value) => dto.validatePassword(value, context),
          ),
          // heightSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppButton.hyperLink(
                text: 'ForgotPassword'.tr(context),
                onPressed:
                    () => context.to(AuthNavigator.forgotPassword()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
