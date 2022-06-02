import 'package:boxicons/boxicons.dart';
import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/resources/firestore_method.dart';
import 'package:coding_test_project/widgets/AppBar.dart';
import 'package:coding_test_project/widgets/messageDialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HEForm extends StatefulWidget {
  const HEForm({Key? key}) : super(key: key);

  @override
  State<HEForm> createState() => _HEFormState();
}

class _HEFormState extends State<HEForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _maleController = TextEditingController();
  final TextEditingController _femaleController = TextEditingController();

  String _selectedVol = '';

  bool actionLoading = false;

  void openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        actionLoading = true;
      });
      try {
        String res = await FireStoreMethods().uploadHE(
            _dateController.text,
            _addressController.text,
            _selectedVol,
            int.parse(_maleController.text),
            int.parse(_femaleController.text));
        if (res == "success") {
          setState(() {
            actionLoading = false;
          });
          Navigator.pop(context);
        } else {
          MessageDialog.show(
              context, "Upload Failed", "Please Try Again", "Try Again");
        }
      } catch (error) {
        setState(() {
          actionLoading = false;
        });
        MessageDialog.show(
            context, "Upload Error", error.toString(), "Try Again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(
        title: "HE Form",
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 30, bottom: 30, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: IconButton(
                              onPressed: openDatePicker,
                              icon: Icon(
                                Boxicons.bx_calendar,
                                color: activeColors.primary,
                              ))),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Date is Required";
                        }
                        return null;
                      },
                    ),

                    // selectedItem: "AMP",
                    // validator: (val) {
                    //   if (val!.isEmpty) {
                    //     return "Township field is required";
                    //   }
                    //   return null;
                    // },

                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Address",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 40,
                      maxLines: 3,
                      controller: _addressController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Address",
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Address is Required";
                        }
                        if (val.length < 40) {
                          return "Enter valid address";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Volunteer",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: const ["Vol1", "Vol2"],
                      dropdownSearchDecoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      // popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (val) {
                        setState(() {
                          _selectedVol = val!;
                        });
                      },
                      // selectedItem: "Vol1",
                      // validator: (val) {
                      //   if (val!.isEmpty) {
                      //     return "Refer from field is required";
                      //   }
                      //   return null;
                      // },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Text(
                      "Male",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _maleController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Male",
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This Field is Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Female",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _femaleController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Female",
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "This Field is Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: activeColors.primary,
                            onPrimary: Colors.white,
                            maximumSize: const Size(147, 60),
                            minimumSize: const Size(147, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () => onSubmit(),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            // fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
