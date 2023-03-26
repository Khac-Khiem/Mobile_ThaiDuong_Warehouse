import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/inventory_bloc.dart';
import '../../bloc/states/inventory_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';

class ProductStockcardScreen extends StatefulWidget {
  ProductStockcardScreen({super.key});

  @override
  State<ProductStockcardScreen> createState() => _ProductStockcardScreenState();
}

class _ProductStockcardScreenState extends State<ProductStockcardScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
// class ProductStockcardScreen extends StatelessWidget {
//   const ProductStockcardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String expiredDay = '';
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
          'Tồn kho thành phẩm',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      
      body: Column(children: [
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
                  })
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
            ],
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5 * SizeConfig.ratioHeight),
                    width: 160 * SizeConfig.ratioWidth,
                    height: 70 * SizeConfig.ratioHeight,
                    padding: EdgeInsets.symmetric(
                        vertical: 5 * SizeConfig.ratioHeight),
                    decoration: BoxDecoration(
                        color: Constants.buttonColor,
                        border: Border.all(width: 1, color: Constants.buttonColor),
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
                    height: 70 * SizeConfig.ratioHeight,
                    padding: EdgeInsets.symmetric(
                        vertical: 5 * SizeConfig.ratioHeight),
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
         CustomizedButton(text: "Truy xuất" ,onPressed: (){})
      ]),
    );
  }
}