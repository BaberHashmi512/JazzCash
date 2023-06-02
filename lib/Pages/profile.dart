import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jazzcash/MenuButtonScreens/edit_password.dart';
import 'package:jazzcash/MenuButtonScreens/editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImageProvider? _selectedImage;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Container(
                        // height: 300,
                        // width: 150,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Menu Options",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>EditProfile())
                                      );
                                    },
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.password_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditPassword()));
                                    },
                                    child: Text(
                                      "Edit Password",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 0.5,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ])
          // TextButton(
          //     onPressed: () {},
          //     child: Text(
          //       "EDIT",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.grey,
          //           fontSize: 22),
          //     ))
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("My Account"),
      ),
      body: Column(
        children: [
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Profile Details",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
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
                          radius: 10,
                          backgroundColor: Colors.white70,
                          child: GestureDetector(
                              onTap: getImage,
                              child: Icon(CupertinoIcons.camera)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Baber Ali Hashmi",
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
                        "03001234567",
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
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
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
                      "Baberhashmi512@gmail.com",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Spacer(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 50),
              //   child: Text(
              //     "Edit",
              //     style: TextStyle(
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
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
                      "3630270470271",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Spacer(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 50),
              //   child: Text(
              //     "Edit",
              //     style: TextStyle(
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
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
                      "somepassword",
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
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.person,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Male",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Spacer(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 50),
              //   child: Text(
              //     "Edit",
              //     style: TextStyle(
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
