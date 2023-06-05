import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jazzcash/MenuButtonScreens/edit_password.dart';
import 'package:jazzcash/MenuButtonScreens/editprofile.dart';
import 'package:jazzcash/Pages/BottomNavigation.dart';

import 'helpers/ApiUrls.dart';
import 'helpers/MySharedPrefClass.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? token = MySharedPrefClass.preferences!.getString('token');
  @override
  void initState() {
    fetchData(token);
    super.initState();

  }

  ImageProvider? _selectedImage;
  String imgPath = "";
  String name = "Baber Ali Hashmi";
  String number = "03186487044";
  String mail = "";
  int idnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                cardColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white)),
            child: PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.edit,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditProfile()));
                                      },
                                      child: const Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.password_outlined,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditPassword()));
                                      },
                                      child: const Text(
                                        "Edit Password",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                height: 0.5,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text("Logout"),
                                                  content: const Text(
                                                    "Are you Sure You want to Logout",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .greenAccent),
                                                      ),
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const BottomNavigation()),
                                                              (route) => false);
                                                        },
                                                        child: const Text(
                                                          "LogOut",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red),
                                                        ))
                                                  ],
                                                ));
                                      },
                                      child: const Text(
                                        "Log out",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("My Account"),
      ),
      body: Column(
        children: [
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Profile Details",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: _selectedImage,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white70,
                          child: GestureDetector(
                              onTap: getImage,
                              child: const Icon(CupertinoIcons.camera)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Column(
                children: [
                  Text(
                    name,
                    // "Baber Ali Hashmi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "Account:",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        number,
                        // "03001234567",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
           Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      mail,
                      // "Baberhashmi512@gmail.com",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "ID Card Number",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      idnumber.toString(),
                      // "3630270470271",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.password_outlined,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "*************",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0.5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          // const Row(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 10),
          //       child: Icon(
          //         Icons.person,
          //         color: Colors.yellow,
          //         size: 30,
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20),
          //       child: Column(
          //         children: [
          //           Text(
          //             "Gender",
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //           Text(
          //             "Male",
          //             style: TextStyle(color: Colors.white),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Divider(
          //   height: 0.5,
          //   color: Colors.white,
          // )
          // StringInterpolation
        ],
      ),
    );
  }
  void fetchData(mToken) async {
    try {
      if (mToken == null || mToken == "") {
        // Token not found, handle accordingly
        print('Token not found');
        return;
      }

      Response response = await get(
          Uri.parse(Apis.profileApi),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token $mToken',
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Process the retrieved data as needed
        print(data);
        print(data['fname']);
        setState(() {
          imgPath = Apis.baseUrl + data['image'] ?? "";
          name = data['fname'];
          number = data['phone_number'];
          mail = data['email'];
          idnumber = data['cnic'];

        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> getImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose an Image"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = FileImage(File(pickedImage.path));
      });
    }
  }
}
