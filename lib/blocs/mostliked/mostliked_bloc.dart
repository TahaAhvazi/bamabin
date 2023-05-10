import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mostliked_event.dart';
part 'mostliked_state.dart';

class MostlikedBloc extends Bloc<MostlikedEvent, MostlikedState> {
  MostlikedBloc() : super(MostlikedInitial()) {
    on<MostlikedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
