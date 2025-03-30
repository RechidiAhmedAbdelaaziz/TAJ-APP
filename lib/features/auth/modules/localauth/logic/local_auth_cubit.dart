import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/auth/logic/auth.cubit.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  final _auth = locator<LocalAuthentication>();

  LocalAuthCubit() : super(LocalAuthState.initial());

  Future<bool> get canAuthenticate async =>
      await _auth.canCheckBiometrics ||
      await _auth.isDeviceSupported();

  Future<bool> get isFaceIdAvailable async {
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    return await canAuthenticate &&
        availableBiometrics.contains(BiometricType.face);
  }

  void authenticate() async {
    emit(state._loading());

    if (!await canAuthenticate) {
      emit(
        state._error(
          'Device does not support biometric authentication',
        ),
      );
      return;
    }

    try {
      final isAuthenticated = await _auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          // biometricOnly: true,
        ),
      );
      if (isAuthenticated) {
        locator<AuthCubit>().authenticate();
        emit(state._success());
      } else {
        emit(state._error('Authentication failed'));
      }
    } catch (e) {
      emit(state._error(e.toString()));
    }
  }
}
