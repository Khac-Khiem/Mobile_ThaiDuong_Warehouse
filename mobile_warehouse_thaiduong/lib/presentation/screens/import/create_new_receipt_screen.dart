import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/create_new_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/create_new_receipt_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/fill_info_receipt_lot_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/create_new_receipt_state.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/exception_widget.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/text_input_widget.dart';

class CreateNewReceiptScreen extends StatefulWidget {
  const CreateNewReceiptScreen({super.key});

  @override
  State<CreateNewReceiptScreen> createState() => _CreateNewReceiptScreenState();
}

class _CreateNewReceiptScreenState extends State<CreateNewReceiptScreen> {
  // search button
  TextEditingController controller = TextEditingController();
  List<ItemLotView> lots = [];
  String receiptId = '';
  // double sublotSize = 0, quantity = 0;
  // DateTime date = DateFormat('yyyy-MM-dd')
  //   .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  // void _showForm(String id, List<Item> itemsDropdownData) async {
  //   showModalBottomSheet(
  //       context: context,
  //       elevation: 5,
  //       isScrollControlled: true,
  //       builder: (_) => StatefulBuilder(
  //               builder: (BuildContext context, StateSetter setState) {
  //             return SingleChildScrollView(
  //               child: Container(
  //                 // height: 300*SizeConfig.ratioHeight,
  //                 alignment: Alignment.center,
  //                 padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     BarcodeinputWidget(
  //                       textController: lotId,
  //                       textLabel: "Mã lô",
  //                     ),
  //                     DropdownButton<Item>(
  //                       hint: Text("Select a user"),
  //                       value: selectedItem,
  //                       onChanged: (Item? newValue) {
  //                         setState(() {
  //                           selectedItem = newValue;
  //                           print(itemsDropdownData
  //                               .indexOf(selectedItem as Item));
  //                         });
  //                       },
  //                       items: itemsDropdownData.map((Item item) {
  //                         return DropdownMenuItem<Item>(
  //                           value: item,
  //                           child: Text(
  //                             item.itemId,
  //                             style: TextStyle(color: Colors.black),
  //                           ),
  //                         );
  //                       }).toList(),
  //                     ),
  //                     DropdownButton<Item>(
  //                       hint: Text("Select a user"),
  //                       value: selectedItem,
  //                       onChanged: (Item? newValue) {
  //                         setState(() {
  //                           selectedItem = newValue;
  //                           print(itemsDropdownData
  //                               .indexOf(selectedItem as Item));
  //                         });
  //                       },
  //                       items: itemsDropdownData.map((Item item) {
  //                         return DropdownMenuItem<Item>(
  //                           value: item,
  //                           child: Text(
  //                             item.itemName,
  //                             style: TextStyle(color: Colors.black),
  //                           ),
  //                         );
  //                       }).toList(),
  //                     ),
  //                     DropdownButton<Item>(
  //                       hint: Text("Select a user"),
  //                       value: selectedItem,
  //                       onChanged: (Item? newValue) {
  //                         setState(() {
  //                           selectedItem = newValue;
  //                           print(itemsDropdownData
  //                               .indexOf(selectedItem as Item));
  //                         });
  //                       },
  //                       items: itemsDropdownData.map((Item item) {
  //                         return DropdownMenuItem<Item>(
  //                           value: item,
  //                           child: Text(
  //                             item.unit.toString(),
  //                             style: TextStyle(color: Colors.black),
  //                           ),
  //                         );
  //                       }).toList(),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Container(
  //                           padding: EdgeInsets.symmetric(
  //                               vertical: 5 * SizeConfig.ratioHeight),
  //                           alignment: Alignment.centerRight,
  //                           width: 160 * SizeConfig.ratioWidth,
  //                           height: 55 * SizeConfig.ratioHeight,
  //                           //color: Colors.grey[200],
  //                           child: TextField(
  //                             decoration: const InputDecoration(
  //                                 filled: true,
  //                                 fillColor: Constants.buttonColor,
  //                                 labelText:
  //                                     "Nhập số lượng định mức của thùng hàng"),
  //                             keyboardType:
  //                                 const TextInputType.numberWithOptions(
  //                                     decimal: true),
  //                             inputFormatters: [
  //                               FilteringTextInputFormatter.allow(
  //                                   RegExp('[0-9.,]')),
  //                             ],
  //                             onChanged: (value) =>
  //                                 sublotSize = double.parse(value),
  //                           ),
  //                         ),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(
  //                               vertical: 5 * SizeConfig.ratioHeight),
  //                           alignment: Alignment.centerRight,
  //                           width: 160 * SizeConfig.ratioWidth,
  //                           height: 55 * SizeConfig.ratioHeight,
  //                           //color: Colors.grey[200],
  //                           child: TextField(
  //                             decoration: const InputDecoration(
  //                                 filled: true,
  //                                 fillColor: Constants.buttonColor,
  //                                 labelText: "Nhập tổng lượng của lô hàng"),
  //                             keyboardType:
  //                                 const TextInputType.numberWithOptions(
  //                                     decimal: true),
  //                             inputFormatters: [
  //                               FilteringTextInputFormatter.allow(
  //                                   RegExp('[0-9.,]')),
  //                             ],
  //                             onChanged: (value) =>
  //                                 sublotSize = double.parse(value),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     // DropdownSearchButton(
  //                     //     buttonName: "Đơn vị tính",
  //                     //     height: 60,
  //                     //     width: 350,
  //                     //     listItem: const ["a", "b"],
  //                     //     reference: itemId,
  //                     //     onChanged: (() {
  //                     //       setState(() {});
  //                     //     })),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Container(
  //                           margin: EdgeInsets.symmetric(
  //                               vertical: 5 * SizeConfig.ratioHeight),
  //                           width: 160 * SizeConfig.ratioWidth,
  //                           height: 60 * SizeConfig.ratioHeight,
  //                           // padding: EdgeInsets.symmetric(
  //                           //     vertical: 5 * SizeConfig.ratioHeight),
  //                           decoration: BoxDecoration(
  //                               color: Constants.buttonColor,
  //                               border: Border.all(
  //                                   width: 1, color: Constants.buttonColor),
  //                               borderRadius:
  //                                   const BorderRadius.all(Radius.circular(5))),
  //                           child: CustomizeDatePicker(
  //                             name: "NSX",
  //                             fontColor: Colors.black,
  //                             fontWeight: FontWeight.normal,
  //                             initDateTime: date,
  //                             okBtnClickedFunction: (pickedTime) {
  //                               date = pickedTime;
  //                             },
  //                           ),
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.symmetric(
  //                               vertical: 5 * SizeConfig.ratioHeight),
  //                           width: 160 * SizeConfig.ratioWidth,
  //                           height: 60 * SizeConfig.ratioHeight,
  //                           // padding: EdgeInsets.symmetric(
  //                           //     vertical: 5 * SizeConfig.ratioHeight),
  //                           decoration: BoxDecoration(
  //                               color: Constants.buttonColor,
  //                               border:
  //                                   Border.all(width: 1, color: Colors.grey),
  //                               borderRadius:
  //                                   const BorderRadius.all(Radius.circular(5))),
  //                           child: CustomizeDatePicker(
  //                             name: "HSD",
  //                             fontColor: Colors.black,
  //                             fontWeight: FontWeight.normal,
  //                             initDateTime: date,
  //                             okBtnClickedFunction: (pickedTime) {
  //                               date = pickedTime;
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(children: [
  //                       Text(
  //                         overflow: TextOverflow.ellipsis,
  //                         "Đối với thành phẩm",
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w600,
  //                           fontSize: 20 * SizeConfig.ratioFont,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                             margin: const EdgeInsets.only(
  //                                 left: 20.0, right: 10.0),
  //                             child: const Divider(
  //                               color: Colors.black,
  //                               height: 36,
  //                             )),
  //                       ),
  //                     ]),
  //                     Container(
  //                       width: 350 * SizeConfig.ratioWidth,
  //                       height: 60 * SizeConfig.ratioHeight,
  //                       margin: EdgeInsets.symmetric(
  //                           vertical: 5 * SizeConfig.ratioHeight),
  //                       child: TextField(
  //                         decoration: const InputDecoration(
  //                             filled: true,
  //                             fillColor: Constants.buttonColor,
  //                             labelText: "Nhập số PO"),
  //                         onChanged: (value) => poNumber = value,
  //                       ),
  //                     ),
  //                     id == ''
  //                         ? ElevatedButton(
  //                             onPressed: () async {
  //                               BlocProvider.of<CreateReceiptBloc>(context).add(
  //                                   AddLotToGoodsReceiptEvent(
  //                                       ItemLotView('', 90)));
  //                               // Close the bottom sheet
  //                               Navigator.of(context).pop();
  //                             },
  //                             child: Text('Tạo mới'),
  //                           )
  //                         : ElevatedButton(
  //                             onPressed: () async {
  //                               BlocProvider.of<CreateReceiptBloc>(context).add(
  //                                   UpdateLotReceiptEvent(ItemLotView('', 90)));
  //                               // Close the bottom sheet
  //                               Navigator.of(context).pop();
  //                             },
  //                             child: Text('Cập nhật'),
  //                           )
  //                   ],
  //                 ),
  //               ),
  //             );
  //           }));
  // }

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Số phiếu",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            TextInputWidget(contentTextField: receiptId)
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: ((value) {}),
            controller: controller,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        BlocConsumer<CreateReceiptBloc, CreateReceiptState>(
          listener: (context, state) {
            if (state is UpdateLotReceiptStateSuccess) {
            //  lots = state.itemLotView;
            }
            if (state is AddLotToGoodsReceiptStateSuccess) {
             // lots = state.itemLotView;
            }
          },
          builder: (context, state) {
            if (
                state is AddLotToGoodsReceiptStateLoading ||
                state is UpdateLotReceiptStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (
                state is UpdateLotReceiptStateSuccess) {
              return Column(
                children: [
                  SizedBox(
                    height: 300 * SizeConfig.ratioHeight,
                    child: ListView.builder(
                        itemCount: state.itemLotView.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (() {
                              //_showForm(itemlots[index].itemName, items);
                              BlocProvider.of<FillReceiptLotBloc>(context).add(
                                  GetAllItemEvent(DateTime.now(), state.itemLotView,index));
                              Navigator.pushNamed(
                                context,
                                '/fill_lot_receipt_screen',
                              );
                            }),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 350 * SizeConfig.ratioWidth,
                                height: 80 * SizeConfig.ratioHeight,
                                color: Constants.buttonColor,
                                child: Text(state.itemLotView[index].itemName),
                              ),
                            ),
                          );
                        }),
                  ),
                  CustomizedButton(
                      text: "Tiếp tục",
                      onPressed: () {
                        BlocProvider.of<FillReceiptLotBloc>(context)
                            .add(GetAllItemEvent(DateTime.now(),state.itemLotView , -1));
                        Navigator.pushNamed(
                          context,
                          '/fill_lot_receipt_screen',
                        );
                      })
                ],
              );
            } else {
              return Column(
                children: [
                  ExceptionErrorState(
                    title: "Chưa có lô hàng được nhập",
                    message: "Chọn Tiếp tục để nhập kho",
                  ),
                  CustomizedButton(
                      text: "Tiếp tục",
                      onPressed: () {
                        //  _showForm('', state.items);
                        BlocProvider.of<FillReceiptLotBloc>(context)
                            .add(GetAllItemEvent(DateTime.now(), lots, -1));
                        Navigator.pushNamed(
                          context, '/fill_lot_receipt_screen',
                       
                        );
                      })
                ],
              );
            }
          },
        ),
      ]),
    );
  }
//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }

//     goodsReceiptEntryConainerDataTemp.forEach((userDetail)
//     {
//       if (userDetail.itemId.contains(text)) _searchResult.add(userDetail);
//     });

//     setState(() {});
//   }

//  // List<GoodsReceiptEntryContainerData> _searchResult = [];
}
