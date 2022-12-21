import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';


part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  InternetBloc() : super(InternetInitial()) {

    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });
    on<InternetGainedEvent>((event, emit){
      emit(InternetGainedState());
    });

    _connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.mobile||event==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }else{
        add(InternetLostEvent());
      }
    });

  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
