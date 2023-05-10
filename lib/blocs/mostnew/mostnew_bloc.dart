import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mostnew_event.dart';
part 'mostnew_state.dart';

class MostnewBloc extends Bloc<MostnewEvent, MostnewState> {
  MostnewBloc() : super(MostnewInitial()) {
    on<MostnewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
