import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'animations_event.dart';
part 'animations_state.dart';

class AnimationsBloc extends Bloc<AnimationsEvent, AnimationsState> {
  AnimationsBloc() : super(AnimationsInitial()) {
    on<AnimationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
