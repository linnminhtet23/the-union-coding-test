import 'package:boxicons/boxicons.dart';
import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/resources/auth_methods.dart';
import 'package:coding_test_project/screens/he_activity.dart';
import 'package:coding_test_project/screens/login.dart';
import 'package:coding_test_project/screens/patient_referral.dart';
import 'package:coding_test_project/widgets/AppBar.dart';
import 'package:coding_test_project/widgets/alertDialog.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: activeColors.primary,
        title: const Text(
          "Home",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        actions: [
          IconButton(
            onPressed: () {
               AuthMethods().signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
              
            },
            icon: const Icon(Boxicons.bx_log_out),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientReferral(),
                  ),
                );
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: activeColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Boxicons.bx_list_check,
                        color: Colors.white,
                        size: 90,
                      ),
                      Text(
                        "Patient Referral",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HEActivity(),
                  ),
                );
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: activeColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Boxicons.bx_plus_medical,
                        color: Colors.white,
                        size: 90,
                      ),
                      Text(
                        "HE Activity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
