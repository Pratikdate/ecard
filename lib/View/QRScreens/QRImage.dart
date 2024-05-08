import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage(this.controller, {Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Column(

         children: [

           QrImageView(
             data: controller.text,
             size: 280,
             embeddedImageStyle: QrEmbeddedImageStyle(
               size: const Size(
                 100,
                 100,
               ),
             ),
           ),
         ],
      ),
    );
  }
}
