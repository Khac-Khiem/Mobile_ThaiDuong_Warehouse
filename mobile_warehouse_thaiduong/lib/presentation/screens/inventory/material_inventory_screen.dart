// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../bloc/blocs/inventory_bloc.dart';
import '../../bloc/events/inventory_events.dart';
import '../../bloc/states/inventory_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';

class MaterialStockcardScreen extends StatefulWidget {
  const MaterialStockcardScreen({super.key});

  @override
  State<MaterialStockcardScreen> createState() =>
      _MaterialStockcardScreenState();
}

class _MaterialStockcardScreenState extends State<MaterialStockcardScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  List<ItemClass> itemClassDropdownData = [];
  ItemClass? selectedItemClass;

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
              Navigator.pushNamed(context, '/stockcard_function_screen');
            },
          ),
          title: Text(
            'Tồn kho nguyên vật liệu',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(
          children: [
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetWarehouseIdSuccessState) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: SizedBox(
                          width: 340 * SizeConfig.ratioWidth,
                          height: 60 * SizeConfig.ratioHeight,
                          child: DropdownSearch<String?>(
                            mode: Mode.MENU,
                            items: state.itemClass
                                .map((e) => e.itemClassId)
                                .toList(),
                            showSearchBox: true,
                            label: "Kho hàng",
                            // hint: "country in menu mode",
                            onChanged: (value) {
                              //  print(value);
                              setState(() {
                                selectedItemClass = state.itemClass.firstWhere(
                                    (element) => element.itemClassId == value);
                              });
                            },
                            selectedItem: selectedItemClass == null
                                ? ''
                                : selectedItemClass!.itemClassId,
                          ),
                        ),
                      ),
                    ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllItemByWarehouseSuccessState) {
                    return Column(children: [
                      SizedBox(
                        width: 340 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: state.item.map((e) => e.itemId).toList(),
                          showSearchBox: true,
                          label: "Mã sản phẩm",
                          // hint: "country in menu mode",
                          onChanged: (value) {
                            //  print(value);
                            setState(() {
                              selectedItem = state.item.firstWhere(
                                  (element) => element.itemId == value);
                            });
                          },
                          selectedItem:
                              selectedItem == null ? '' : selectedItem!.itemId,
                        ),
                      ),
                      SizedBox(
                        width: 340 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: state.item.map((e) => e.itemName).toList(),
                          showSearchBox: true,
                          label: "Tên sản phẩm",
                          // hint: "country in menu mode",
                          onChanged: (value) {
                            //  print(value);
                            setState(() {
                              selectedItem = state.item.firstWhere(
                                  (element) => element.itemName == value);
                            });
                          },
                          selectedItem: selectedItem == null
                              ? ''
                              : selectedItem!.itemName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          padding: EdgeInsets.fromLTRB(10, 300, 10, 10),
                          child: CustomizedButton(
                              text: "Truy xuất",
                              onPressed: () {
                                BlocProvider.of<InventoryBloc>(context).add(
                                    LoadInventoryEvent(
                                        DateTime.now(),
                                        selectedItem!.itemId,
                                        DateTime.now(),
                                        DateTime.now()));
                              })),
                    ]);
                  }
                  if (state is LoadInventorySuccessState) {
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
                                itemCount: state.itemLots.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 350 * SizeConfig.ratioWidth,
                                      height: 70 * SizeConfig.ratioHeight,
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
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
  }
}
