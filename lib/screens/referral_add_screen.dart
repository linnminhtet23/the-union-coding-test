import 'package:boxicons/boxicons.dart';
import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/resources/firestore_method.dart';
import 'package:coding_test_project/widgets/AppBar.dart';
import 'package:coding_test_project/widgets/messageDialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReferralFrom extends StatefulWidget {
  const ReferralFrom({Key? key}) : super(key: key);

  @override
  State<ReferralFrom> createState() => _ReferralFromState();
}

class _ReferralFromState extends State<ReferralFrom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  String _selectedGender = '';
  String _selectedTownShip = '';
  String _selectedReferFrom = '';
  String _selectedReferTo = '';

  String _selectdSign = "Fever";

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
        String res = await FireStoreMethods().uploadPost(
          _nameController.text,
          // uid,
          _selectedGender,
          int.parse(_ageController.text),
          _dateController.text,
          _selectedTownShip,
          _addressController.text,
          _selectedReferFrom,
          _selectedReferTo,
          _selectdSign,
        );
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
        title: "Referral Form",
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
                      "Name",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Name",
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Name field is Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Gender",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: const ["Male", "Female"],
                      dropdownSearchDecoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      // popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (val) {
                        setState(() {
                          _selectedGender = val!;
                        });
                      },
                      // selectedItem: "Male",
                      // validator: (val) {
                      //   if (val!.isEmpty) {
                      //     return "Gender field is required";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Gender",
                    //       style: activeTextStyles.labelText,
                    //     ),
                    //     Radio<String>(
                    //         activeColor: activeColors.primary,
                    //         value: 'male',
                    //         groupValue: _selectedGender,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _selectedGender = value!;
                    //             // print(_selectedGender);
                    //           });
                    //         }),
                    //     const Text(
                    //       "Male",
                    //       style: TextStyle(color: Colors.grey),
                    //     ),
                    //     Radio<String>(
                    //         activeColor: activeColors.primary,
                    //         value: 'female',
                    //         groupValue: _selectedGender,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _selectedGender = value!;
                    //             // print(_selectedGender);
                    //           });
                    //         }),
                    //     const Text(
                    //       "Female",
                    //       style: TextStyle(color: Colors.grey),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Age",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Age",
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Age is Required";
                        }
                        if (val.length > 120) {
                          return "Enter valid Age";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Refer Date",
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
                          return "Refer Date is Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Township",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: const [
                        "AMP",
                        "AMT",
                        "CAT",
                        "CMT",
                        "PTG",
                        "PGT",
                        "MHA"
                      ],
                      dropdownSearchDecoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      // popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (val) {
                        setState(() {
                          _selectedTownShip = val!;
                        });
                      },
                      // selectedItem: "AMP",
                      // validator: (val) {
                      //   if (val!.isEmpty) {
                      //     return "Township field is required";
                      //   }
                      //   return null;
                      // },
                    ),
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
                      "Refer From",
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
                          _selectedReferFrom = val!;
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
                      "Refer To",
                      style: activeTextStyles.labelText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: const ["Union", "THD", "Other"],
                      dropdownSearchDecoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      // popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (val) {
                        setState(() {
                          _selectedReferTo = val!;
                        });
                      },
                      // selectedItem: "Union",
                      // validator: (val) {
                      //   if (val!.isEmpty) {
                      //     return "Refer to field is required";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Sign & Sympton",
                      style: activeTextStyles.labelText,
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                              activeColor: activeColors.primary,
                              value: 'Fever',
                              groupValue: _selectdSign,
                              onChanged: (value) {
                                setState(() {
                                  _selectdSign = value!;
                                  print(_selectdSign);
                                });
                              }),
                          const Text(
                            "Fever",
                            style: TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Radio<String>(
                              activeColor: activeColors.primary,
                              value: 'Weight Loss',
                              groupValue: _selectdSign,
                              onChanged: (value) {
                                setState(() {
                                  _selectdSign = value!;
                                  print(_selectdSign);
                                });
                              }),
                          const Text(
                            "Weight Loss",
                            style: TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Radio<String>(
                              activeColor: activeColors.primary,
                              value: 'Cough more than two weeks',
                              groupValue: _selectdSign,
                              onChanged: (value) {
                                setState(() {
                                  _selectdSign = value!;
                                  print(_selectdSign);
                                });
                              }),
                          const Text(
                            "Cough more than two weeks",
                            style: TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
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
                        onPressed: ()=>onSubmit(),
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
