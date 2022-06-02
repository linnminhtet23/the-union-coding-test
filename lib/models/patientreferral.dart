import 'package:cloud_firestore/cloud_firestore.dart';

class PatientReferralModel {
  final String name;
  // final String uid;
  final String gender;
  final int age;
  final String date;
  final String referralId;
  final String township;
  final String address;
  final String referFrom;
  final String referTo;
  final String sign;

  const PatientReferralModel({
    required this.name,
    // required this.uid,
    required this.gender,
    required this.age,
    required this.date,
    required this.referralId,
    required this.township,
    required this.address,
    required this.referFrom,
    required this.referTo,
    required this.sign
  });

  static PatientReferralModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PatientReferralModel(
        name: snapshot["name"],
        // uid: snapshot["uid"],
        gender: snapshot["gender"],
        age: snapshot["age"],
        date: snapshot["date"],
        referralId: snapshot["referralId"],
        township: snapshot["township"],
        address: snapshot['address'],
        referFrom: snapshot['referFrom'],
        referTo: snapshot['referTo'],
        sign: snapshot['sign&sympton']
        );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "age": age,
        "date": date,
        "township": township,
        'address': address,
        'referFrom': referFrom,
        'referTo': referTo,
        'sign&sympton':sign
      };
}
