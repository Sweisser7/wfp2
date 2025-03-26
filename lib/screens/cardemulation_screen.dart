import 'package:flutter/material.dart';
import 'package:wfp2/widgets/card_emulation_widget.dart';

class CardEmulationScreen extends StatelessWidget {
  const CardEmulationScreen({super.key});
  
  final String title = 'My NFC Card';

  @override
  Widget build(BuildContext context) {
    return CardEmulationWidget();
  }
} 