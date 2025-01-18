/*import 'package:flutter/material.dart';
import 'package:wfp2/backend/nfc_session.dart';

class NFCSessionWidget extends StatefulWidget {
  const NFCSessionWidget({Key? key}) : super(key: key);

  @override
  _NFCSessionWidgetState createState() => _NFCSessionWidgetState();
}

class _NFCSessionWidgetState extends State<NFCSessionWidget> {
  String _message = "Ready to scan NFC tags.";
  final NfcSession _nfcSession = NfcSession();

  /// Start NFC session
  Future<void> runNFCSession() async {
    setState(() {
      _message = "Checking NFC availability...";
    });

    try {
      Future<String> nfcSession = _nfcSession.startNfcSession();
      setState(() {

        _message = nfcSession as String;
      });
    } catch (e) {
        _message = "Error: $e";
    }
  }

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
              Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: runNFCSession,
                child: const Text("Start NFC Session"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:wfp2/backend/nfc_handler.dart';
import 'package:wfp2/backend/stampcard.dart'; // Replace with the actual file path of your NFCHandler class

class NFCSessionWidget extends StatefulWidget {
  const NFCSessionWidget({Key? key}) : super(key: key);

  @override
  _NFCSessionWidgetState createState() => _NFCSessionWidgetState();
}

class _NFCSessionWidgetState extends State<NFCSessionWidget> {
  final NFCHandler _nfcHandler = NFCHandler();
  final StampCard stampCard = StampCard();
  String _message = "Ready to scan NFC tags.";

  /// Start NFC session
  Future<void> _startNfcSession() async {
    setState(() {
      _message = "Checking NFC availability...";
    });

    try {
      // Check NFC availability
      await _nfcHandler.checkAvailability();

      // Start NFC polling
      setState(() {
        _message = "Scanning for NFC tags...";
      });

      await _nfcHandler.pollNfc();

      setState(() {
        _message = "NFC session completed successfully!";
        stampCard.performTask(_message);
      });
    } catch (e) {
      setState(() {
        _message = "Error: $e";
        stampCard.performTask(_message);
      });
    }
  }

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
              Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startNfcSession,
                child: const Text("Start NFC Session"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
