import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/core/network/network.dart';
import 'package:online_doctor_reservation/features/profile/data/models/model_profile.dart';

abstract class ProfileRemoteData {
  Future<ModelProfileInfo> loadInfo(String email, String collection);
}

class ProfileRemoteDataImp implements ProfileRemoteData {
  final FirebaseFirestore firebaseFirestore;

  ProfileRemoteDataImp({required this.firebaseFirestore});
  @override
  Future<ModelProfileInfo> loadInfo(String email, String collection) async {
    if (await InternetChecking.checkNet()) {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await firebaseFirestore
                .collection(collection)
                .where("email", isEqualTo: email)
                .get();
        return ModelProfileInfo.fromJson(querySnapshot.docs.first.data());
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw InternetIsNotConnectingException();
    }
  }
}
