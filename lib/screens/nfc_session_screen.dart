
import 'package:flutter/material.dart';
import 'package:wfp2/widgets/nfc_widgets.dart';

class NFCsessionscreen extends StatelessWidget {
  const NFCsessionscreen({super.key});
  
  final String title = 'NFC';

  @override
  Widget build(BuildContext context) {
    return NFCSessionWidget();
  }
}