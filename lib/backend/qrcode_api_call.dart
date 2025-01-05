import 'dart:typed_data';
import 'package:http/http.dart' as http;

class QrCodeApiClient {
  final String apiUrl;

  /// Constructor to initialize the API URL
  QrCodeApiClient({required this.apiUrl});

  /// Fetch a QR code image from the API
  Future<Uint8List> fetchQrCode(String data, {int size = 500}) async {
    try {
      // Build the query parameters
      final uri = Uri.parse(apiUrl).replace(queryParameters: {
        'data': data,
        'size': '${size}x$size',
        
      });
      print(data);

      // Send a GET request to the API
      final response = await http.get(uri);

      // Check if the response is successful
      if (response.statusCode == 200) {
        return response.bodyBytes; // Return the QR code as bytes
      } else {
        throw Exception(
            'Failed to fetch QR code. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching QR code: $e');
    }
  }

  
  
}




