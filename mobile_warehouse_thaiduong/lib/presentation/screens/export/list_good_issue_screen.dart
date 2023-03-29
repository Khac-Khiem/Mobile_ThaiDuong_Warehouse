// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/list_entry_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/list_lot_issue_screen.dart';
import '../../../function.dart';

class ListGoodIssueScreen extends StatelessWidget {
  const ListGoodIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Xuất kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
         // height: 470 * SizeConfig.ratioHeight,
          child: ExpansionPanelList.radio(
            children: [
              ExpansionPanelRadio(
                canTapOnHeader: true,
                  value: '1',
                  headerBuilder: ((context, isExpanded) => ListTile(
                        title: Text('kkkk'),
                      )),
                  body: ListTile(
                    title: Text('hihi'),
                  ))
            ],
          ),
          // child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (BuildContext context, int index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const ListGoodIssueEntryScreen()),
          //           );
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(10),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Constants.buttonColor.withOpacity(0.5),
          //                   spreadRadius: 5,
          //                   blurRadius: 2,
          //                   offset: Offset(4, 8), // changes position of shadow
          //                 ),
          //               ],
          //             ),
          //             width: 300 * SizeConfig.ratioWidth,
          //             height: 80 * SizeConfig.ratioHeight,
          //             // color: Constants.buttonColor,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               //crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   overflow: TextOverflow.ellipsis,
          //                   "Mã đơn",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 28 * SizeConfig.ratioFont,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 Text(
          //                   overflow: TextOverflow.ellipsis,
          //                   "Receiver",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 18 * SizeConfig.ratioFont,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     }),
        ),
      ),
    );
  }
}
