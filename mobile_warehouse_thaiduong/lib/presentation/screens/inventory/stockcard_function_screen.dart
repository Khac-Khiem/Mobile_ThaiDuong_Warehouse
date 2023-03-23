import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/inventory/material_inventory_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/inventory/product_inventory_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

class StockcardFunctionScreen extends StatelessWidget {
  const StockcardFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Tồn kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconCustomizedButton(
              icon: Icons.qr_code_scanner_outlined, 
              text: "QUÉT MÃ SẢN PHẨM", onPressed: () {
                  
              }),
          IconCustomizedButton(
              icon: Icons.inventory_2, 
              text: "TỒN KHO THÀNH PHẨM", 
              onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ProductStockcardScreen()),
                      );}),
          IconCustomizedButton(
              icon: Icons.storm_rounded, 
              text: "TỒN KHO NGUYÊN VẬT LIỆU", 
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StockcardScreen()),
                      );
              }),
              
        ],
      )),
    );
  }
}
