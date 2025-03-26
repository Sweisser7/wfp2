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

import 'dart:typed_data';
import 'package:nfc_host_card_emulation/nfc_host_card_emulation.dart';

NfcState _nfcState = NfcState.enabled;

class NfcService {
  
  bool _apduAdded = false;

  final int _port = 0;
  final List<int> _data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  NfcApduCommand? _nfcApduCommand;
  Function(NfcApduCommand)? onApduReceived;

  Future<void> initialize() async {
    _nfcState = await NfcHce.checkDeviceNfcState();

    if (_nfcState == NfcState.enabled) {
      await NfcHce.init(
        aid: Uint8List.fromList([0xA0, 0x00, 0xDA, 0xDA, 0xDA, 0xDA, 0xDA]),
        permanentApduResponses: true,
        listenOnlyConfiguredPorts: false,
      );

      NfcHce.stream.listen((command) {
        _nfcApduCommand = command;
        if (onApduReceived != null) {
          onApduReceived!(command);
        }
      });
    }
  }

  NfcState get nfcState => _nfcState;
  bool get apduAdded => _apduAdded;
  NfcApduCommand? get nfcApduCommand => _nfcApduCommand;

  Future<void> toggleApduResponse() async {
    if (_apduAdded) {
      await NfcHce.removeApduResponse(_port);
    } else {
      await NfcHce.addApduResponse(_port, _data);
    }
    _apduAdded = !_apduAdded;
  }
}
