

import 'dart:typed_data';
import 'package:nfc_host_card_emulation/nfc_host_card_emulation.dart';

NfcState _nfcState = NfcState.disabled;

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

  Future<NfcState> checkDeviceState() async {
    return await NfcHce.checkDeviceNfcState();
  }
  

  NfcState get nfcState => _nfcState;
  bool get apduAdded => _apduAdded;
  NfcApduCommand? get nfcApduCommand => _nfcApduCommand;

  Future<NfcState> toggleNfcState (nfcState) async {
    
     if (nfcState == NfcState.enabled) {
      return nfcState = NfcState.disabled;
    } if (nfcState == NfcState.disabled) {
      return nfcState = NfcState.enabled;
    } else {
        return nfcState;
    }
    
  }

  Future<void> toggleApduResponse() async {
    if (_apduAdded) {
      await NfcHce.removeApduResponse(_port);
    } else {
      await NfcHce.addApduResponse(_port, _data);
    }
    _apduAdded = !_apduAdded;
  }
}
