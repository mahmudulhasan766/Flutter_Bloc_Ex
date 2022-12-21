part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
