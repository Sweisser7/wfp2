
import 'package:wfp2/backend/nfc_handler.dart';



class NfcSession {

  final NFCHandler _nfcHandler = NFCHandler();
  
  String _message = "Ready to scan NFC tags.";

    Future<String> startNfcSession() async {
    
       _message = "Checking NFC availability...";

    try {
      // Check NFC availability
      await _nfcHandler.checkAvailability();
      // Start NFC polling
        _message = "Scanning for NFC tags...";
      await _nfcHandler.pollNfc();
        _message = "NFC session completed successfully!";
        //stampCard.performTask(_message);
        return _message;
    } catch (e) {
        _message = "Error";
        //stampCard.performTask(_message);
        return _message ;
    }
  }


}