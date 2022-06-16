import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthEmpty());

  Future<void> signin() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthSuccess(token: 'test-token'));
  }

  Future<void> signout() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthEmpty());
  }
}
