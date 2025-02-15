import 'package:flutter/material.dart';
import 'package:wfp2/backend/stampcard.dart';

class NumberBoxWidget extends StatelessWidget {
  final int count; // Integer-Wert, der die Anzahl anzeigt

  const NumberBoxWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    // Sicherheitsprüfung: Wenn count größer als 10 oder kleiner als 1 ist, begrenzen
    final StampCard stampcard = StampCard();
    final int displayCount = stampcard.showStampCount();

    // Erstelle eine Liste der Zahlen, die angezeigt werden sollen
    final List<int> numbers = List.generate(displayCount, (index) => index + 1);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100], // Hintergrundfarbe der Box
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue, width: 2.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: numbers
            .map((number) => Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // Beispiel: Übergabe des Werts 5, um die Zahlen 1-5 anzuzeigen
        child: NumberBoxWidget(count: 5),
      ),
    ),
  ));
}
