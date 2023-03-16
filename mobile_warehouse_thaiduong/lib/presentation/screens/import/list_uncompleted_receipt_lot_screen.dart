import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import '../../../function.dart';

class ListUncompletedLotReceiptScreen extends StatelessWidget {
  const ListUncompletedLotReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Danh sách lô chưa hoàn thành',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10 * SizeConfig.ratioHeight,
            ),
          //  ListTile()
            Text(
              overflow: TextOverflow.ellipsis,
              "Danh sách các lô hàng",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     onChanged: ((value) {}),
            //     controller: TextEditingController(),
            //     decoration: const InputDecoration(
            //         labelText: "Search",
            //         hintText: "Search",
            //         prefixIcon: Icon(Icons.search),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            //   ),
            // ),
            SizedBox(
              height: 470 * SizeConfig.ratioHeight,
              child: ListView.builder(
                  itemCount: 4,
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
          ],
        ),
      ),
    );
  }
}
