part of 'mostrated_bloc.dart';

abstract class MostratedState extends Equatable {
  const MostratedState();
  
  @override
  List<Object> get props => [];
}

class MostratedInitial extends MostratedState {}
