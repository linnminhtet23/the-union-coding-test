import 'package:boxicons/boxicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_test_project/screens/he_add_screen.dart';
import 'package:coding_test_project/widgets/AppBar.dart';
import 'package:coding_test_project/widgets/HeAttendeescard.dart';
import 'package:flutter/material.dart';

import '../constants/activeconstant.dart';

class HEActivity extends StatefulWidget {
  const HEActivity({Key? key}) : super(key: key);

  @override
  State<HEActivity> createState() => _HEActivityState();
}

class _HEActivityState extends State<HEActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(title: "HE Attendees"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('heAttendees')
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
            itemBuilder: (context, index) => HeCard(
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
                builder: (context) => const HEForm(),
              ),
            );
          },
          child: const Icon(Boxicons.bx_plus)),
    );
  }
}
