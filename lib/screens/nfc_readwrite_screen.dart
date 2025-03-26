import 'package:flutter/material.dart';
import 'package:wfp2/widgets/nfc_readwrite_widget.dart';
import 'package:wfp2/widgets/qrcode_widget.dart';

class NfcReadwriteScreen extends StatelessWidget {
  const NfcReadwriteScreen({super.key});
  
  final String title = 'NFC Read/Write';

  @override
  Widget build(BuildContext context) {
    return NFCReadWriteWidget();
  }
} 