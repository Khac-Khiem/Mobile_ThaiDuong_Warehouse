import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../constant.dart';
import '../../bloc/blocs/inventory_bloc.dart';
import '../../bloc/states/inventory_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';

class StockcardScreen extends StatefulWidget {
  StockcardScreen({super.key});

  @override
  State<StockcardScreen> createState() => _StockcardScreenState();
}

class _StockcardScreenState extends State<StockcardScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
// class MaterialStockcardScreen extends StatelessWidget {
//   const MaterialStockcardScreen({super.key});
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
          'Tồn kho NVL',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            overflow: TextOverflow.ellipsis,
            "Chọn kho hàng",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20 * SizeConfig.ratioFont,
              color: Colors.black,
            ),
          ),
          BlocConsumer<InventoryBloc, InventoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetWarehouseIdSuccessState) {
                  return DropdownButton<Item>(
                    hint: Text("Chọn mã sản phẩm"),
                    value: selectedItem,
                    onChanged: (Item? newValue) {
                      setState(() {
                        selectedItem = newValue;
                        print(state.item.indexOf(selectedItem as Item));
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
                // DropdownSearchButton(
                //   buttonName: "Chọn kho hàng",
                //   height: 60, width: 200,
                //   listItem: ["a"],
                //   reference: expiredDay,
                //   onChanged: (){})
              }),
        ]),
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
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllItemByWarehouseSuccessState) {
                    return DropdownButton<Item>(
                      hint: Text("Chọn mã sản phẩm"),
                      value: selectedItem,
                      onChanged: (Item? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          print(state.item.indexOf(selectedItem as Item));
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
            //   buttonName: "Chọn mã sp",
            //   height: 60, width: 200,
            //   listItem: ["a"],
            //   reference: expiredDay,
            //   onChanged: (){})
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
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllItemByWarehouseSuccessState) {
                    return DropdownButton<Item>(
                      hint: Text("Chọn tên sản phẩm"),
                      value: selectedItem,
                      onChanged: (Item? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          print(state.item.indexOf(selectedItem as Item));
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
            //   buttonName: "Chọn tên sp",
            //   height: 60, width: 200,
            //   listItem: ["a"],
            //   reference: expiredDay,
            //   onChanged: (){})
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: 5 * SizeConfig.ratioHeight),
              width: 160 * SizeConfig.ratioWidth,
              height: 60 * SizeConfig.ratioHeight,
              padding:
                  EdgeInsets.symmetric(vertical: 5 * SizeConfig.ratioHeight),
              decoration: BoxDecoration(
                  color: Constants.buttonColor,
                  border: Border.all(width: 1, color: Constants.buttonColor),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
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
              margin:
                  EdgeInsets.symmetric(vertical: 5 * SizeConfig.ratioHeight),
              width: 160 * SizeConfig.ratioWidth,
              height: 60 * SizeConfig.ratioHeight,
              padding:
                  EdgeInsets.symmetric(vertical: 5 * SizeConfig.ratioHeight),
              decoration: BoxDecoration(
                  color: Constants.buttonColor,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
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
        CustomizedButton(
            text: "Truy xuất",
            onPressed: () {
              BlocBuilder<InventoryBloc, InventoryState>(
                  builder: (context, state) {
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
                  return const Center(child: CircularProgressIndicator());
                }
              });
            })
      ]),
    );
  }
}
