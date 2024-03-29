import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../constant.dart';
import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/events/warning_stocklevel_events.dart';
import '../../bloc/states/warning_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';



class WarningExpiredScreen extends StatefulWidget {
  const WarningExpiredScreen({super.key});

  @override
  State<WarningExpiredScreen> createState() => _WarningExpiredScreenState();
}

class _WarningExpiredScreenState extends State<WarningExpiredScreen> {
  @override
  Widget build(BuildContext context) {
    int expirationDate = 6;
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/warning_function_screen");
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.mainColor,
            leading: IconButton(
              icon: const Icon(Icons.west_outlined),
              onPressed: () {
                // BlocProvider.of<WarningBloc>(context).add(
                //     LoadExpirationWarningEvent(DateTime.now(), expirationDate));
                Navigator.pushNamed(context, '/warning_function_screen');
              },
            ),
            title: Text(
              'Cảnh báo',
              style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
            ),
          ),
          body: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatefulBuilder(builder: (context4, setState2) {
                    return Column(
                      children: [
                        NumberPicker(
                          value: expirationDate,
                          axis: Axis.horizontal,
                          minValue: 0,
                          maxValue: 100,
                          onChanged: (value) =>
                              setState2(() => expirationDate = value),
                        ),
                        Text('HSD còn lại: $expirationDate tháng'),
                      ],
                    );
                  }),
                ],
              ),
            ),
            CustomizedButton(
                text: "Truy xuất",
                onPressed: () {
                  BlocProvider.of<WarningBloc>(context).add(
                      LoadExpirationWarningEvent(
                          DateTime.now(), expirationDate));
                }),
            const Divider(
              indent: 30,
              endIndent: 30,
              color: Constants.mainColor,
              thickness: 1,
            ),
            BlocConsumer<WarningBloc, WarningState>(listener: (context, state) {
              if (state is ExpirationWarningLoadingState) {
                // showDialog(
                //     context: context,
                //     builder: (_) {
                //       return Dialog(
                //         // The background color
                //         backgroundColor: Colors.white,
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 20),
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: const [
                //               // The loading indicator
                //               CircularProgressIndicator(),
                //               SizedBox(
                //                 height: 15,
                //               ),
                //               // Some text
                //               Text('Loading...')
                //             ],
                //           ),
                //         ),
                //       );
                //     });
                  
              }
            }, builder: (context, state) {
              if (state is ExpirationWarningSuccessState ) {
                return Column(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Danh sách các lô hàng",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                        height: 440 * SizeConfig.ratioHeight,
                        child: ListView.builder(
                            itemCount: state.itemLot.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 100.0 * SizeConfig.ratioHeight,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      trailing: Icon(Icons.edit,
                                          size: 17 * SizeConfig.ratioFont),
                                      title: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8.0, 0, 8.0),
                                        child: Text(
                                          "Mã lô : ${state.itemLot[index].lotId}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16 * SizeConfig.ratioFont,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130 * SizeConfig.ratioWidth,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Mã SP: ${state.itemLot[index].item!.itemId}"),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Số lượng: ${state.itemLot[index].quantity}"),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Vị trí: ${state.itemLot[index].location ?? '...'}"),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "NSX: ${DateFormat('yyyy-MM-dd').format(state.itemLot[index].productionDate as DateTime)}"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 130 * SizeConfig.ratioWidth,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Tên SP: ${state.itemLot[index].item!.itemName}"),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Định mức: ${state.itemLot[index].sublotSize ?? '...'}  "),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "Số PO: ${state.itemLot[index].purchaseOrderNumber ?? '...'}"),
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                    "HSD: ${DateFormat('yyyy-MM-dd').format(state.itemLot[index].expirationDate as DateTime)}"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      isThreeLine: true,
                                      onTap: () {},
                                    ),
                                  ));
                            })),
                  ],
                );
              }
              if (state is ExpirationWarningFailState) {
                return Center(
                  child: ExceptionErrorState(
                    title: state.detail,
                    message: "Chọn lại thông tin để truy xuất",
                  ),
                );
              }
                if (state is ExpirationWarningLoadingState) {
             return const Dialog(
                        // The background color
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // The loading indicator
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 15,
                              ),
                              // Some text
                              Text('Loading...')
                            ],
                          ),
                        ),
                      );
              }
              else {
                return Center(
                  child: ExceptionErrorState(
                    title: 'Chưa có thông tin để truy xuất',
                    message: "Chọn thời gian để truy xuất",
                  ),
                );
              }
            }),
          ])),
    );
  }
}
