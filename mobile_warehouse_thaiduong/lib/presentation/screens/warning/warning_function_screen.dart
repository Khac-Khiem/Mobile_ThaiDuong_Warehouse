import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/events/warning_stocklevel_events.dart';

class WarningFunctionScreen extends StatelessWidget {
  const WarningFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
       onWillPop: () async {
        Navigator.pushNamed(context, "/main_screen");
        return false;
      },
      child: Scaffold(
        
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.west_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/main_screen');
              },
            ),
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
                icon: Icons.alarm_off_outlined,
                text: "CẢNH BÁO HẠN SỬ DỤNG",
                onPressed: () {
                  // BlocProvider.of<WarningBloc>(context)
                  //     .add(ExpirationWarningEvent(DateTime.now()));
                  Navigator.pushNamed(context, '/warning_expired_screen');        
                }),  
            IconCustomizedButton(
                icon: Icons.production_quantity_limits_rounded,
                text: "CẢNH BÁO STOCKMIN",
                onPressed: () {
                  BlocProvider.of<WarningBloc>(context)
                      .add(GetWarehouseEvent(DateTime.now()) );
                  Navigator.pushNamed(context, '/warning_under_stockmin');    
                }),
          ],
        )),
      ),
    );
  }
}
