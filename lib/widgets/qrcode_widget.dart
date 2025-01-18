import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wfp2/backend/qrcode_api_call.dart';

class QrCodeWidget extends StatefulWidget {
  const QrCodeWidget({Key? key}) : super(key: key);

  @override
  _QrCodeWidgetState createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  late QrCodeApiClient qrCodeApiClient;
  Uint8List? qrCodeBytes;
  bool isLoading = false;

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  @override
  void initState() {
    super.initState();

    
    qrCodeApiClient = QrCodeApiClient(apiUrl: 'https://api.qrserver.com/v1/create-qr-code/?');
    _fetchQrCode();
  }

  Future<void> _fetchQrCode() async {
    setState(() {
      isLoading = true;
    });

    try {
      final randomString = generateRandomString(40);
      final bytes = await qrCodeApiClient.fetchQrCode(randomString);
      setState(() {
        qrCodeBytes = bytes;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My QR-Code')),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: isLoading
            ? const CircularProgressIndicator()
            : qrCodeBytes != null
                ? Image.memory(qrCodeBytes!)
                : const Text('Failed to load QR code'),
      ),
    );
  }
}
