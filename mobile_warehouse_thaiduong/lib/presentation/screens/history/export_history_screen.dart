import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/history_bloc.dart';
import '../../bloc/states/history_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';
import '../../widgets/dropdown_search_button.dart';

class ExportHistoryScreen extends StatefulWidget {
  ExportHistoryScreen({super.key});

  @override
  State<ExportHistoryScreen> createState() => _ExportHistoryScreenSate();
}

class _ExportHistoryScreenSate extends State<ExportHistoryScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  String warehouse = '';
  List<Department> departmentsDropdownData = [];
  Department? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateFormat('yyyy-MM-dd')
        .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/history_function_screen');
            },
          ),
          title: Text(
            'Lịch sử xuất kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: BlocConsumer<HistoryBloc, HistoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetAllInfoExportSuccessState) {
                return Column(children: [
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
                        DropdownSearchButton(
                            buttonName: "Chọn loại kho hàng",
                            height: 60,
                            width: 200,
                            listItem: state.warehouse,
                            reference: warehouse,
                            onChanged: () {})
                      ]),
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
                        DropdownButton<Department>(
                          hint: Text("Chọn mã sản phẩm"),
                          value: selectedDepartment,
                          onChanged: (Department? newValue) {
                            setState(() {
                              selectedDepartment = newValue;
                              print(state.department
                                  .indexOf(selectedDepartment as Department));
                            });
                          },
                          items: state.department.map((Department department) {
                            return DropdownMenuItem<Department>(
                              value: department,
                              child: Text(
                                department.name.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                  BlocConsumer<HistoryBloc, HistoryState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetAllInfoExportSuccessState) {
                          return Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  DropdownButton<Item>(
                                    hint: Text("Chọn mã sản phẩm"),
                                    value: selectedItem,
                                    onChanged: (Item? newValue) {
                                      setState(() {
                                        selectedItem = newValue;
                                        print(state.item
                                            .indexOf(selectedItem as Item));
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
                                  )
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  DropdownButton<Item>(
                                    hint: Text("Chọn tên sản phẩm"),
                                    value: selectedItem,
                                    onChanged: (Item? newValue) {
                                      setState(() {
                                        selectedItem = newValue;
                                        print(state.item
                                            .indexOf(selectedItem as Item));
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
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5 * SizeConfig.ratioHeight),
                                  width: 160 * SizeConfig.ratioWidth,
                                  height: 60 * SizeConfig.ratioHeight,
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
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 150, 10, 10),
                              child: CustomizedButton(
                                  text: "Truy xuất", onPressed: () {}),
                            ),
                          ]);
                        }
                        if (state is AccessExportHistorySuccessState) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                const Divider(
                                  indent: 30,
                                  endIndent: 30,
                                  color: Constants.mainColor,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 470 * SizeConfig.ratioHeight,
                                  child: ListView.builder(
                                      itemCount: state.goodsIssueLot.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            width: 350 * SizeConfig.ratioWidth,
                                            height: 80 * SizeConfig.ratioHeight,
                                            color: Constants.buttonColor,
                                          ),
                                        );
                                      }),
                                ),
                                // CustomizedButton(text: "Truy xuất", onPressed: () {})
                              ],
                            ),
                          );
                        } else {
                          print(state);
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })
                ]);
              } else {
                print(state);
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
