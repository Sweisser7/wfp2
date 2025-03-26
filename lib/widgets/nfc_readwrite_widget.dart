import 'package:flutter/material.dart';
import 'package:wfp2/backend/nfc_notifier.dart';
import 'package:wfp2/widgets/button_widgets.dart';
import 'package:wfp2/widgets/nfc_dialogs.dart';
import 'package:provider/provider.dart';

class NFCReadWriteWidget extends StatelessWidget {
  const NFCReadWriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NFCNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NFC READ/WRITE"),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(nfcOperation: NFCOperation.read);
                      },
                      child: ButtonWidget(
                          backgroundColor: Colors.black,
                          text: "Read NFC",
                          textColor: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                      onTap: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(
                                nfcOperation: NFCOperation.write,
                                dataType: "URL");
                      },
                      child: ButtonWidget(
                          backgroundColor: Colors.black,
                          text: "Write URL",
                          textColor: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                      onTap: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(
                                nfcOperation: NFCOperation.write,
                                dataType: "MAIL");
                      },
                      child: ButtonWidget(
                          backgroundColor: Colors.black,
                          text: "Write Mail",
                          textColor: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                      onTap: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(
                                nfcOperation: NFCOperation.write,
                                dataType: "CONTACT");
                      },
                      child: ButtonWidget(
                          backgroundColor: Colors.black,
                          text: "Write Contact",
                          textColor: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  
                  Consumer<NFCNotifier>(builder: (context, provider, _) {
                    if (provider.isProcessing) {
                      return const CircularProgressIndicator();
                    }
                    if (provider.message.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                        showResultDialog(context, provider.message);
                      });
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
