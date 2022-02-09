import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bolc_ex/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  @override 
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is ChangeNameEvent){
      yield UserLoaded(User(name: event.name,age: state.user.age));
    }else if(event is BirthdayEvent){
      yield UserLoaded(User(name: state.user.name,age: state.user.age+1));
    }
  }
}
