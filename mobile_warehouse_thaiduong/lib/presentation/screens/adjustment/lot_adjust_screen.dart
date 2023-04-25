import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/adjustment_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/adjustment_states.dart';

import '../../bloc/events/adjustment_events.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class LotAdjustmentScreen extends StatefulWidget {
  const LotAdjustmentScreen({super.key});

  @override
  State<LotAdjustmentScreen> createState() => _LotAdjustmentScreenState();
}

class _LotAdjustmentScreenState extends State<LotAdjustmentScreen> {
  String controllerPO = '';
  double controllerQuantity = 0;
  String controllerNote = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.west_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/scan_adjustment_screen');
          },
        ),
        title: Text(
          'Điều chỉnh lô',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return BlocConsumer<AdjustmentBloc, AdjustmentState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is GetLotDetailSuccessState) {
                return SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.all(10 * SizeConfig.ratioHeight),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    "Thông tin lô cần điều chỉnh",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20 * SizeConfig.ratioFont,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10 * SizeConfig.ratioHeight,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Mã lô:                  ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 10, 10),
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Constants.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Center(
                                                child: Text(
                                                  state.lotAdjust.lotId,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 22 *
                                                        SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Mã sản phẩm:    ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Constants.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Center(
                                                child: Text(
                                                  state.lotAdjust.item!.itemId
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 22 *
                                                        SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Lượng cũ:            ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              // padding:
                                              // const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Constants.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Center(
                                                child: Text(
                                                  state.lotAdjust.quantity
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 22 *
                                                        SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Lượng mới:         ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5 *
                                                      SizeConfig.ratioHeight),
                                              alignment: Alignment.centerRight,
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              //color: Colors.grey[200],
                                              child: TextField(
                                                controller: TextEditingController(
                                                    text:
                                                        controllerQuantity == 0
                                                            ? ''
                                                            : controllerQuantity
                                                                .toString()),
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      Constants.buttonColor,
                                                  // labelText: "Nhập lượng mới"
                                                ),
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        decimal: true),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9.,]')),
                                                ],
                                                // onSubmitted: (value) =>
                                                //     value != ''
                                                //         ? controllerQuantity =
                                                //             double.parse(value)
                                                //         : controllerQuantity =
                                                //             double.parse('0'),
                                                onChanged: (value) =>
                                                    value != ''
                                                        ? controllerQuantity =
                                                            double.parse(value)
                                                        : controllerQuantity =
                                                            double.parse('0'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "PO cũ:                 ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              // padding:
                                              // const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Constants.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Center(
                                                child: Text(
                                                  state.lotAdjust
                                                      .purchaseOrderNumber
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 22 *
                                                        SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "PO mới:               ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5 *
                                                      SizeConfig.ratioHeight),
                                              alignment: Alignment.centerRight,
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              //color: Colors.grey[200],
                                              child: TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: controllerPO == ''
                                                            ? ''
                                                            : controllerPO
                                                                .toString()),
                                                onChanged: (value) {
                                                  controllerPO = value;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  // labelText: "PO mới",
                                                  // labelStyle: TextStyle(
                                                  //   color:
                                                  //       Color.fromRGBO(136, 136, 136, 1),
                                                  //   fontSize: 18,
                                                  // ),
                                                  filled: true,
                                                  fillColor:
                                                      Constants.buttonColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Ghi chú:              ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    20 * SizeConfig.ratioFont,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5 *
                                                      SizeConfig.ratioHeight),
                                              alignment: Alignment.centerRight,
                                              width:
                                                  160 * SizeConfig.ratioWidth,
                                              height:
                                                  45 * SizeConfig.ratioHeight,
                                              //color: Colors.grey[200],
                                              child: TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: controllerNote ==
                                                                ''
                                                            ? ''
                                                            : controllerNote
                                                                .toString()),
                                                onChanged: (value) {
                                                  controllerNote = value;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  // labelText: "Ghi chú",
                                                  // labelStyle: TextStyle(
                                                  //   color:
                                                  //       Color.fromRGBO(136, 136, 136, 1),
                                                  //   fontSize: 18,
                                                  // ),
                                                  filled: true,
                                                  fillColor:
                                                      Constants.buttonColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomizedButton(
                                        text: "Xác nhận",
                                        onPressed: () {
                                          if (controllerPO == '') {
                                            controllerPO = state
                                                .lotAdjust.purchaseOrderNumber
                                                .toString();
                                          }
                                          if (controllerQuantity == 0) {
                                            controllerQuantity =double.parse(state
                                                .lotAdjust.quantity.toString())
                                                ;
                                          }
                                          BlocProvider.of<AdjustmentBloc>(
                                                  context)
                                              .add(
                                                  UpdateLotAdjustmentQuantityEvent(
                                                      DateTime.now(),
                                                      '',
                                                      state.lotAdjust,
                                                      controllerPO,
                                                      controllerQuantity,
                                                      controllerNote));
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ])),
                );
              }

              if (state is GetLotDetailFailState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        title: 'Mã lô không tồn tại',
                        message: "Quét lại mã lô khác",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
              if (state is UpdateLotQuantitySuccessState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        icon: Icons.check_box_outlined,
                        title: 'Thành công',
                        message: "Đã hoàn thành kiểm kê lô",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
              if (state is UpdateLotQuantityFailState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        title: 'Thất bại',
                        message: "Không thể hoàn thành kiểm kê lô",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100 * SizeConfig.ratioHeight,
                      ),
                      const CircularProgressIndicator(),
                      SizedBox(
                        height: 150 * SizeConfig.ratioHeight,
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
