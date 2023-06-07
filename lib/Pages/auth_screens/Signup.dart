import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jazzcash/Pages/auth_screens/Login.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helpers/ApiUrls.dart';
import '../helpers/MySharedPrefClass.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  ImageProvider? _selectedImage;
  bool showSpinner = false;
  late File _profileImage;

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
        _selectedImage = FileImage(_profileImage);
      });
    }
  }

  var maskFormatter = MaskTextInputFormatter(
      // filter: { "#": RegExp(r'[0-9]') },
      mask: "03#########",
      type: MaskAutoCompletionType.lazy);
  bool isVisible = false;
  String? _gender = "male";
  final _formKey = GlobalKey<FormState>();
  final _phoneRegex = RegExp(r'^03[0-9]{9}$');
  final _cnicRegex = RegExp(r'^[0-9]{13}$');
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // var phoneNumber="";
  // var password = "";
  // var firstName = "";
  // var lastname = "";
  // var Email = "";
  // var dateofBirth="";
  // var cnicnumber = "";
  // var Gender ="";
  // // var image ="";

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }
  // print(response);
  // print(response.stream.toString());
  // print(response.statusCode);

  Future<void> uploadImage(phoneNumber, password, firstName, lastName, email,
      dateOfBirth, cnicNumber, gender, image) async {
    setState(() {
      showSpinner = true;
    });
    // var stream = http.ByteStream(image.openRead());
    // stream.cast();

    var length = await image.length();
    var uri = Uri.parse(Apis.signUpApi);
    var request = http.MultipartRequest('POST', uri);
    request.fields['phone_number'] = phoneNumber;
    request.fields['password'] = password;
    request.fields['fname'] = firstName;
    request.fields['lname'] = lastName;
    request.fields['email'] = email;
    request.fields['dob'] = dateOfBirth;
    request.fields['gender'] = gender;
    request.fields['cnic'] = cnicNumber;
    request.fields['role'] = "user";

    request.files.add(await http.MultipartFile.fromPath(
        'image', image));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    try{
      if(responsed.statusCode == 200){
        final responsedData = json.decode(responsed.body);
        MySharedPrefClass.preferences
            ?.setString("Username", responsedData["data"]["detail"]);
        print("Data $responsedData");
        print("Register Successfully");
        Fluttertoast.showToast(
            msg: "Register Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=>Login()),
                (route) => false);
        // Navigator.pushNamed(context, Login().routeName);
      }else{
        print("Failed");
        Fluttertoast.showToast(
            msg: responsed.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text('Signup to JazzCash'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _selectedImage ??
                        const AssetImage('assets/images/avatar.png'),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white70,
                            child: GestureDetector(
                              onTap: getImage,
                              child: const Icon(CupertinoIcons.camera),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
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
                        prefixIcon: const Icon(Icons.person),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    inputFormatters: [
                      maskFormatter,
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.numbers),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'Phone Number',
                      hintText: 'e.g. 03#########',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!_phoneRegex.hasMatch(value)) {
                        return 'Please enter a valid phone number starting with 03';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _cnicController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.numbers_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'CNIC Number',
                      hintText: 'e.g. 3630270470273',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your CNIC number';
                      }
                      if (!_cnicRegex.hasMatch(value)) {
                        return 'Please enter a valid CNIC number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !isVisible,
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
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: TextField(
                      style: const TextStyle(color: Colors.green),
                      controller: dateinput,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          labelStyle: const TextStyle(color: Colors.green),
                          prefixIcon: const Icon(Icons.calendar_today,
                              color: Colors.green),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        uploadImage(
                            _phoneController.text,
                            _passwordController.text,
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            dateinput.text,
                            _cnicController.text,
                            _gender,
                            _profileImage);
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      'Signup',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
