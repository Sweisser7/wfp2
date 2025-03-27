

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

  String chooseStampCard (int index) {

    switch (index) {
      case 0 :
      return "assets/stampcard0.png";
      case 1 :
      return "assets/stampcard1.png";
      case 2 :
      return "assets/stampcard2.png";
      case 3 :
      return "assets/stampcard3.png";
      case 4 :
      return "assets/stampcard4.png";
      case 5 :
      return "assets/stampcard5.png";
      case 6 :
      return "assets/stampcard6.png";
      case 7 :
      return "assets/stampcard7.png";
      case 8 :
      return "assets/stampcard8.png";
      case 9 :
      return "assets/stampcard9.png";
      case 10 :
      return "assets/stampcard10.png";
    } 

    return "null";

  }
}






