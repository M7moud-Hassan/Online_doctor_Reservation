import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/usecases/upload_bac_cer.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/sing_up_person.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  final SingUpP singUpP;
  final UploadCertification uploadCertification;
  SingUpBloc({
    required this.singUpP,
    required this.uploadCertification,
  }) : super(SingUpInitial()) {
    on<SingUpEvent>((event, emit) async {
      if (event is SingUpAsDoctorEvent) {
        emit(SingUpAsDoctorState());
      } else if (event is SignUpAsPersonEvent) {
        emit(SingUpAsPersonState());
      } else if (event is ShowPassUpEvent) {
        emit(ShowPassUpState());
      } else if (event is HidePassUpEvent) {
        emit(HidePassUpState());
      } else if (event is ShowConfirmPassEvent) {
        emit(ShowPassConfirmState());
      } else if (event is HideConfirmPassEvent) {
        emit(HidePassConfirmState());
      } else if (event is ChangeGenderMaleEvent) {
        emit(ChangeGenderMaleState());
      } else if (event is ChangeGenderFemaleEvent) {
        emit(ChangeGenderFemaleState());
      } else if (event is SingUpPersonEvent) {
        emit(StartSingUpState());
        if (event.person.runtimeType.toString() != "Person") {
          Doctor doctor = event.person as Doctor;
          Either<Failure, Unit> result = await uploadCertification(
              doctor.bachelorCertification, doctor.pId);
          result.fold((l) {
            _showMessage(l);
            return;
          }, (r) => null);
        }
        Either<Failure, UserCredential> result = await singUpP(event.person);
        result.fold((l) => emit(ShowMessageError(message: _showMessage(l))),
            (r) => emit(FinishSingUpState(r)));
      } else if (event is LoadCertificationEvent) {
        emit(LoadCertificationState(event.nameFile));
      }
    });
  }

  static SingUpBloc get(context) => BlocProvider.of<SingUpBloc>(context);
  String _showMessage(Failure failure) {
    switch (failure.runtimeType) {
      case EmailIsInvalidFailur:
        return ERROR_EMAIL;
      case EmailIsUseFailur:
        return EMAIL_USED;
      case PasswordWeakFailur:
        return PASSWORD_WEAK;
      case InternetIsNotConnectingFailure:
        return CHECK_INTERNET;
      default:
        return ERROR;
    }
  }
}
