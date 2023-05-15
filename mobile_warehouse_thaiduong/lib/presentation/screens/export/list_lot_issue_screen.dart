import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/list_lot_issue_event.dart';

import '../../bloc/blocs/issue_bloc/list_lot_issue_uncompleted_bloc.dart';
import '../../bloc/states/issue_state/list_lot_issue_state.dart';
import '../../dialog/dialog_one_button.dart';
import '../../widgets/button_widget.dart';

class ListLotIssueScreen extends StatefulWidget {
  const ListLotIssueScreen({super.key});

  @override
  State<ListLotIssueScreen> createState() => _ListLotIssueScreenState();
}

class _ListLotIssueScreenState extends State<ListLotIssueScreen> {
  String note = '';
  double quantity = 0;
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.west, //mũi tên back
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/list_goods_issue_screen');
              },
            ),
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Constants.secondaryColor),
              indicatorColor: Colors.black,
              tabs: const [
                Tab(
                  //icon: Icon(Icons.flight),
                  text: 'DS đề xuất',
                ),
                Tab(
                  // icon: Icon(Icons.directions_transit),
                  text: 'DS dự kiến',
                ),
              ],
            ),
            backgroundColor: Constants.mainColor,
            title: Text(
              'Danh sách hàng hóa',
              style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
            ),
          ),
          body: TabBarView(children: [
            BlocConsumer<ListGoodsIssueLotUncompletedBloc, GoodsIssueLotState>(
                listener: (context, state) {
              //     if(state is PostIssueLotsSuccessState){
              //         AlertDialogOneBtnCustomized(context, 'Thành công',
              //         'Đã hoàn thành việc xuất lô', 'Tiếp tục', () {
              //   Navigator.pushNamed(context, '/export_main_screen');
              // }, 20, 15, () {}, false)
              //     .show();
              //     }
            }, builder: (context, state) {
              if (state is LoadGoodsIssueLotsSuccessState) {
                return SingleChildScrollView(
                  child: ExpansionPanelList.radio(
                    children: state.lotsSuggest
                        .map((e) => ExpansionPanelRadio(
                            canTapOnHeader: true,
                            value: e.lotId.toString(),
                            headerBuilder: ((context, isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  leading: const Icon(Icons.list),
                                  isThreeLine: true,
                                  title: Text("Mã lô : ${e.lotId}"),
                                  subtitle: Text(
                                      "Sản phẩm : ${e.item!.itemId.toString()} \nVị trí : ${e.location.toString()} \nSố lượng : ${e.quantity.toString()} \nSố PO : ${e.purchaseOrderNumber.toString()}"),
                                  onTap: () {},
                                ),
                              );
                            }),
                            body: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5 * SizeConfig.ratioHeight),
                                  alignment: Alignment.centerRight,
                                  width: 300 * SizeConfig.ratioWidth,
                                  height: 60 * SizeConfig.ratioHeight,
                                  //color: Colors.grey[200],
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // filled: true,
                                        // fillColor: Constants.buttonColor,
                                        labelText:
                                            "Nhập số lượng định cần xuất"),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]')),
                                    ],
                                    onChanged: (value) => setState(() {
                                      value == e.quantity.toString()
                                          ? {note = "Xuất cả lô"}
                                          : {note = "Xuất một phần"};
                                      value != ''
                                          ? quantity = double.parse(value)
                                          : quantity = double.parse('0');
                                    }),
                                    onSubmitted: (value) => value != ''
                                        ? quantity = double.parse(value)
                                        : quantity = double.parse('0'),
                                  ),
                                ),
                                Container(
                                  width: 300 * SizeConfig.ratioWidth,
                                  height: 60 * SizeConfig.ratioHeight,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5 * SizeConfig.ratioHeight),
                                  child: TextField(
                                    controller: TextEditingController(text: note),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // filled: true,
                                        // fillColor: Constants.buttonColor,
                                        labelText: "Ghi chú"),
                                    onChanged: (value) => note = value,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (e.quantity! < quantity) {
                                        AlertDialogOneBtnCustomized(
                                                context,
                                                'Không hợp lệ',
                                                'Số lượng nhập không phù hợp',
                                                'Trở lại',
                                                'warning_image.png', () {
                                          // Navigator.pushNamed(context, '/main_receipt_screen');
                                        }, 15, 20, () {}, false)
                                            .show();
                                      } else {
                                        e.quantity == quantity
                                            ? {
                                                BlocProvider.of<
                                                            ListGoodsIssueLotUncompletedBloc>(
                                                        context)
                                                    .add(AddGoodsIssueLotEvent(
                                                        DateTime.now(),
                                                        true,
                                                        state.itemId,
                                                        state.goodsIssueId,
                                                        GoodsIssueLot(
                                                            e.lotId,
                                                            quantity,
                                                            double.tryParse(e
                                                                .sublotSize
                                                                .toString()),
                                                            null,
                                                            note),
                                                        state.lotsSuggest,
                                                        state.lotsExpected)),
                                                DefaultTabController.of(context)
                                                    ?.animateTo(1)
                                              }
                                            : {
                                                BlocProvider.of<
                                                            ListGoodsIssueLotUncompletedBloc>(
                                                        context)
                                                    .add(AddGoodsIssueLotEvent(
                                                        DateTime.now(),
                                                        false,
                                                        state.itemId,
                                                        state.goodsIssueId,
                                                        GoodsIssueLot(
                                                            e.lotId,
                                                            quantity,
                                                            double.tryParse(e
                                                                .sublotSize
                                                                .toString()),
                                                            null,
                                                            note),
                                                        state.lotsSuggest,
                                                        state.lotsExpected)),
                                                DefaultTabController.of(context)
                                                    ?.animateTo(1)
                                              };
                                      }
                                    },
                                    child: const Text('Xác nhận'))
                              ],
                            )))
                        .toList(),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            BlocConsumer<ListGoodsIssueLotUncompletedBloc, GoodsIssueLotState>(
                listener: (context, state) {
              if (state is PostIssueLotsSuccessState) {
                AlertDialogOneBtnCustomized(context, 'Thành công', 'Đã xuất lô',
                        'Tiếp tục', 'Success_image.png', () {
                  Navigator.pushNamed(context, '/export_main_screen');
                }, 20, 15, () {}, false)
                    .show();
              }
              if (state is PostGoodsIssueLotsFailState) {
                AlertDialogOneBtnCustomized(context, 'Thất bại',
                        'Không thể xuất lô', 'Tiếp tục', 'Fail_image.png', () {
                  Navigator.pushNamed(context, '/export_main_screen');
                }, 20, 15, () {}, false)
                    .show();
              }
            }, builder: (context, state) {
              if (state is LoadGoodsIssueLotsSuccessState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 400 * SizeConfig.ratioHeight,
                      child: ListView.builder(
                          itemCount: state.lotsExpected.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                leading: const Icon(Icons.list),
                                isThreeLine: true,
                                title: Text(
                                    "Mã lô : ${state.lotsExpected[index].goodsIssueLotId}"),
                                subtitle: Text(
                                    "Sản phẩm : ${state.itemId} \nSố lượng : ${state.lotsExpected[index].quantity} \nĐịnh mức : ${state.lotsExpected[index].sublotSize.toString()}"),
                                onTap: () {},
                              ),
                            );
                            // LotDetailComponent(
                            //     itemId: state.lotsExpected[index].goodsIssueLotId
                            //         .toString(),
                            //     location: '',
                            //     enableEdit: false,
                            //     lotid: '220123_NCC',
                            //     numberPO: '264836',
                            //     unit: 'cái',
                            //     quantity: state.lotsExpected[index].quantity,
                            //     sublotSize: 10,
                            //     onPressed: () {});
                          }),
                    ),
                    CustomizedButton(
                        text: "Xác nhận",
                        onPressed: () {
                          BlocProvider.of<ListGoodsIssueLotUncompletedBloc>(
                                  context)
                              .add(PostGoodsIssueLotEvent(
                                  DateTime.now(),
                                  state.itemId,
                                  state.goodsIssueId,
                                  state.lotsExpected));
                          // Navigator.pushNamed(
                          //   context,
                          //   '/fill_info_entry_screen',
                          // );
                        })
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ])),
    );
  }
}
