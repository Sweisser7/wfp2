// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:wfp2/backend/qrcode_api_call.dart';
import 'package:wfp2/backend/stampcard.dart';


class StampcardWidget extends StatelessWidget {
  bool isLoading = false;
  var qrCodeApiClient =
      QrCodeApiClient(apiUrl: 'https://api.qrserver.com/v1/create-qr-code/?');

  StampcardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StampCard currentStampCard = StampCard();

    return Scaffold(
      appBar: AppBar(title: Text('Stampcard')),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 240,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    currentStampCard.chooseStampCard(9),
                    width: 400.0,
                    height: 240.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 240,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: FutureBuilder<Uint8List?>(
                future: qrCodeApiClient.fetchByteStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    debugPrint("$snapshot");
                    return const Center(child: Text('Failed to load QR code'));
                  } else {
                    return Center(child: Image.memory(snapshot.data!));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
