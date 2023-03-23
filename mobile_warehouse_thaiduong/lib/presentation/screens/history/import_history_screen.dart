import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../../domain/entities/department.dart';
import '../../bloc/blocs/history_bloc.dart';
import '../../bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
import '../../bloc/states/history_states.dart';
import '../../bloc/states/receipt_state/fill_info_receipt_lot_state.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';

class ImportHistoryScreen extends StatefulWidget {
  ImportHistoryScreen({super.key});

  @override
  State<ImportHistoryScreen> createState() => _ImportHistoryScreenState();
}

class _ImportHistoryScreenState extends State<ImportHistoryScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  List<Department> departmentDropdownData = [];
  Department? selectedDepartment;

// class ImportHistoryScreen extends StatelessWidget {
//   const ImportHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String expiredDay = '';
    DateTime date = DateFormat('yyyy-MM-dd')
        .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Lịch sử nhập kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: BlocConsumer<FillReceiptLotBloc, FillInfoReceiptLotState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadItemDataSuccessState) {
            return SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Kho hàng",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    BlocConsumer<HistoryBloc, HistoryState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is GetAllInfoImportSuccessState) {
                            return DropdownButton<Item>(
                              hint: Text("Chọn kho hàng"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(
                                      state.item.indexOf(selectedItem as Item));
                                });
                              },
                              items: state.item.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.itemClass.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),

                    // DropdownSearchButton(
                    //     buttonName: "Chọn mã sp",
                    //     height: 60,
                    //     width: 200,
                    //     listItem: ["a"],
                    //     reference: expiredDay,
                    //     onChanged: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Bộ phận",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    BlocConsumer<HistoryBloc, HistoryState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is GetAllInfoImportSuccessState) {
                            return DropdownButton<Department>(
                              hint: Text("Chọn bộ phận"),
                              value: selectedDepartment,
                              onChanged: (Department? newValue) {
                                setState(() {
                                  selectedDepartment = newValue;
                                  print(state.department.indexOf(
                                      selectedDepartment as Department));
                                });
                              },
                              items:
                                  state.department.map((Department department) {
                                return DropdownMenuItem<Department>(
                                  value: department,
                                  child: Text(
                                    department.name.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),

                    // DropdownSearchButton(
                    //     buttonName: "Chọn mã sp",
                    //     height: 60,
                    //     width: 200,
                    //     listItem: ["a"],
                    //     reference: expiredDay,
                    //     onChanged: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Mã SP",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    BlocConsumer<HistoryBloc, HistoryState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is GetAllInfoImportSuccessState) {
                            return DropdownButton<Item>(
                              hint: Text("Chọn mã sản phẩm"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(
                                      state.item.indexOf(selectedItem as Item));
                                });
                              },
                              items: state.item.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.itemId.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),

                    // DropdownSearchButton(
                    //     buttonName: "Chọn mã sp",
                    //     height: 60,
                    //     width: 200,
                    //     listItem: ["a"],
                    //     reference: expiredDay,
                    //     onChanged: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Tên SP",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    BlocConsumer<HistoryBloc, HistoryState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is GetAllInfoImportSuccessState) {
                            return DropdownButton<Item>(
                              hint: Text("Chọn tên sản phẩm"),
                              value: selectedItem,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedItem = newValue;
                                  print(
                                      state.item.indexOf(selectedItem as Item));
                                });
                              },
                              items: state.item.map((Item item) {
                                return DropdownMenuItem<Item>(
                                  value: item,
                                  child: Text(
                                    item.itemName.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    // DropdownSearchButton(
                    //     buttonName: "Chọn tên sp",
                    //     height: 60,
                    //     width: 200,
                    //     listItem: ["a"],
                    //     reference: expiredDay,
                    //     onChanged: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 5 * SizeConfig.ratioHeight),
                      width: 160 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      // padding: EdgeInsets.symmetric(
                      //     vertical: 5 * SizeConfig.ratioHeight),
                      decoration: BoxDecoration(
                          color: Constants.buttonColor,
                          border: Border.all(
                              width: 1, color: Constants.buttonColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: CustomizeDatePicker(
                        name: "Từ ngày",
                        fontColor: Colors.black,
                        fontWeight: FontWeight.normal,
                        initDateTime: date,
                        okBtnClickedFunction: (pickedTime) {
                          date = pickedTime;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 5 * SizeConfig.ratioHeight),
                      width: 160 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      // padding: EdgeInsets.symmetric(
                      //     vertical: 5 * SizeConfig.ratioHeight),
                      decoration: BoxDecoration(
                          color: Constants.buttonColor,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: CustomizeDatePicker(
                        name: "Đến ngày",
                        fontColor: Colors.black,
                        fontWeight: FontWeight.normal,
                        initDateTime: date,
                        okBtnClickedFunction: (pickedTime) {
                          date = pickedTime;
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                  color: Constants.mainColor,
                  thickness: 1,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Danh sách các lô hàng",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20 * SizeConfig.ratioFont,
                    color: Colors.black,
                  ),
                ),
                CustomizedButton(text: "Truy xuất", onPressed: () {})
              ]),
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
