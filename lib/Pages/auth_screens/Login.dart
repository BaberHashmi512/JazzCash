import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jazzcash/Pages/auth_screens/Signup.dart';
import 'package:http/http.dart';
import 'package:jazzcash/Pages/BottomNavigation.dart';
import 'package:jazzcash/Pages/helpers/ApiUrls.dart';
import 'package:jazzcash/Pages/helpers/MySharedPrefClass.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var maskFormatter = MaskTextInputFormatter(
    filter: {"#": RegExp(r'\d')},
    mask: "03#########",
    type: MaskAutoCompletionType.eager,
  );
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("Login to JazzCash"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/images/Jazz_cash_logo.png",
                  width: 280,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    hintText: "03001234567",
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number.';
                    }
                    RegExp regex = RegExp(
                        r'^03\d{2}(?!1234567)(?!1111111)(?!7654321)\d{7}$');
                    String input = '0323456789';

                    if (regex.hasMatch(input)) {
                      print('Valid input');
                    } else {
                      print('Invalid input');
                    }
                    return null; // Validation passed
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: !isVisible,
                  // obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: isVisible
                          ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                          : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.vpn_key),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    if (value.length < 5) {
                      return 'Password must be at least 5 characters long.';
                    }
                    if (!isAlphaNumeric(value)) {
                      return 'Password must be alphanumeric.';
                    }
                    return null; // Validation passed
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // login(_phoneNumberController.text.toString(), _passwordController.text.toString());
                    if (_formKey.currentState!.validate()) {
                      String phoneNumber = _phoneNumberController.text;
                      String password = _passwordController.text;
                      login(phoneNumber, password);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Text(
                      "Already have an Account? ",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => const SignupPage()));
                      },
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  // void performLogin(String phoneNumber, String password) {
  //   // Add your login logic here
  //   print('Performing login...');
  //   print('Phone Number: $phoneNumber');
  //   print('Password: $password');
  // }

  bool isAlphaNumeric(String value) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
  }

  void login(String phoneNumber, password) async {
    try {
      Response response = await post(
          Uri.parse(Apis.loginApi),
          body: {'phone_number': phoneNumber, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['wallet']);
        print(data['token']);
        print('Login successfully');
        MySharedPrefClass.preferences!.setString('token', data['token']);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder:
                    (context) =>
                const BottomNavigation()),
                (route) => false);
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context)=>const BottomNavigation())
        // );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
