
part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;
   CounterState(this.value);

  @override
  List<Object> get props => [];
}
class CounterInitState extends CounterState{
  CounterInitState():super(0);
}

class CounterResultState extends CounterState{
  CounterResultState(int value) : super(value);
}