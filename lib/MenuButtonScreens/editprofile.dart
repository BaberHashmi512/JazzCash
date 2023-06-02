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
  ImageProvider? _selectedImage=Image.asset("assets/images/Baber.photho.jpg") as ImageProvider<Object>?;

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
  bool isVisible = false;
  int? _value = 1;
  final _formKey = GlobalKey<FormState>();
  final _phoneRegex = RegExp(r'^03[0-9]{9}$');
  final _cnicRegex = RegExp(r'^[0-9]{13}$');
  TextEditingController dateinput = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String email = _emailController.text;
      String phone = _phoneController.text;
      String cnic = _cnicController.text;
      String password = _passwordController.text;

      _formKey.currentState!.reset();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
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
                              child: Icon(CupertinoIcons.camera)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter your Firstname",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter your LastName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: TextField(
                    style: TextStyle(color: Colors.green),
                    controller: dateinput,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: TextStyle(color: Colors.green),
                        icon: Icon(Icons.calendar_today),
                        iconColor: Colors.green,
                        labelText: "Enter Date of Birth"
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040)
                      );
                      if (pickedDate !=null){
                        print(pickedDate);
                        String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate);
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
