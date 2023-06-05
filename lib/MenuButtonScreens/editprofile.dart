import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ImageProvider? _selectedImage;
  final TextEditingController _fnamecontroller = TextEditingController();
  final TextEditingController _lnamecontroller = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  int? _value = 1;



  @override
  void initState() {
    super.initState();
    _fnamecontroller.text = 'Baber';
    _lnamecontroller.text = 'Hashmi';
    dateinput.text = "22/04/2000";
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
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: _selectedImage,
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
                    prefixIcon: Icon(Icons.person),
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
                    prefixIcon: Icon(Icons.person),
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
                    style: TextStyle(color: Colors.green),
                    controller: dateinput,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: const TextStyle(color: Colors.green),
                        prefixIcon:
                            const Icon(Icons.calendar_today, color: Colors.green),
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
                        value: 1,
                        groupValue: _value,
                        onChanged: (Value) {
                          setState(() {
                            _value = Value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (Value) {
                          setState(() {
                            _value = Value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: 3,
                        groupValue: _value,
                        onChanged: (Value) {
                          setState(() {
                            _value = Value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text(
                      "Others",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Edit profile"))
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
