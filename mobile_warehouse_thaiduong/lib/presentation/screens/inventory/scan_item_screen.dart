import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/adjustment_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/inventory_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/dialog/dialog_two_button.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

import '../../bloc/events/adjustment_events.dart';
import '../../bloc/events/inventory_events.dart';

class BarcodeScannerItemScreen extends StatefulWidget {
  const BarcodeScannerItemScreen({super.key});

  @override
  _BarcodeScannerItemScreenState createState() => _BarcodeScannerItemScreenState();
}

class _BarcodeScannerItemScreenState extends State<BarcodeScannerItemScreen> {
  String scanResult = '-1'; //Scan QR ra
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
      scanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(
            Icons.west, //mũi tên back
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/stockcard_function_screen');
          },
        ),
          // leading: IconButton(
          //     icon: const Icon(Icons.west_outlined),
          //     onPressed: () {
          //       // if (scanResult != "-1") {
          //       //   AlertDialogTwoBtnCustomized(
          //       //           context,
          //       //           'Bạn có chắc',
          //       //           'Khi nhấn trở lại, mọi dữ liệu sẽ không được lưu',
          //       //           'Trở lại',
          //       //           'Tiếp tục', () {
          //       //     Navigator.pushNamed(context, '///');
          //       //   }, () {}, 18, 22)
          //       //       .show();
          //       // } else {
          //       //   Navigator.of(context).pop();
          //       // }
          //     }),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Quét mã',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        //endDrawer: DrawerUser(),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        scanResult != '-1'
                            ? 'Kết quả : $scanResult\n'
                            : 'Vui lòng quét mã sản phẩm',
                        style: TextStyle(
                            fontSize: 22 * SizeConfig.ratioFont,
                            color: scanResult != '-1'
                                ? Colors.black
                                : Colors.red)),
                    SizedBox(
                      height: 20 * SizeConfig.ratioHeight,
                    ),
                    CustomizedButton(
                      onPressed: () {
                        scanResult = '1';
                        scanQR();
                      },
                      text: "Quét mã",
                    ),
                    SizedBox(
                      height: 10 * SizeConfig.ratioHeight,
                    ),
                    CustomizedButton(
                        onPressed: scanResult == '-1'
                            ? () {
                                AlertDialogTwoBtnCustomized(
                                        context,
                                        'Bạn có chắc',
                                        'Chưa có lô được quét? Ấn tiếp tục để quét lại',
                                        'Tiếp tục',
                                        'Trở lại',
                                        () async {}, () {
                                  Navigator.pushNamed(
                                      context, '/receipt_screen');
                                }, 18, 22)
                                    .show();
                              }
                            : () {
                                 BlocProvider.of<InventoryBloc>(context).add(
                              LoadInventoryEvent(
                                  DateTime.now(),
                                  scanResult,
                                 DateFormat('yyyy-MM-dd').parse(''),
                                  DateFormat('yyyy-MM-dd').parse('')
                                  //state.warehouse
                                  ));
                                Navigator.pushNamed(
                                    context,
                                    '/list_inventory_screen',
                                  ); 
                              },
                        text: 'Xác nhận')
                  ]));
        }));
  }
}
