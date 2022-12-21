import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
part 'internet_bloc_state.dart';

class InternetBlocCubit extends Cubit<InternetBlocState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBlocCubit() : super(InternetBlocInitial()){
    _connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.mobile||event==ConnectivityResult.wifi){
        emit(InternetGanState());
      }else{
        emit(InternetLossState());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
