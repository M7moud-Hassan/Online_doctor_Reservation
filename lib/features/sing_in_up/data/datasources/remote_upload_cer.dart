import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:online_doctor_reservation/core/network/network.dart';

import '../../../../core/errors/exceptions.dart';

abstract class UploadCertificationData {
  Future<Unit> uploadFile(String path, String name);
}

class UploadCertificationDataImp implements UploadCertificationData {
  final Reference reference;

  UploadCertificationDataImp({required this.reference});
  @override
  Future<Unit> uploadFile(String path, String name) async {
    if (await InternetChecking.checkNet()) {
      try {
        final refChild = reference.child("bachelorCertification/$name");
        await refChild.putFile(File(path));
        return Future.value(unit);
      } on Exception {
        throw ErrorException();
      }
    } else {
      throw InternetIsNotConnectingException();
    }
  }
}
