part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class SignInTextChangedEvent extends LoginScreenEvent{
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue,this.passwordValue);
}

class SignInSubmittedEvent extends LoginScreenEvent{
  final String email;
  final String password;
  SignInSubmittedEvent(this.email,this.password);
}