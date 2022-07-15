part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInRequest extends AuthEvent {
  final String email;
  final String password;

  SignInRequest(this.email, this.password);
}

class SignUpRequest extends AuthEvent {
  final String email;
  final String password;

  SignUpRequest(this.email, this.password);
}

class SignOutRequest extends AuthEvent {}
