import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_test_project/models/he.dart';
import 'package:uuid/uuid.dart';

import '../models/patientreferral.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String name,
      // String uid,
      String gender,
      int age,
      String dateTime,
      String townShip,
      String address,
      String referFrom,
      String referTo,
      String sign
      ) async {
    String res = "Some error occurred";
    try {
      String referralID = const Uuid().v1();
      PatientReferralModel referral = PatientReferralModel(
        name: name,
        // uid: uid,
        gender: gender,
        age: age,
        date: dateTime,
        referralId: referralID,
        township: townShip,
        address: address,
        referFrom: referFrom,
        referTo: referTo,
        sign: sign
      );
      _firestore
          .collection('patientReferral')
          .doc(referralID)
          .set(referral.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadHE(
      String date,
      // String uid,
      String address,
      String volunteer,
      int male,
      int female) async {
    String res = "Some error occurred";
    try {
      String heID = const Uuid().v1();
      HEModel he = HEModel(
          date: date,
          address: address,
          heId: heID,
          volunteer: volunteer,
          male: male,
          female: female);
      _firestore.collection('heAttendees').doc(heID).set(he.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deletePost(String referralId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('patientReferral').doc(referralId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
