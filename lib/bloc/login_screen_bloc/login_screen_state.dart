part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class SignInInvalidState extends LoginScreenState{
}
class SignInValidState extends LoginScreenState{
}
class SignInErrorState extends LoginScreenState{
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}
class SignInLoadingState extends LoginScreenState{}