import 'package:boxicons/boxicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/screens/referral_add_screen.dart';
import 'package:coding_test_project/widgets/AppBar.dart';
import 'package:coding_test_project/widgets/Referralcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PatientReferral extends StatefulWidget {
  const PatientReferral({Key? key}) : super(key: key);

  @override
  State<PatientReferral> createState() => _PatientReferralState();
}

class _PatientReferralState extends State<PatientReferral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(title: "Patient Referral"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('patientReferral')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => ReferralCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: activeColors.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReferralFrom(),
              ),
            );
          },
          child: const Icon(Boxicons.bx_plus)),
    );
  }
}
