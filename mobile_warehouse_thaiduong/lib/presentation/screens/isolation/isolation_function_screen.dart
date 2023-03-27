import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

import '../../bloc/blocs/isolation_bloc.dart';
import '../../bloc/events/isolation_events.dart';


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
              text: "CÁCH LY HÀNG HÓA", 
              onPressed: () {
                   Navigator.pushNamed(context, '/isolation_item_screen'   
                      );
              }),
          IconCustomizedButton(
              icon: Icons.list_alt_outlined, 
              text: "DANH SÁCH HÀNG HÓA ĐANG CÁCH LY", 
              onPressed: () {
              BlocProvider.of<IsolationBloc>(context)
                    .add(GetAllIsolationLotEvent(DateTime.now()));
                Navigator.pushNamed(context, '/update_isolation_item_screen');    
              }), 
        ],
      )),
    );
  }
}
