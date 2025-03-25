import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wfp2/backend/qrcode_api_call.dart';

class QrCodeWidget extends StatefulWidget {
  const QrCodeWidget({super.key});

  

  @override
  _QrCodeWidgetState createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  
  bool isLoading = false;
  var qrCodeApiClient = QrCodeApiClient(apiUrl: 'https://api.qrserver.com/v1/create-qr-code/?');

  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('My QR-Code')),
    body: FutureBuilder<Uint8List?>(
      future: qrCodeApiClient.fetchByteStream(), // Async abrufen
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Ladeanzeige
        } else if (snapshot.hasError || snapshot.data == null) {
          debugPrint("$snapshot");
          return const Center(child: Text('Failed to load QR code'));
        } else {
          return Center(child: Image.memory(snapshot.data!)); // QR-Code anzeigen
        }
      },
    ),
  );
}
}
 