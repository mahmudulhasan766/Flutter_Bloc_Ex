part of 'user_bloc.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object> get props=>[];
}

class ChangeNameEvent extends UserEvent{
  final String name;
  const ChangeNameEvent(this.name);
}
class BirthdayEvent extends UserEvent{}
