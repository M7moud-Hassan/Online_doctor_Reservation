import 'package:online_doctor_reservation/features/profile/domain/entities/profile.dart';

class ModelProfileInfo extends ProfileInfo {
  ModelProfileInfo(
      {required super.userName,
      required super.pathPhoto,
      required super.pathImageBg,
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

  factory ModelProfileInfo.fromJson(Map<String, dynamic> json) {
    return ModelProfileInfo(
        userName: json["userName"],
        pathPhoto: json["pathPhoto"],
        pathImageBg: json["pathImageBg"],
        syndicalismNumber: json["syndicalismNumber"],
        countryC: json["countryC"],
        regionC: json["regionC"],
        cityC: json["cityC"],
        flatNumber: json["flatNumber"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        bachelorCertification: json["bachelorCertification"],
        fName: json["fName"],
        lName: json["lName"],
        pId: json["pId"],
        email: json["email"],
        pass: json["pass"],
        birthDate: json["birthDate"],
        phoneNumber: json["phoneNumber"],
        country: json["country"],
        region: json["region"],
        city: json["city"],
        gender: json["gender"]);
  }
}
