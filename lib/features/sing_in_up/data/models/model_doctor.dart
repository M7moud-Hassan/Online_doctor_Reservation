import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';

class ModelDoctor extends Doctor {
  const ModelDoctor(
      {required super.syndicalismNumber,
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

  factory ModelDoctor.fromJson(Map<String, dynamic> json) {
    return ModelDoctor(
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

  Map<String, dynamic> toJson() {
    return {
      "syndicalismNumber": syndicalismNumber,
      "countryC": countryC,
      "regionC": regionC,
      "cityC": cityC,
      "flatNumber": flatNumber,
      "startTime": startTime,
      "endTime": endTime,
      "bachelorCertification": bachelorCertification,
      "fName": fName,
      "lName": lName,
      "pId": pId,
      "email": email,
      "pass": pass,
      "birthDate": birthDate,
      "phoneNumber": phoneNumber,
      "country": country,
      "region": region,
      "city": city,
      "gender": gender
    };
  }
}
