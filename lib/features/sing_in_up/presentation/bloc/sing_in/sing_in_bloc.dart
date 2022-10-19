import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/network/network.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/usecases/sing_in_person_doctor.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/sing_strings.dart';
import '../../../domain/usecases/verification_email.dart';

part 'sing_in_event.dart';
part 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInPD singInPD;
  VerificationEmail verificationEmail;
  SingInBloc({required this.singInPD, required this.verificationEmail})
      : super(SingInInitial()) {
    on<SingInEvent>((event, emit) async {
      if (event is CheckNetwortEvent) {
        emit(CheckNetworkState(isConnected: await InternetChecking.checkNet()));
      } else if (event is ShowPasswordEvent) {
        emit(ShowPasswordState());
      } else if (event is HidePasswordEvent) {
        emit(HidePasswordState());
      } else if (event is StartSingInEvent) {
        emit(StartSingInState());
        Either<Failure, SingInData> result =
            await singInPD(event.email, event.password);
        result.fold((l) => sendErrorMessage(l, emit),
            (r) => {emit(SingInByEmailAndPassState(singInData: r))});
      } else if (event is VerificationEmailEvent) {
        emit(StartVerificationEmailState());
        Either<Failure, Unit> result =
            await verificationEmail(event.userCredential);
        result.fold((l) => sendErrorMessage(l, emit),
            (r) => emit(EndVerificationEmailState()));
      }
    });
  }
  static SingInBloc get(context) => BlocProvider.of<SingInBloc>(context);

  void sendErrorMessage(failure, emit) {
    if (failure is InternetIsNotConnectingFailure) {
      emit(const MessageFailureState(message: CHECK_INTERNET));
    } else if (failure is WrongPasswordFailure) {
      emit(const MessageFailureState(message: WRONG_PASS));
    } else if (failure is UserNotFoundFailure) {
      emit(const MessageFailureState(message: USER_NOT_FOUND));
    } else if (failure is TooManyRequestsFailure) {
      emit(const MessageFailureState(message: TOO_MANY_RQT));
    } else {
      emit(const MessageFailureState(message: ERROR));
    }
  }
}
