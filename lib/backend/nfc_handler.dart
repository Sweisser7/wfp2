import 'dart:convert';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;


class NFCHandler {
  /// Check NFC availability
  Future<void> checkAvailability() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      throw Exception("NFC is not available");
    }
  }

  /// Start NFC polling
  Future<void> pollNfc() async {
    try {
      var tag = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag",
      );

      print(jsonEncode(tag));

      if (tag.type == NFCTagType.iso7816) {
        var result = await FlutterNfcKit.transceive("00B0950000");
        print("Transceive result: $result");
      }

      await FlutterNfcKit.setIosAlertMessage("hi there!");

      await _readNDEFRecords(tag);
      await _writeNDEFRecords(tag);
      await _blockLevelReadWrite(tag);

    } catch (e) {
      print("Error during NFC polling: $e");
    } finally {
      await _finish();
    }
  }

  /// Read NDEF records
  Future<void> _readNDEFRecords(NFCTag tag) async {
    if (tag.ndefAvailable != null) {
      var ndefRecords = await FlutterNfcKit.readNDEFRecords(cached: false);
      for (var record in ndefRecords) {
        print("NDEF Record: ${record.toString()}");
      }

      var rawRecords = await FlutterNfcKit.readNDEFRawRecords(cached: false);
      for (var record in rawRecords) {
        print("Raw NDEF Record: ${jsonEncode(record)}");
      }
    }
  }

  /// Write NDEF records
  Future<void> _writeNDEFRecords(NFCTag tag) async {
    if (tag.ndefWritable != null) {
      await FlutterNfcKit.writeNDEFRecords([
        ndef.UriRecord.fromString("https://github.com/nfcim/flutter_nfc_kit")
      ]);

      await FlutterNfcKit.writeNDEFRawRecords([
        NDEFRawRecord(
          "00",
          "0001",
          "0002",
          ndef.TypeNameFormat.unknown,
        )
      ]);
    }
  }

  /// Perform block-level read/write operations
  Future<void> _blockLevelReadWrite(NFCTag tag) async {
    if (tag.type == NFCTagType.iso15693) {
      await FlutterNfcKit.writeBlock(
        1,
        [0xde, 0xad, 0xbe, 0xff],
        iso15693ExtendedMode: false,
      );
    } else if (tag.type == NFCTagType.mifare_classic) {
      await FlutterNfcKit.authenticateSector(0, keyA: "FFFFFFFFFFFF");
      var sectorData = await FlutterNfcKit.readSector(0);
      print("Sector data: $sectorData");

      var blockData = await FlutterNfcKit.readBlock(0);
      print("Block data: $blockData");
    }
  }

  /// Finish NFC session
  Future<void> _finish() async {
    await FlutterNfcKit.finish(iosAlertMessage: "Success");
  }
}


