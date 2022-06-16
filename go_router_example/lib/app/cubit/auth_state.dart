part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthEmpty extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess({this.token});
  final String? token;

  @override
  List<Object?> get props => [token];
}

class AuthError extends AuthState {
  const AuthError({this.exception});
  final Exception? exception;

  @override
  List<Object?> get props => [exception];
}
