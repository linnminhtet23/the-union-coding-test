import 'package:coding_test_project/widgets/messageDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resources/firestore_method.dart';

class HeCard extends StatefulWidget {
  final snap;

  const HeCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<HeCard> createState() => _HeCardState();
}

class _HeCardState extends State<HeCard> {
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
                  widget.snap["address"],
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
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
          Row(
            children: [
              const Text(
                "Female: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["female"].toString(),
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
                  "Male: ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.snap["male"].toString(),
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
                "Volunteer: ",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.snap["volunteer"].toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
