import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/states/warning_states.dart';
import '../../widgets/button_widget.dart';
class WarningUnderStockminScreen extends StatefulWidget {
  WarningUnderStockminScreen({super.key});

  @override
  State<WarningUnderStockminScreen> createState() =>
      _WarningUnderStockminScreenSate();
}

class _WarningUnderStockminScreenSate extends State<WarningUnderStockminScreen> {
  List<Warehouse> itemsDropdownData = [];
  Warehouse? selectedWarehouse;

// class WarningUnderStockminScreen extends StatelessWidget {
//   const WarningUnderStockminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String warehouseId = '';
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          title: Text(
            'Cảnh báo',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Kho hàng",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
        BlocConsumer<WarningBloc, WarningState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetWarehouseSuccessState) {
           return 
              DropdownSearchButton(
                    buttonName: "Chọn loại kho hàng",
                    height: 60,
                    width: 200,
                    listItem: state.warehouse,
                    reference: warehouseId,
                    onChanged: () {

                    });
          //  DropdownButton<Warehouse>(
          //             hint: Text("Chọn loại kho hàng"),
          //             value: selectedWarehouse,
          //             onChanged: (Warehouse? newValue) {
          //               setState(() {
          //                 selectedWarehouse = newValue;
          //                 print(
          //                     state.warehouse.indexOf(selectedWarehouse as Warehouse));
          //               });
          //             },
          //             items: state.warehouse.map((Warehouse item) {
          //               return DropdownMenuItem<Warehouse>(
          //                 value: item,
          //                 child: Text(
          //                   item.warehouseId.toString(),
          //                   style: TextStyle(color: Colors.black),
          //                 ),
          //               );
          //             }).toList(),
          //           );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
            const Divider(
              indent: 30,
              endIndent: 30,
              color: Constants.mainColor,
              thickness: 1,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              "Danh sách các lô hàng",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            CustomizedButton(
                text: "Truy xuất",
                onPressed: () {
                  BlocBuilder<WarningBloc, WarningState>(
                      builder: (context, state) {
                    if (state is MinimumStockWarningSuccessState) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const Divider(
                              indent: 30,
                              endIndent: 30,
                              color: Constants.mainColor,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 470 * SizeConfig.ratioHeight,
                              child: ListView.builder(
                                  itemCount: state.itemLot.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                            // CustomizedButton(text: "Truy xuất", onPressed: () {})
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  });
                })
          ]),
        ]));
  }
}
