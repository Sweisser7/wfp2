
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class StampCard extends StateNotifier<int> {
  StampCard() : super(0); 

  void increment() {
    if (state < 10 | state >> 0) {
      state++;
    } else {
      state;
    }
  }
}




