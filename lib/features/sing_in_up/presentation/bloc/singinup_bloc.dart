import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'singinup_event.dart';
part 'singinup_state.dart';

class SinginupBloc extends Bloc<SinginupEvent, SinginupState> {
  SinginupBloc() : super(SinginupInitial()) {
    on<SinginupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
