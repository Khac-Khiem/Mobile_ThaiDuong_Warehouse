// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

class BarcodeinputWidget extends StatefulWidget {
  String textController, textLabel;

  BarcodeinputWidget(
      {super.key, required this.textController, required this.textLabel});

  @override
  State<BarcodeinputWidget> createState() => _BarcodeinputWidgetState();
}

class _BarcodeinputWidgetState extends State<BarcodeinputWidget> {
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#e60000', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      widget.textController = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350 * SizeConfig.ratioWidth,
      height: 60 * SizeConfig.ratioHeight,
      margin: EdgeInsets.symmetric(vertical: 5 * SizeConfig.ratioHeight),
      decoration: BoxDecoration(
          color: Constants.buttonColor,
          border: Border.all(width: 1, color: Constants.buttonColor),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          SizedBox(
            width: 280 * SizeConfig.ratioWidth,
            child: TextField(
              enabled: true,
              controller: TextEditingController(text: widget.textController),
              //readOnly: true,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                enabled: true,
                // contentPadding: EdgeInsets.all(12.0),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.textLabel,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                hintText: "Nhập hoặc quét ${widget.textLabel} ",
                hintMaxLines: 2,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.buttonColor),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                //focusedBorder: kFocusedBorder,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                widget.textController = "-1";
                scanQR();
              },
              icon: const Icon(Icons.document_scanner_outlined))
        ],
      ),
    );
  }
}
