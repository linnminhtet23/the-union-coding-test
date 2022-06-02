import 'package:coding_test_project/widgets/messageDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resources/firestore_method.dart';

class ReferralCard extends StatefulWidget {
  final snap;

  const ReferralCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<ReferralCard> createState() => _ReferralCardState();
}

class _ReferralCardState extends State<ReferralCard> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  deletePost(String referrId) async {
    try {
      await FireStoreMethods().deletePost(referrId);
    } catch (err) {
      MessageDialog.show(context, "Delete fail", err.toString(), "Try Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.only(left: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text(
                "Name: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["name"],
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Age: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["age"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Township: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["township"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          FittedBox(
            child: Row(
              children: [
                const Text(
                  "Address: ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.snap["address"].toString(),
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text(
                "Gender: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["gender"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Refer From: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["referFrom"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Refer To: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["referTo"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Date: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["date"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),

                    FittedBox(
                      child: Row(
                                children: [
                                  const Text(
                                    "Sign&Sympton: ",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.snap["sign&sympton"].toString(),
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                    ),
        ]),
      ),
    );
  }
}
