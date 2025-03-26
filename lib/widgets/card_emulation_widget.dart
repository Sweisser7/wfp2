
/*import 'package:flutter/material.dart';
import 'package:wfp2/backend/nfc_emulation.dart';



class CardEmulatorWidget extends StatefulWidget {
  const CardEmulatorWidget({super.key});

  @override
  _CardEmulatorWidgetState createState() => _CardEmulatorWidgetState();
}

class _CardEmulatorWidgetState extends State<CardEmulatorWidget> {
  final NfcEmulator3 cardEmulator = NfcEmulator3();
  
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Session'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: cardEmulator.startNfcEmulation,
                child: const Text("Start NFC Session"),
              ),
              ElevatedButton(
                onPressed: cardEmulator.stopNfcEmulation,
                child: const Text("Stop NFC Session"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

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
    _nfcService.initialize();
    _nfcService.onApduReceived = (command) {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFC HCE Example')),
      body: Center(
        child: _nfcService.nfcState == NfcState.enabled
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NFC State: ${_nfcService.nfcState.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        _nfcService.apduAdded
                            ? Colors.redAccent
                            : Colors.greenAccent,
                      ),
                    ),
                    onPressed: () async {
                      await _nfcService.toggleApduResponse();
                      setState(() {});
                    },
                    child: Text(
                      _nfcService.apduAdded
                          ? 'Remove APDU Response'
                          : 'Add APDU Response',
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
                ],
              )
            : Text(
                'NFC is ${_nfcService.nfcState.name}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

