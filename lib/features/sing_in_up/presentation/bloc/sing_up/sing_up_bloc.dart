import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc() : super(SingUpInitial()) {
    on<SingUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
