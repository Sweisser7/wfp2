import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QrCodeApiClient {
  

  String apiUrl = 'https://api.qrserver.com/v1/create-qr-code/?';

  Future<Uint8List> fetchQrCode(String data, {int size = 500}) async {
    try {
      final uri = Uri.parse(apiUrl).replace(queryParameters: {
        'data': data,
        'size': '${size}x$size',
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to fetch QR code. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching QR code: $e');
    }
  }

  Future<Uint8List?> fetchByteStream() async {
    try {
      
      var randomString = generateRandomString(20);

      final bytes = fetchQrCode(randomString);
      return bytes;
      
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }
}





