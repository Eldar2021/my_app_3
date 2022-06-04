import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router_example/core/cache/hive.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.token)
      : super(
          token.read == null ? AuthInitial() : AuthSingin(),
        );

  final TokenService token;

  Future<void> signin() async {
    emit(AuthLoading());
    await Future<void>.delayed(const Duration(seconds: 2));
    await token.save('token');
    emit(AuthSingin());
  }

  Future<void> signout() async {
    emit(AuthLoading());
    await Future<void>.delayed(const Duration(seconds: 2));
    await token.clear(userUidBox);
    emit(AuthInitial());
  }
}
