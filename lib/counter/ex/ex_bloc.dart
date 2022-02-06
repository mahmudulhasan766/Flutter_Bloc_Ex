import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ex_event.dart';
part 'ex_state.dart';

class ExBloc extends Bloc<ExEvent, ExState> {
  ExBloc() : super(ExInitial()) {
    on<ExEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
