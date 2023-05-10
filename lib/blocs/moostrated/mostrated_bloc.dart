import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mostrated_event.dart';
part 'mostrated_state.dart';

class MostratedBloc extends Bloc<MostratedEvent, MostratedState> {
  MostratedBloc() : super(MostratedInitial()) {
    on<MostratedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
