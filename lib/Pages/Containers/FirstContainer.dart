import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:jazzcash/Pages/auth_screens/Login.dart';
import 'package:jazzcash/Pages/helpers/ApiUrls.dart';
import 'package:jazzcash/Pages/profile.dart';
import '../helpers/MySharedPrefClass.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  String? token = MySharedPrefClass.preferences!.getString('token');

  @override
  void initState() {
    fetchData(token);
    super.initState();
  }

  @override
  void dispose() {
    const FirstContainer();
    super.dispose();
  }

  final double number = 84.59;
  String imgPath = "";
  String firstname = "Baber Ali ";
  String lastname = "Hashmi";
  int money = 0;
  String qrPath="";

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#.##", "en_US");
    final formattedNumber = formatter.format(number);
    final parts = formattedNumber.split(".");
    final wholeNumber = parts[0];
    final decimalPart = parts[1];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 25,
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
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                    width: 5,
                  ),
                  Text(
                    "$firstname $lastname",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(left: 170)),
              GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => ImageDialog(qrPath: qrPath,));
                  print(Apis.baseUrl + qrPath);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.qr_code_scanner_rounded,
                        color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          token != null
              ? Container(
                  child: Row(
                    children: [
                      const Text(
                        "  Rs. ",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        money.toString(),
                        style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Row(
                    children: [
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const Login()));
                          },
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                            fontSize: 28),
                                      )),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  " to Transfer Money",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Add Money")),
                    ),
                  ),
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
                        },
                        icon: const Icon(Icons.add_card),
                        label: const Text("My Account")),
                  ),
                )
              ],
            ),
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
          money = data['wallet'];
          qrPath = data['qrcode'];

          print("money : $money, wallet: $data['wallet]");
        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
class ImageDialog extends StatelessWidget {
  var qrPath;

  ImageDialog({super.key,required this.qrPath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
              image: DecorationImage(
                alignment: Alignment.center,
                  image: NetworkImage(Apis.baseUrl + qrPath),
              )
          ),
        ),
      ),
    );
  }
}
