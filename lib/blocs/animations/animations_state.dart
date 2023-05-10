part of 'animations_bloc.dart';

abstract class AnimationsState extends Equatable {
  const AnimationsState();
  
  @override
  List<Object> get props => [];
}

class AnimationsInitial extends AnimationsState {}
