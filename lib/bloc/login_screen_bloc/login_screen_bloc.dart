
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<SignInTextChangedEvent>((event, emit) {
      if(event.emailValue== ""&&EmailValidator.validate(event.emailValue)){
        emit (SignInErrorState("Please enter a valid email address"));
      }else if(event.passwordValue.length<8){
        emit(SignInErrorState("Please enter a valid password"));
      }else{
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
