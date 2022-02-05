import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (state is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (state is DecrementEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }
}