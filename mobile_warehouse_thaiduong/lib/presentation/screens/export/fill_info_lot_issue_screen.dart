import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/fill_info_issue_enry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/fill_info_lot_issue_state.dart';

import '../../../domain/entities/item.dart';

class FillInfoEntryIssueScreen extends StatefulWidget {
  const FillInfoEntryIssueScreen({super.key});

  @override
  State<FillInfoEntryIssueScreen> createState() =>
      _FillInfoEntryIssueScreenState();
}

class _FillInfoEntryIssueScreenState extends State<FillInfoEntryIssueScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  double sublotSize = 0, quantity = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Nhập kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: BlocConsumer<FillInfoIssueEntryBloc, FillInfoIssueEntryState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is LoadItemDataSuccessState) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Thông tin hàng hóa cần xuất",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10 * SizeConfig.ratioHeight,
                    ),
                    Container(
                        height: 500 * SizeConfig.ratioHeight,
                        child: Column(
                          children: [
                            DropdownButton<Item>(
                              hint: Text("Select a user"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(state.items
                                      .indexOf(selectedItem as Item));
                                });
                              },
                              items: state.items.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.itemId,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                            DropdownButton<Item>(
                              hint: Text("Select a user"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(state.items
                                      .indexOf(selectedItem as Item));
                                });
                              },
                              items: state.items.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.itemName,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                            DropdownButton<Item>(
                              hint: Text("Select a user"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(state.items
                                      .indexOf(selectedItem as Item));
                                });
                              },
                              items: state.items.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.unit.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5 * SizeConfig.ratioHeight),
                                  alignment: Alignment.centerRight,
                                  width: 160 * SizeConfig.ratioWidth,
                                  height: 55 * SizeConfig.ratioHeight,
                                  //color: Colors.grey[200],
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Constants.buttonColor,
                                        labelText:
                                            "Nhập số lượng định mức của thùng hàng"),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]')),
                                    ],
                                    onChanged: (value) =>
                                        sublotSize = double.parse(value),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5 * SizeConfig.ratioHeight),
                                  alignment: Alignment.centerRight,
                                  width: 160 * SizeConfig.ratioWidth,
                                  height: 55 * SizeConfig.ratioHeight,
                                  //color: Colors.grey[200],
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Constants.buttonColor,
                                        labelText:
                                            "Nhập tổng lượng của lô hàng"),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]')),
                                    ],
                                    onChanged: (value) =>
                                        sublotSize = double.parse(value),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                    //   CustomizedButton(
                    //       text: "Tiếp tục",
                    //       onPressed: () {
                    //          BlocProvider.of<CreateIssueBloc>(context)
                    //     .add(AddIssueEntryEvent(DateTime.now()));
                    // Navigator.pushNamed(context, '/create_issue_screen');
                    //         // Navigator.push(
                    //         //   context,
                    //         //   MaterialPageRoute(
                    //         //       builder: (context) =>
                    //         //           const CreateNewIssueScreen()),
                    //         // );
                    //       })
                    state.index == -1
                        ? ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<CreateIssueBloc>(context).add(
                                  AddIssueEntryEvent(
                                      IssueEntryView('haha', 100, 10, 'cái'),
                                      state.entries,
                                      DateTime.now()));
                              Navigator.pushNamed(
                                  context, '/create_receipt_screen');
                              //Navigator.of(context).pop();
                            },
                            child: Text('Tạo mới'),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<CreateIssueBloc>(context).add(
                                  UpdateIssueEntryEvent(
                                      IssueEntryView('haha', 100, 10, 'cái'),
                                      state.entries,
                                      state.index,
                                      DateTime.now()));
                              Navigator.pushNamed(
                                  context, '/create_receipt_screen');
                              //Navigator.of(context).pop();
                            },
                            child: Text('Cập nhật'),
                          )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
