import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/history/export_history_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/history/import_history_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

class HistoryFunctionScreen extends StatelessWidget {
  const HistoryFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Lịch sử',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconCustomizedButton(
              icon: Icons.input_rounded,
              text: "LỊCH SỬ NHẬP",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImportHistoryScreen()),
                );
              }),
          IconCustomizedButton(
              icon: Icons.output_rounded,
              text: "LỊCH SỬ XUẤT",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExportHistoryScreen()),
                );
              }),
        ],
      )),
    );
  }
}
