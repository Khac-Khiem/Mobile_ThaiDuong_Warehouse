import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

import 'isolation_item_screen.dart';

class IsolationFunctionScreen extends StatelessWidget {
  const IsolationFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Cảnh báo',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconCustomizedButton(
              icon: Icons.remove_moderator_outlined, 
              text: "CÁCH LY HÀNG HÓA", onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IsolationItemScreen()),
                      );
              }),
          IconCustomizedButton(
              icon: Icons.list_alt_outlined, 
              text: "DANH SÁCH HÀNG HÓA ĐANG CÁCH LY", onPressed: () {}),   
        ],
      )),
    );
  }
}
