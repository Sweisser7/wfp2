/*import 'package:flutter/material.dart';


class NfcEmulator3 {
  bool isEmulating = false;
  
  

  Future<void> startNfcEmulation() async {
    if (isEmulating) return;

    try {
      //setState(() => isEmulating = true);
      
      await NfcEmulator.startNfcEmulator(
        "Hello from Flutter!", // Die NDEF Nachricht
        "Hello again not from Flutter"
         
      );

      
    } catch (e) {
      debugPrint("Fehler beim Starten der NFC-Emulation: $e");
    } finally {
      //setState(() => isEmulating = false);
    }
  }

  Future<void> stopNfcEmulation() async {
    if (!isEmulating) return;

    try {
      await NfcEmulator.stopNfcEmulator();
      debugPrint("NFC Emulation gestoppt.");
    } catch (e) {
      debugPrint("Fehler beim Stoppen der NFC-Emulation: $e");
    } finally {
      //setState(() => isEmulating = false);
    }
  }

  
}*/