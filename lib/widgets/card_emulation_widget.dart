import 'package:flutter/material.dart';
import 'package:nfc_host_card_emulation/nfc_host_card_emulation.dart';
import 'package:wfp2/backend/nfc_emulation.dart';

class CardEmulationWidget extends StatefulWidget {
  const CardEmulationWidget({super.key});

  @override
  State<CardEmulationWidget> createState() => _CardEmulationWidgetState();
}

class _CardEmulationWidgetState extends State<CardEmulationWidget> {
  final NfcService _nfcService = NfcService();

  @override
  void initState() {
    super.initState();
    
    _nfcService.onApduReceived = (command) {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My NFC Card')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  _nfcService.nfcState == NfcState.enabled
                      ? Colors.redAccent
                      : Colors.greenAccent,
                ),
              ),
              onPressed: () async 
              {
                _nfcService.initialize();
                _nfcService.toggleNfcState(_nfcService.checkDeviceState());
                
                setState(() {});
              },
              child: Text(
                _nfcService.nfcState == NfcState.enabled
                    ? 'Stop Emulation'
                    : 'Start Emulation',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if (_nfcService.nfcApduCommand != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Received Command on port ${_nfcService.nfcApduCommand!.port}:\n'
                  '${_nfcService.nfcApduCommand!.command}\n'
                  'Additional data: ${_nfcService.nfcApduCommand!.data}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            Text(
              'NFC is ${_nfcService.nfcState.name}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
