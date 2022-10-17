import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/errors/exceptions.dart';

abstract class UploadCertificationData {
  Future<Unit> uploadFile(String path, String name);
}

class UploadCertificationImp implements UploadCertificationData {
  final Reference reference;

  UploadCertificationImp({required this.reference});
  @override
  Future<Unit> uploadFile(String path, String name) async {
    try {
      final refChild = reference.child("bachelorCertification/$name");
      await refChild.putFile(File(path));
      return Future.value(unit);
    } on Exception {
      throw ErrorException();
    }
  }
}
