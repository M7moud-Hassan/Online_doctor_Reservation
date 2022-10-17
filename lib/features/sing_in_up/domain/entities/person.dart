import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String fName;
  final String lName;
  final String pId;
  final String email;
  final String pass;
  final DateTime birthDate;
  final String phoneNumber;
  final String country;
  final String region;
  final String city;
  final Gender gender;

  const Person(
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
