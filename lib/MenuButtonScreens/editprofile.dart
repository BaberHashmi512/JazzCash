import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jazzcash/Pages/BottomNavigation.dart';
import 'package:jazzcash/Pages/FirstScreen.dart';

import '../Pages/helpers/ApiUrls.dart';
import '../Pages/helpers/MySharedPrefClass.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? token = MySharedPrefClass.preferences!.getString('token');

  ImageProvider? _selectedImage;
  TextEditingController _fnamecontroller = TextEditingController();
  TextEditingController _lnamecontroller = TextEditingController();
  TextEditingController dateinput = TextEditingController();

   File? _profileImage;

  String _gender = "";
  String imgPath = "";

  @override
  void initState() {
    super.initState();
    fetchData(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text("Edit Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: _selectedImage ??
                      (imgPath.isNotEmpty
                          ? NetworkImage(imgPath)
                          : const AssetImage('assets/images/avatar.png')
                              as ImageProvider),
                  // backgroundImage: _selectedImage ?? NetworkImage(imgPath),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white70,
                          child: GestureDetector(
                              onTap: getImage,
                              child: const Icon(CupertinoIcons.camera)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _fnamecontroller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Edit First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _lnamecontroller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Edit Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: dateinput,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.calendar_today,
                            color: Colors.black),
                        labelText: "Enter Date of Birth"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      } else {
                        print("Date is not Selected");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "  Gender",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xffA87B5D),
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                        value: "male",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: "female",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: "other",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Other",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      try {
                        updateProfile(
                            token, _fnamecontroller.text, _lnamecontroller.text,
                            dateinput.text, _gender, _profileImage);
                      }
                      catch(e) {
                        print(e.toString());
                      }
                    },
                    child: const Text("Update"))
              ],
            ),
          ),
        ));
  }

  Future<void> getImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an Image"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text("Gallery"),
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
        _profileImage = File(pickedImage.path);
        _selectedImage = FileImage(File(pickedImage.path));
      });
    }
  }

  void fetchData(mToken) async {
    try {
      if (mToken == null || mToken == "") {
        // Token not found, handle accordingly
        print('Token not found');
        return;
      }

      http.Response response = await http.get(Uri.parse(Apis.profileApi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $mToken',
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Process the retrieved data as needed
        setState(() {
          imgPath = Apis.baseUrl + data['image'] ?? "";
          _fnamecontroller.text = data['fname'];
          _lnamecontroller.text = data['lname'];
          dateinput.text = data['dob'];
        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  void updateProfile(mToken, firstName, lastName, dateOfBirth, gender, image) async {
    try {

      var uri = Uri.parse(Apis.updateProfileApi);
      var request = http.MultipartRequest('put', uri);

      request.headers['Authorization'] = 'Token $mToken'; // Add token to headers

      request.fields['fname'] = firstName;
      request.fields['lname'] = lastName;
      request.fields['dob'] = dateOfBirth;
      request.fields['gender'] = gender;

      if (_profileImage != null) {
        // Image is selected from the gallery
        request.files.add(await http.MultipartFile.fromPath('image', image.path));
      }

      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

      print("response = ${responsed.statusCode}");
      print("body = ${responsed.body}");

      if (responsed.statusCode == 201 || responsed.statusCode == 200) {
        var data = jsonDecode(responsed.body.toString());
        print(data['message']);
        Fluttertoast.showToast(
            msg: data['message'],
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);

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
