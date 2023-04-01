// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
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
  const ExportHistoryScreen({super.key});

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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150 * SizeConfig.ratioWidth,
                          height: 60 * SizeConfig.ratioHeight,
                          child: DropdownSearch<String?>(
                            mode: Mode.MENU,
                            items: state.warehouse,
                            showSearchBox: true,
                            label: "Kho hàng",

                            // onChanged: (value) {
                            //   //  print(value);
                            //   setState(() {
                            //     selectedItemClass = state.itemClass.firstWhere(
                            //         (element) => element.itemClassId == value);
                            //   });
                            // },
                            // selectedItem: selectedWarehouse == null
                            //     ? ''
                            //     : selectedWarehouse!.warehouse,
                          ),
                        ),
                  

             
                    SizedBox(
                      width: 150 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: state.department.map((e) => e.name).toList(),
                        showSearchBox: true,
                        label: "Bộ phận",
                        onChanged: (value) {
                          //  print(value);
                          setState(() {
                            selectedDepartment = state.department
                                .firstWhere((element) => element.name == value);
                          });
                        },
                     
                      ),
                    ),
                    //],
                    //     ),
                    //   ),
                    ]),
                  ),
                  BlocConsumer<HistoryBloc, HistoryState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetAllInfoExportSuccessState) {
                          return Column(children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                               
                                  SizedBox(
                                    width: 340 * SizeConfig.ratioWidth,
                                    height: 60 * SizeConfig.ratioHeight,
                                    child: DropdownSearch<String>(
                                      mode: Mode.MENU,
                                      items: state.item
                                          .map((e) => e.itemId)
                                          .toList(),
                                      showSearchBox: true,
                                      label: "Mã sản phẩm",
                                      // hint: "country in menu mode",
                                      onChanged: (value) {
                                        //  print(value);
                                        setState(() {
                                          selectedItem = state.item.firstWhere(
                                              (element) =>
                                                  element.itemId == value);
                                        });
                                      },
                                      selectedItem: selectedItem == null
                                          ? ''
                                          : selectedItem!.itemId,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 340 * SizeConfig.ratioWidth,
                                    height: 60 * SizeConfig.ratioHeight,
                                    child: DropdownSearch<String>(
                                      mode: Mode.MENU,
                                      items: state.item
                                          .map((e) => e.itemName)
                                          .toList(),
                                      showSearchBox: true,
                                      label: "Tên sản phẩm",
                                      // hint: "country in menu mode",
                                      onChanged: (value) {
                                        //  print(value);
                                        setState(() {
                                          selectedItem = state.item.firstWhere(
                                              (element) =>
                                                  element.itemName == value);
                                        });
                                      },
                                    
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0,0),
                              child: Row(
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
