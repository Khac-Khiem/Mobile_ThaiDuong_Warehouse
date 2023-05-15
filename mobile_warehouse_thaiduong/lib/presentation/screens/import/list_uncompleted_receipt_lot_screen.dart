import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/uncompleted_receipt_lot_event.dart';
import '../../../function.dart';
import '../../bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
import '../../bloc/blocs/receipt_bloc/uncompleted_receipt_lot_bloc.dart';
import '../../bloc/events/receipt_event/fill_info_receipt_lot_event.dart';
import '../../bloc/states/receipt_state/uncompleted_receipt_lot_state.dart';
import '../../dialog/dialog_one_button.dart';
import '../../widgets/button_widget.dart';

class ListUncompletedLotReceiptScreen extends StatefulWidget {
  const ListUncompletedLotReceiptScreen({super.key});

  @override
  State<ListUncompletedLotReceiptScreen> createState() =>
      _ListUncompletedLotReceiptScreenState();
}

class _ListUncompletedLotReceiptScreenState
    extends State<ListUncompletedLotReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //bool showExpand = false;

    return WillPopScope(
       onWillPop: () async {
        Navigator.pushNamed(context, "/importing_receipt_screen");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.west, //mũi tên back
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/importing_receipt_screen');
            },
          ),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Danh sách lô',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10 * SizeConfig.ratioHeight,
              ),
              //  ListTile()
              Text(
                overflow: TextOverflow.ellipsis,
                "Danh sách các lô hàng",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25 * SizeConfig.ratioFont,
                  color: Colors.black,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     onChanged: ((value) {}),
              //     controller: TextEditingController(),
              //     decoration: const InputDecoration(
              //         labelText: "Search",
              //         hintText: "Search",
              //         prefixIcon: Icon(Icons.search),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              //   ),
              // ),
              BlocConsumer<ExportingReceiptLotBloc, UncompletedReceiptLotState>(
                listener: (context, state) {
                  if (state is ConfirmReceiptLotChangedFailState) {
                    AlertDialogOneBtnCustomized(
                            context,
                            'Thất bại',
                            'Không thể hoàn thành việc tạo đơn',
                            'Trở lại',
                            'Fail_image.png', () {
                      // Navigator.pushNamed(context, '/main_receipt_screen');
                    }, 20, 15, () {}, false)
                        .show();
                  }
                  if (state is ConfirmReceiptLotChangedSuccessState) {
                    AlertDialogOneBtnCustomized(
                            context,
                            'Thành công',
                            'Đã hoàn thành việc tạo đơn',
                            'Tiếp tục',
                            'Success_image.png', () {
                      Navigator.pushNamed(context, '/main_receipt_screen');
                    }, 20, 15, () {}, false)
                        .show();
                  }
                },
                builder: (context, state) {
                  if (state is UpdateReceiptLotSuccessState) {
                    return Column(
                      children: [
                        SizedBox(
                            height: 470 * SizeConfig.ratioHeight,
                            child: ListView.builder(
                                itemCount: state.goodsReceipt.lots.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        // leading: const Icon(Icons.list),
                                        // shape: RoundedRectangleBorder(
                                        //   side: BorderSide(width: 1),
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                        trailing: Icon(Icons.edit,
                                            size: 15 * SizeConfig.ratioFont),
                                        title: Text(
                                            "Mã lô : ${state.goodsReceipt.lots[index].goodsReceiptLotId}"),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150 * SizeConfig.ratioWidth,
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
                                                      "Mã SP: ${state.goodsReceipt.lots[index].item!.itemId}"),
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
                                                      "Số lượng: ${state.goodsReceipt.lots[index].quantity}"),
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
                                                      "Vị trí: ${state.goodsReceipt.lots[index].location ?? '...'}"),
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
                                                      "NSX: ${state.goodsReceipt.lots[index].productionDate ?? '...'}"),
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
                                                      "Tên SP: ${state.goodsReceipt.lots[index].item!.itemName}"),
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
                                                      "Định mức: ${state.goodsReceipt.lots[index].sublotSize ?? '...'}  "),
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
                                                      "Số PO: ${state.goodsReceipt.lots[index].purchaseOrderNumber ?? '...'}"),
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
                                                      "HSD: ${state.goodsReceipt.lots[index].expirationDate ?? '...'}"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        isThreeLine: true,
                                        onTap: () {
                                          BlocProvider.of<FillReceiptLotBloc>(
                                                  context)
                                              .add(RefillReceiptLotEvent(
                                                  DateTime.now(),
                                                  state.goodsReceipt,
                                                  index));
                                          Navigator.pushNamed(
                                            context,
                                            '/update_lot_receipt_screen',
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                })),
                        CustomizedButton(
                            text: "Xác nhận",
                            onPressed: () {
                              BlocProvider.of<ExportingReceiptLotBloc>(context)
                                  .add(PostReceiptChangedEvent(
                                      DateTime.now(), state.goodsReceipt));
                              // Navigator.pushNamed(
                              //     context, '/importing_receipt_lot_screen');
                            }),
                        CustomizedButton(
                            text: "Trở lại",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/importing_receipt_screen');
                            })
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
