import 'package:boxicons/boxicons.dart';
import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/screens/home.dart';
import 'package:coding_test_project/widgets/messageDialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/auth_methods.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _visibility = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _visiblePassword() {
    setState(() {
      _visibility = !_visibility;
      // print(_visibility);
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool actionLoading = false;

 

  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        actionLoading = true;
      });
      String res = await AuthMethods().loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (res == 'success') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyHomePage()));

        setState(() {
          actionLoading = false;
        });
      } else {
        setState(() {
          actionLoading = false;
        });
        MessageDialog.show(
            context, "Login Failed", "Invalid Credentials", "Try Again");
      }
    }
  }

   @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Lottie.asset("assets/animations/login.json"),
          Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            // width: double.infinity,
            // height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login In",
                    style: activeTextStyles.authHeader,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: const Icon(Boxicons.bx_user),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Email is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _visibility,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () => _visiblePassword(),
                        icon: _visibility
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Password is required";
                      }
                      if (val.length < 8) {
                        return 'Password must be between 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
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
                      onPressed:loginUser,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          // fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
