
import 'package:flutter/material.dart';

import '../core/models/ScanQRCode.dart';

class QRScanScreen extends StatefulWidget {
  QRScanScreen({super.key});
  static const routeName = '/Scan';
  @override
  _QRScanScreen createState() => _QRScanScreen();
}

class _QRScanScreen extends State<QRScanScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,


      //body part
      body: QRCodeScannerScreen(),
    );
  }
}
