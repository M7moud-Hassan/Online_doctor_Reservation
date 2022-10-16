import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

class ModelPerson extends Person {
  const ModelPerson(
      {required super.fName,
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
  factory ModelPerson.fromJson(Map<String, dynamic> json) {
    return ModelPerson(
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
      "fName": fName,
      "lName": lName,
      "PId": pId,
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
