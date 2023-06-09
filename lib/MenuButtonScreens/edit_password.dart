import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Pages/BottomNavigation.dart';
import '../Pages/helpers/ApiUrls.dart';
import '../Pages/helpers/MySharedPrefClass.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool isVisible = false;
  bool isHide = false;
  bool isDisappear = false;
  String? token = MySharedPrefClass.preferences!.getString('token');
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Edit Password"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "assets/images/Jazz_cash_logo.png",
                  width: 280,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                obscureText: !isVisible,
                controller: _oldPasswordController,
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
                  prefixIcon: const Icon(Icons.password_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Old Password',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _newPasswordController,
                obscureText: !isHide,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                    icon: isHide
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                  ),
                  prefixIcon: const Icon(Icons.password_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'New Password',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _confirmNewPasswordController,
                obscureText: !isDisappear,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isDisappear = !isDisappear;
                      });
                    },
                    icon: isDisappear
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                  ),
                  prefixIcon: const Icon(Icons.password_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    changePassword(
                        token,
                        _oldPasswordController.text,
                        _newPasswordController.text,
                        _confirmNewPasswordController.text);
                  },
                  child: const Text(
                    "Change password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void changePassword(mToken, oldPassword, password, password2) async {
    try {
      var uri = Uri.parse(Apis.changePasswordApi);
      http.Response response = await http.put(uri, headers: {
        'Authorization': 'Token $mToken',
      }, body: {
        'old_password': oldPassword,
        'password': password,
        'password2': password2,
      });

      print("respone= ${response.body} ${response.statusCode}");

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        Fluttertoast.showToast(
            msg: data['message'],
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
            (route) => false);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
