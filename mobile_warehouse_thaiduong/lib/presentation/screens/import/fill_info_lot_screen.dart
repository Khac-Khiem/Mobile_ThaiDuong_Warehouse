// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile_warehouse_thaiduong/constant.dart';
// import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
// import 'package:mobile_warehouse_thaiduong/function.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/create_new_receipt_bloc.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/create_new_receipt_event.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/fill_info_receipt_lot_state.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/barcode_input_widget.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/customized_date_picker.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

// import '../../../domain/entities/item.dart';

// class FillInfoLotReceiptScreen extends StatefulWidget {
//   const FillInfoLotReceiptScreen({super.key});

//   @override
//   State<FillInfoLotReceiptScreen> createState() =>
//       _FillInfoLotReceiptScreenState();
// }

// class _FillInfoLotReceiptScreenState extends State<FillInfoLotReceiptScreen> {
//   String itemId = '', itemName = '', lotId = '', poNumber = '';
//   Unit? unit = Unit('');
//   double sublotSize = 0, quantity = 0;
//   List<Item> item = [];

//   DateTime date = DateFormat('yyyy-MM-dd')
//       .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Constants.mainColor,
//         title: Text(
//           'Nhập kho',
//           style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
//         ),
//       ),
//       body: BlocBuilder<FillReceiptLotBloc, FillInfoReceiptLotState>(
//         builder: (context, state) {
//           if (state is LoadItemDataLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return SingleChildScrollView(
//               child: Container(
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
//                     // BarcodeinputWidget(
//                     //   textController: itemId,
//                     //   textLabel: "Mã hàng hóa",
//                     // ),
//                     DropdownSearchButton(
//                         buttonName: "Mã hàng hóa",
//                         height: 60,
//                         width: 350,
//                         listItem: const ["a", "b"],
//                         reference: itemId,
//                         onChanged: (() {
//                           setState(() {
//                             final itemSelected = item.firstWhere(
//                                 (element) => element.itemId == itemId);
//                             itemName = itemSelected.itemName;
//                             unit = itemSelected.unit;
//                           });
//                         })),
//                     DropdownSearchButton(
//                         buttonName: "Tên hàng hóa",
//                         height: 60,
//                         width: 350,
//                         listItem: const ["a", "b"],
//                         reference: itemId,
//                         onChanged: (() {
//                           setState(() {
//                             final itemSelected = item.firstWhere(
//                                 (element) => element.itemName == itemName);
//                             itemId = itemSelected.itemId;
//                             unit = itemSelected.unit;
//                           });
//                         })),
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
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
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
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
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
//                     DropdownSearchButton(
//                         buttonName: "Đơn vị tính",
//                         height: 60,
//                         width: 350,
//                         listItem: const ["a", "b"],
//                         reference: itemId,
//                         onChanged: (() {
//                           setState(() {});
//                         })),
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
//                               border: Border.all(width: 1, color: Colors.grey),
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
//                             margin:
//                                 const EdgeInsets.only(left: 20.0, right: 10.0),
//                             child: Divider(
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
//                       // decoration: BoxDecoration(
//                       //     color: Constants.buttonColor,
//                       //     border: Border.all(
//                       //         width: 1, color: Constants.buttonColor),
//                       //     borderRadius:
//                       //         const BorderRadius.all(Radius.circular(5))),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                             filled: true,
//                             fillColor: Constants.buttonColor,
//                             labelText: "Nhập số PO"),
//                         onChanged: (value) => poNumber = value,
//                       ),
//                     ),
//                     CustomizedButton(
//                         text: "Xác nhận",
//                         onPressed: () {
//                           BlocProvider.of<CreateReceiptBloc>(context).add(
//                               AddLotToGoodsReceiptEvent(
//                                   ItemLotView(Random().toString(), 10)));
//                           Navigator.pushNamed(
//                               context, '/create_receipt_screen');

//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) =>
//                           //           const CreateNewReceiptScreen()),
//                           // );
//                         })
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
