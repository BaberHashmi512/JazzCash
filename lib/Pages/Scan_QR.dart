import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  QRViewController? _controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Use Camera to Scan JazzCash Business"),
            Text("QR Code and Pay"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_controller != null) {
                setState(() {
                  _isFlashOn = !_isFlashOn;
                  _controller!.toggleFlash();
                });
              }
            },
            icon: Icon(
              _isFlashOn ? Icons.flash_on : Icons.flash_off,
            ),
          ),
        ],
      ),
      body: Container(

        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
      controller.scannedDataStream.listen((scanData) {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
