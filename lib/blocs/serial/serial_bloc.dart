import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'serial_event.dart';
part 'serial_state.dart';

class SerialBloc extends Bloc<SerialEvent, SerialState> {
  SerialBloc() : super(SerialInitial()) {
    on<SerialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
