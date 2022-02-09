part of 'user_bloc.dart';


abstract class UserState extends Equatable{
  final User user;
  const UserState(this.user);
  @override
  List<Object> get props=> [user];
}

class UserInitial extends UserState {
  UserInitial():super(User(name: "Hasan", age: 25));
}

class UserLoaded extends UserState{
  UserLoaded(User user):super(user);
}
