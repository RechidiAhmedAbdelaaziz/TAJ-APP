part of 'auth.cubit.dart';

class AuthState extends CubitErrorState {
  final UserModel? user;

  AuthState({String? error, this.user}) : super(error);

  factory AuthState.initial() => AuthState();

  AuthState _authenticated() => _copyWith(user: user);
  AuthState _unauthenticated() => AuthState.initial();


  AuthState _copyWith({String? error, UserModel? user}) =>
      AuthState(error: error, user: user);
}
