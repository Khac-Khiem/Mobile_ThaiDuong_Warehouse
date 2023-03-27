import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../widgets/button_widget.dart';

class UpdateIsolationItemScreen extends StatelessWidget {
  const UpdateIsolationItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Danh sách hàng hóa',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Column(children: [
        Text(
          overflow: TextOverflow.ellipsis,
          "Danh sách các lô hàng",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20 * SizeConfig.ratioFont,
            color: Colors.black,
          ),
        ),
         CustomizedButton(text: "Trở lại" ,onPressed: (){
          
         })
      ]),
    );
  }
}