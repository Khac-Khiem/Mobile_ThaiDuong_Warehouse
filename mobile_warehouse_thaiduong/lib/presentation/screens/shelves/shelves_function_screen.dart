import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/shelves/search_item_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/shelves/search_shelf_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

import '../../bloc/blocs/shelve_bloc.dart';
import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/events/shelve_events.dart';

class ShelveFunctionScreen extends StatelessWidget {
  const ShelveFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Kệ kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconCustomizedButton(
              icon: Icons.manage_search_outlined,
              text: "TÌM KIẾM THEO SẢN PHẨM",
              onPressed: () {
                BlocProvider.of<ShelveBloc>(context)
                    .add(GetAllItemIdEvent(DateTime.now()));
                Navigator.pushNamed(context, '/search_item_screen');    
              }),
          IconCustomizedButton(
              icon: Icons.location_on,
              text: "TRUY XUẤT VỊ TRÍ",
              onPressed: () {
                BlocProvider.of<ShelveBloc>(context)
                    .add(GetAllLocationEvent(DateTime.now()));
                Navigator.pushNamed(context, '/search_shelf_screen');    
              }),
        ],
      )),
    );
  }
}
