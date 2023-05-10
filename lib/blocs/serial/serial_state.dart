part of 'serial_bloc.dart';

abstract class SerialState extends Equatable {
  const SerialState();
  
  @override
  List<Object> get props => [];
}

class SerialInitial extends SerialState {}
