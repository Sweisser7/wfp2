//import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:qr/qr.dart';
//import 'package:path_provider/path_provider.dart';


class QrCodeGenerator {
  /// Generate a random string to encode in the QR code
  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  /// Generate a QR code image as a byte array
  Uint8List generateQrCodeImage({int size = 300}) {
    // Generate random data for the QR code
    final randomData = _generateRandomString(10);

    // Create QR code object
    final qrCode = QrCode(4, QrErrorCorrectLevel.L); // Version 4, low error correction
    qrCode.addData(randomData);

    

    // Create an image buffer
    final qrImage = img.Image(height: size, width: size);
    img.fill(qrImage, color:  qrImage.getColor(255, 255, 255)); // Fill with white

    // Calculate cell size
    final cellSize = size ~/ qrCode.moduleCount;

    // Draw the QR code on the image
    for (int x = 0; x < qrCode.moduleCount; x++) {
      for (int y = 0; y < qrCode.moduleCount; y++) {
       
        
        img.fillRect(
          qrImage,
          x1: x * cellSize,
          y1: y * cellSize,
          x2: x * cellSize + cellSize - 1,
          y2: y * cellSize + cellSize - 1,
          color: qrImage.getColor(0, 0, 0),
        );
      }
    }

    // Encode the image as PNG and return the byte array
    return Uint8List.fromList(img.encodePng(qrImage));
  }

  /* Future<String> saveQrImage () {

    final generator = QrCodeGenerator();
    final qrImageBytes = generator.generateQrCodeImage(size: 300);

  
    final filePath = tempFilePath();

    final file = File(filePath);
    file.writeAsBytesSync(qrImageBytes);
    return filePath;
  }

  Future<String> tempFilePath () async {

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/random_qr_code.png';
    return filePath;
  } */

}
