import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jazzcash/Pages/helpers/MySharedPrefClass.dart';

import '../helpers/ApiUrls.dart';

class MoneyTransfer extends StatefulWidget {
  final String scannedMessage;

  const MoneyTransfer({Key? key, required this.scannedMessage}) : super(key: key);

  @override
  _MoneyTransferState createState() => _MoneyTransferState(scannedMessage);
}

class _MoneyTransferState extends State<MoneyTransfer> {
  final TextEditingController _inputController = TextEditingController();
  bool _isButtonEnabled = false;
  late String scannedMessage;
  String firstname = "Baber Ali ";
  String lastname = "Hashmi";

  _MoneyTransferState(this.scannedMessage);

  String get cnic => scannedMessage;

  String? token = MySharedPrefClass.preferences!.getString('token');

  get wallet => null;

  @override
  void initState() {
    super.initState();
    getQrcode(cnic, token);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _checkButtonEnabled() {
    setState(() {
      _isButtonEnabled = _inputController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [Icon(Icons.home)],
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Money Transfer"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        // cnic,
                        "Enter Amount to:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "$firstname $lastname",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter Amount to Send",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Divider(height: 0.5, color: Colors.grey),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _inputController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefix: Text(
                        'RS.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      _checkButtonEnabled();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: _isButtonEnabled ? transferMoney(cnic, wallet, token) : null,
                    child: Row(
                      children: [
                        Text(
                          "Send RS. ${_inputController.text}",
                          style: TextStyle(
                            color:
                                _isButtonEnabled ? Colors.yellow : Colors.black,
                          ),
                        ),
                        const Spacer(),
                         Icon(
                          Icons.arrow_forward_rounded,
                          color:_isButtonEnabled ? Colors.yellow : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getQrcode(String cnic, mToken) async {
    try {
      Response response = await post(Uri.parse(Apis.qrCodeApi), headers: {
        'Authorization': 'Token $mToken',
      }, body: {
        'cnic': cnic
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['cnic']);
        print(data['fname']);
        print(data['lname']);
        setState(() {
          firstname = data['fname'];
          lastname = data['lname'];
        });
      } else {
        var data = jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['detail'].toString())),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred')),
      );
    }
  }

    transferMoney(String cnic, wallet, mToken) async {
    try {
      Response response = await post(Uri.parse(Apis.transferMoneyApi),
          headers: {
        'Authorization': 'Token $mToken',
      }, body: {
        'cnic': cnic,
        "wallet": wallet,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['cnic']);
        print(data['wallet']);
      } else {
        var data = jsonDecode(response.body);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['detail'].toString())),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred')),
      );
    }
  }
}
