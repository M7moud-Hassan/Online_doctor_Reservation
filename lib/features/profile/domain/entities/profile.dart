import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';

class ProfileInfo extends Doctor {
  final String userName;
  final String pathPhoto;
  final String pathImageBg;

  ProfileInfo(
      {required this.userName,
      required this.pathPhoto,
      required this.pathImageBg,
      required super.syndicalismNumber,
      required super.countryC,
      required super.regionC,
      required super.cityC,
      required super.flatNumber,
      required super.startTime,
      required super.endTime,
      required super.bachelorCertification,
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
}
