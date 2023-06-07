import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  String imgPath = "";
  String firstname = "Baber Ali ";
  String lastname = "Hashmi";
  String number = "03186487044";
  String mail = "baberhashmi512@gmail.com";
  int idnumber = 36302451202897;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                cardColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white)),
            child: PopupMenuButton(
                elevation: 0,
                shape: Border.all(width: 0.5),
                offset: const Offset(0, kToolbarHeight),
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) =>
                [
                  PopupMenuItem(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                    "Change Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // const Divider(
                          //   height: 0.2,
                          //   color: Colors.grey,
                          // ),
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
                                              title: const Text("Logout"),
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
                                                      Navigator
                                                          .pushAndRemoveUntil(
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
            height: 0.2,
            color: Colors.grey,
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // // const Center(
          // //   child: Text(
          // //     "Profile Details",
          // //     style: TextStyle(
          // //         color: Colors.white,
          // //         fontWeight: FontWeight.bold,
          // //         fontSize: 24),
          // //   ),
          // // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Divider(
          //   height: 0.5,
          //   color: Colors.white,
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 32,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: token != null &&
                            imgPath != null &&
                            imgPath.isNotEmpty
                            ? NetworkImage(imgPath)
                            : const AssetImage('assets/images/avatar.png')
                        as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$firstname $lastname",
                    // "Baber Ali Hashmi",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Account: ",
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                      Text(
                        number,
                        // "03001234567",
                        style: const TextStyle(color: Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0.2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.grey,
                          // fontWeight:FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      mail,
                      // "Baberhashmi512@gmail.com",
                      style: const TextStyle(color: Colors.white,fontSize: 20),
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
            height: 0.2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ID Card Number",
                      style: TextStyle(color: Colors.grey,
                          // fontWeight:FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      idnumber.toString(),
                      // "3630270470271",
                      style: const TextStyle(color: Colors.white,fontSize: 20),
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
            height: 0.2,
            color: Colors.grey,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.grey,
                          // fontWeight:FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "**********",
                      style: TextStyle(color: Colors.white,fontSize: 20),
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
            height: 0.2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
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

      Response response = await get(Uri.parse(Apis.profileApi), headers: {
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
          firstname = data['fname'];
          lastname = data['lname'];
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
}


