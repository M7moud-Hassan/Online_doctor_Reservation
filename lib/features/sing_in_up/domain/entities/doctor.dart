import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

class Doctor extends Person {
  final String syndicalismNumber;
  final String countryC;
  final String regionC;
  final String cityC;
  final String flatNumber;
  final DateTime startTime;
  final DateTime endTime;
  final String bachelorCertification;
  const Doctor(
      {required this.syndicalismNumber,
      required this.countryC,
      required this.regionC,
      required this.cityC,
      required this.flatNumber,
      required this.startTime,
      required this.endTime,
      required this.bachelorCertification,
      required super.fName,
      required super.lName,
      required super.pId,
      required super.email,
      required super.pass,
      required super.birthDate,
      required super.phoneNumber,
      required super.country,
      required super.region,
      required super.city,
      required super.gender});

  @override
  // TODO: implement props
  List<Object?> get props => [
        syndicalismNumber,
        countryC,
        regionC,
        cityC,
        flatNumber,
        startTime,
        endTime,
        bachelorCertification,
        fName,
        lName,
        pId,
        email,
        pass,
        birthDate,
        phoneNumber,
        country,
        region,
        city,
        gender
      ];
}
