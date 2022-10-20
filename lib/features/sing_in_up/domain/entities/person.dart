import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Person extends Equatable {
  String fName;
  String lName;
  String pId;
  String email;
  String pass;
  DateTime birthDate;
  String phoneNumber;
  String country;
  String region;
  String city;
  Gender gender;

  Person(
      {required this.fName,
      required this.lName,
      required this.pId,
      required this.email,
      required this.pass,
      required this.birthDate,
      required this.phoneNumber,
      required this.country,
      required this.region,
      required this.city,
      required this.gender});

  @override
  List<Object?> get props => [
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

enum Gender { male, female }
