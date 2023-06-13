import 'package:flutter/material.dart';

class MoneyTransfer extends StatefulWidget {
    MoneyTransfer({Key? key,
     required this.scannedMessage
   }) : super(key: key);

  String scannedMessage = '';
  @override
  State<MoneyTransfer> createState() => _MoneyTransferState(scannedMessage);
}

class _MoneyTransferState extends State<MoneyTransfer> {
  final TextEditingController _inputController = TextEditingController();
  bool _isButtonEnabled = false;

  _MoneyTransferState(String cnic);

  String get cnic => cnic;

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
        actions: const [
          Icon(Icons.home)
        ],
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
                  Text(
                    cnic,
                    // "Transfer to JazzCash",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
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
                    onPressed: _isButtonEnabled ? () {} : null,
                    child: Row(
                      children: [
                        Text("Send RS. ${_inputController.text}",
                        style: const TextStyle(
                          color: Colors.yellow
                        ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_rounded,
                        color: Colors.yellow,),
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
}

