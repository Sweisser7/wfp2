import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wfp2/backend/stampcard.dart';
import 'package:wfp2/main.dart';

final stampCardProvider = StateNotifierProvider<StampCard, int>((ref) {
  return StampCard();
});
class StampcardWidget extends ConsumerWidget {
  const StampcardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(stampCardProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Stampcard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Zähler: $counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(stampCardProvider.notifier).increment(); // Erhöhe den Wert
              },
              child: Text('Erhöhen'),
            ),
          ],
        ),
      ),
    );
  }
}