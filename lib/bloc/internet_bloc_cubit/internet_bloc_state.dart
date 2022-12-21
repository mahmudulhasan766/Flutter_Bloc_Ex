part of 'internet_bloc_cubit.dart';

@immutable
abstract class InternetBlocState {}

class InternetBlocInitial extends InternetBlocState {}

class InternetGanState extends InternetBlocState{}
class InternetLossState extends InternetBlocState{}

