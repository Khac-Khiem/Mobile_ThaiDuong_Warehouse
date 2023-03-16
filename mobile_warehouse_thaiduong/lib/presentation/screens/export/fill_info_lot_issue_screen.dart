// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile_warehouse_thaiduong/constant.dart';
// import 'package:mobile_warehouse_thaiduong/function.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/screens/export/create_new_issue_screen.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

// class FillInfoEntryIssueScreen extends StatefulWidget {
//   const FillInfoEntryIssueScreen({super.key});

//   @override
//   State<FillInfoEntryIssueScreen> createState() =>
//       _FillInfoEntryIssueScreenState();
// }

// class _FillInfoEntryIssueScreenState extends State<FillInfoEntryIssueScreen> {
//   String itemId = '', itemName = '', lotId = '';
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
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 overflow: TextOverflow.ellipsis,
//                 "Thông tin hàng hóa cần xuất",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20 * SizeConfig.ratioFont,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(
//                 height: 10 * SizeConfig.ratioHeight,
//               ),
//               Container(
//                 height: 500 * SizeConfig.ratioHeight,
//                 child: Column(
//                   children: [
//                     DropdownSearchButton(
//                         buttonName: "Mã sản phẩm",
//                         height: 60,
//                         width: 350,
//                         listItem: const ["a", "b"],
//                         reference: itemId,
//                         onChanged: (() {
//                           setState(() {});
//                         })),
//                     DropdownSearchButton(
//                         buttonName: "Tên sản phẩm",
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
//                         DropdownSearchButton(
//                             buttonName: "Định mức",
//                             height: 60,
//                             width: 160,
//                             listItem: const ["a", "b"],
//                             reference: itemId,
//                             onChanged: (() {
//                               setState(() {});
//                             })),
//                         DropdownSearchButton(
//                             buttonName: "Tổng lượng",
//                             height: 60,
//                             width: 160,
//                             listItem: const ["a", "b"],
//                             reference: itemId,
//                             onChanged: (() {
//                               setState(() {});
//                             })),
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
//                   ],
//                 ),
//               ),
//               CustomizedButton(
//                   text: "Tiếp tục",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const CreateNewIssueScreen()),
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
