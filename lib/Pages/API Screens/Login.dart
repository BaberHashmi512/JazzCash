import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
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
                SizedBox(height: 100,),
                Image.asset("assets/images/Jazz_cash_logo.png",
                  width: 280,),
                SizedBox(height: 100,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number.';
                    }
                    final phoneRegex = RegExp(r'^03[0-9]{9}$');
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Please enter a valid phone number starting with 03 and with a total of 11 digits.';
                    }
                    return null; // Validation passed
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
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
                    if (_formKey.currentState!.validate()) {
                      // Form validation passed, perform login
                      String phoneNumber = ''; // Get the phone number value
                      String password = _passwordController.text;
                      performLogin(phoneNumber, password);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "Already have an Account?    ",
                      style: const TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "Register now",
                        style: const TextStyle(
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

  void performLogin(String phoneNumber, String password) {
    // Add your login logic here
    print('Performing login...');
    print('Phone Number: $phoneNumber');
    print('Password: $password');
  }

  bool isAlphaNumeric(String value) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
  }
}
