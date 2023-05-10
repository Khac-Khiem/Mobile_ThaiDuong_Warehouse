import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/isolation_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/isolation_events.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/isolation_states.dart';
import 'package:mobile_warehouse_thaiduong/presentation/dialog/dialog_two_button.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
import '../../dialog/dialog_one_button.dart';
import '../../widgets/exception_widget.dart';

class IsolatedNewItemLotScreen extends StatefulWidget {
  const IsolatedNewItemLotScreen({super.key});

  @override
  _IsolatedNewItemLotScreenState createState() =>
      _IsolatedNewItemLotScreenState();
}

class _IsolatedNewItemLotScreenState extends State<IsolatedNewItemLotScreen> {
  String scanResult = '-1'; //Scan QR ra
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#e60000', 'Cancel', true, ScanMode.QR);
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
              Navigator.pushNamed(context, '/isolation_function_screen');
            },
          ),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Quét mã',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        //endDrawer: DrawerUser(),
        body: BlocConsumer<IsolationBloc, IsolationState>(
            listener: (context, state) {
          if (state is GetLotByLotIdSuccessState) {
            AlertDialogOneBtnCustomized(
                    context,
                    'Xác nhận',
                    'Bạn có chắc muốn cách ly lô hàng $scanResult',
                    'Tiếp tục','', () {
              Navigator.pushNamed(context, '/isolation_function_screen');
            }, 20, 15, () {}, false)
                .show();
          }
          if (state is GetAllIsolationLotFailState) {
            AlertDialogOneBtnCustomized(context, 'Cảnh báo',
                    'Lô hàng hiện không tồn tại', 'Tiếp tục','', () {
              Navigator.pushNamed(context, '/isolation_function_screen');
            }, 20, 15, () {}, false)
                .show();
          }
          if (state is PostNewIsolationSuccessState) {
            AlertDialogOneBtnCustomized(context, 'Thành công',
                    'Đã hoàn thành việc cách ly', 'Tiếp tục','', () {
              Navigator.pushNamed(context, '/isolation_function_screen');
            }, 20, 15, () {}, false)
                .show();
          }
          if (state is PostNewIsolationFailState) {
            AlertDialogOneBtnCustomized(context, 'Thất bại',
                    'Không thể tiến hành cách ly', 'Tiếp tục','', () {
              Navigator.pushNamed(context, '/isolation_function_screen');
            }, 20, 15, () {}, false)
                .show();
          }
        }, builder: ((context, state) {
          // if (state is GetLotByLotIdSuccessState) {
          //   return Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         // Text(
          //         //     scanResult != '-1'
          //         //         ? 'Kết quả : $scanResult\n'
          //         //         : 'Vui lòng quét mã lô',
          //         //     style: TextStyle(
          //         //         fontSize: 22 * SizeConfig.ratioFont,
          //         //         color:
          //         //             scanResult != '-1' ? Colors.black : Colors.red)),
          //         // SizedBox(
          //         //   height: 20 * SizeConfig.ratioHeight,
          //         // ),
          //         // CustomizedButton(
          //         //   onPressed: () {
          //         //     scanResult = '1';
          //         //     scanQR();
          //         //   },
          //         //   text: "Quét mã",
          //         // ),
          //         // SizedBox(
          //         //   height: 10 * SizeConfig.ratioHeight,
          //         // ),
          //         // CustomizedButton(
          //         //     onPressed: scanResult == '-1'
          //         //         ? () {
          //         //             AlertDialogTwoBtnCustomized(
          //         //                     context,
          //         //                     'Bạn có chắc',
          //         //                     'Chưa có lô được quét? Ấn tiếp tục để quét lại',
          //         //                     'Tiếp tục',
          //         //                     'Trở lại',
          //         //                     () async {}, () {
          //         //               Navigator.pushNamed(
          //         //                   context, '/isolation_function_screen');
          //         //             }, 18, 22)
          //         //                 .show();
          //         //           }
          //         //         : () {
          //         //             BlocProvider.of<IsolationBloc>(context).add(
          //         //                 GetLotByLotIdEvent(
          //         //                     DateTime.now(), scanResult));
          //         //           },
          //         //     text: 'Xác nhận'),
          //          ListTile(
          //             // leading: ,
          //             // trailing: Icon(
          //             //     Icons.arrow_drop_down_sharp,
          //             //     size: 15 * SizeConfig.ratioFont),
          //             title: Text("Mã lô : ${state.itemLot.lotId}"),
          //             subtitle: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                     "Sản phẩm : ${state.itemLot.item!.itemName.toString()}  \nSố lượng : ${state.itemLot.quantity.toString()}"),
          //                 Text(
          //                     "Định mức : ${state.itemLot.sublotSize.toString()}  \nVị trí : ${state.itemLot.location!.locationId.toString()}"),
          //               ],
          //             ),
          //             isThreeLine: true,
          //             onTap: () {}),
          //         CustomizedButton(
          //             onPressed: (() {
          //               BlocProvider.of<IsolationBloc>(context).add(
          //                   PostNewIsolationEvent(DateTime.now(), scanResult));
          //             }),
          //             text: 'Xác nhận'),
          //       ]);
          // }
          if (state is PostNewIsolationFailState) {
            return Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20 * SizeConfig.ratioHeight,
                      ),
                      ExceptionErrorState(
                        title: 'Lỗi hệ thống',
                        message: "Vui lòng thử lại sau",
                      ),
                      CustomizedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/isolation_function_screen');
                          },
                          text: 'Xác nhận')
                    ]));
          } else {
            return Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          scanResult != '-1'
                              ? 'Kết quả : $scanResult\n'
                              : 'Vui lòng quét mã lô',
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
                                  // BlocProvider.of<IsolationBloc>(context).add(
                                  //     PostNewIsolationEvent(
                                  //         DateTime.now(), "Lo001"));
                                  AlertDialogTwoBtnCustomized(
                                          context,
                                          'Bạn có chắc',
                                          'Chưa có lô được quét? Ấn tiếp tục để quét lại',
                                          'Success_image.png',
                                          'Tiếp tục',
                                          'Trở lại',
                                          () async {}, () {
                                    Navigator.pushNamed(
                                        context, '/isolation_function_screen');
                                  }, 18, 22)
                                      .show();
                                }
                              : () {
                                  BlocProvider.of<IsolationBloc>(context).add(
                                      GetLotByLotIdEvent(
                                          DateTime.now(), scanResult));
                                },
                          text: 'Xác nhận')
                    ]));
          }
        })));
  }
}
