
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
