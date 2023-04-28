import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../constant.dart';
import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/events/warning_stocklevel_events.dart';
import '../../bloc/states/warning_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

const List<String> expirationDate = <String>['6 tháng', '1 năm', '2 năm'];

class WarningExpiredScreen extends StatefulWidget {
  const WarningExpiredScreen({super.key});

  @override
  State<WarningExpiredScreen> createState() => _WarningExpiredScreenState();
}

class _WarningExpiredScreenState extends State<WarningExpiredScreen> {
  @override
  Widget build(BuildContext context) {
    int expirationDate = 6;
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              // BlocProvider.of<WarningBloc>(context).add(
              //     LoadExpirationWarningEvent(DateTime.now(), expirationDate));
              Navigator.pushNamed(context, '/warning_function_screen');
            },
          ),
          title: Text(
            'Cảnh báo',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatefulBuilder(builder: (context4, setState2) {
                  return Column(
                    children: [
                      NumberPicker(
                        value: expirationDate,
                        axis: Axis.horizontal,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value) =>
                            setState2(() => expirationDate = value),
                      ),
                       Text('HSD còn lại: $expirationDate tháng'),
                    ],
                  );
                }),
               
               
              ],
            ),
          ),
          CustomizedButton(
              text: "Truy xuất",
              onPressed: () {
                BlocProvider.of<WarningBloc>(context).add(
                    LoadExpirationWarningEvent(DateTime.now(), expirationDate));
              }),
          const Divider(
            indent: 30,
            endIndent: 30,
            color: Constants.mainColor,
            thickness: 1,
          ),
          BlocConsumer<WarningBloc, WarningState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ExpirationWarningSuccessState) {
                  return Column(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Danh sách các lô hàng",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20 * SizeConfig.ratioFont,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          height: 450 * SizeConfig.ratioHeight,
                          child: ListView.builder(
                              itemCount: state.itemLot.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100.0 * SizeConfig.ratioHeight,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                          leading: const Icon(Icons.list),
                                          trailing: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 15 * SizeConfig.ratioFont),
                                          title: Text(
                                              "Mã lô : ${state.itemLot[index].lotId}"),
                                          subtitle: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Sản phẩm : ${state.itemLot[index].item!.itemId.toString()}  \nSố lượng : ${state.itemLot[index].quantity.toString()} \nVị trí : ${state.itemLot[index].purchaseOrderNumber.toString()}"),
                                              Text(
                                                  "Số PO : ${state.itemLot[index].purchaseOrderNumber.toString()} \nĐịnh mức : ${state.itemLot[index].sublotSize.toString()}"),
                                            ],
                                          ),
                                          isThreeLine: true,
                                          onTap: () {}),
                                    ));
                              })),
                    ],
                  );
                } if(state is ExpirationWarningFailState){
                  return    Center(
                    child: ExceptionErrorState(
                    title: state.detail,
                    message: "Chọn lại thông tin để truy xuất",
                                  ),
                  );
                } 
              //   if (state is ExpirationWarningLoadingState) {
              //   return const Center(
              //     child: CircularProgressIndicator()
              //   );
              // }
                else {
                  return  Center(
                    child: ExceptionErrorState(
                    title: 'Chưa có thông tin để truy xuất',
                    message: "Chọn thời gian để truy xuất",
                                  ),
                  );
                }
              }),
        ]));
  }
}
