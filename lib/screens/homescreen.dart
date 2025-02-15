

import 'package:flutter/material.dart';
//import 'package:wfp2/backend/qrcode_generator.dart';
import 'package:wfp2/screens/my_qrcode_screen.dart';
import 'package:wfp2/screens/nfc_readwrite_screen.dart';
import 'package:wfp2/screens/nfc_session_screen.dart';
import 'package:wfp2/widgets/button_widgets.dart';
import 'package:get/get.dart';
import 'package:wfp2/widgets/stampcard_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberBoxWidget(count: 0),
            InkWell(
              onTap: () {
                Get.to(()=> Myqrcodescreen(), transition: Transition.fade, duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                backgroundColor: Colors.black,
                text: "Generate QR Code",
                textColor: Colors.white
                )),
            SizedBox(height: 5,),
            ButtonWidget(backgroundColor: Colors.black, text: "Scan QR-Code", textColor: Colors.white),
            SizedBox(height: 5,),
            InkWell(
              onTap: () {
                Get.to(()=> ReadWriteNFCScreen(), transition: Transition.fade, duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                backgroundColor: Colors.black,
                text: "Use NFC",
                textColor: Colors.white
                )),
          ],

        ),
      ),
    );
  }
}