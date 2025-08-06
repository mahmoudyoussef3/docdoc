import 'package:docdoc/features/login/data/models/login_response_body.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseBody data;
  LoginSuccess(this.data);
}

class LoginError<T> extends LoginState {
  final String error;
  LoginError(this.error);
}
