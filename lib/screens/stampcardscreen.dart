import 'package:flutter/material.dart';

import 'package:wfp2/widgets/stampcard_widget.dart';



class MyStampCardScreen extends StatelessWidget {

  const MyStampCardScreen({super.key});
  
  final String title = 'My Stampcard';

  @override
  Widget build(BuildContext context) {
    return StampcardWidget();
  }
}


