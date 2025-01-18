
import 'package:flutter/material.dart';
import 'package:wfp2/widgets/qrcode_widget.dart';

class Myqrcodescreen extends StatelessWidget {
  const Myqrcodescreen({super.key});
  
  final String title = 'My QR-Code';

  @override
  Widget build(BuildContext context) {
    return QrCodeWidget();
  }
}