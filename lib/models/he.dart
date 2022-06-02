import 'package:cloud_firestore/cloud_firestore.dart';

class HEModel {
  final String date;
  // final String uid;
  final String address;
  final String heId;
  final String volunteer;
  final int male;
  final int female;

  const HEModel(
      {required this.date,
      // required this.uid,
      required this.address,
      required this.heId,
      required this.volunteer,
      required this.male,
      required this.female
      });

  static HEModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return HEModel(
        date: snapshot["date"],
        address: snapshot['address'],
        heId: snapshot["heId"],
        volunteer: snapshot["volunteer"],
        male: snapshot["male"],
                female: snapshot["female"]

        );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "address": address,
        "heId": heId,
        "volunteer": volunteer,
        "male":male,
        "female":female
      };
}
