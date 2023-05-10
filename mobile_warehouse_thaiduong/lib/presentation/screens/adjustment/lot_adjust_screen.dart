import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/adjustment_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/adjustment_states.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class LotAdjustmentScreen extends StatefulWidget {
  const LotAdjustmentScreen({super.key});

  @override
  State<LotAdjustmentScreen> createState() => _LotAdjustmentScreenState();
}

class _LotAdjustmentScreenState extends State<LotAdjustmentScreen> {
  // String controllerPO = '';
  // double controllerQuantity = 0;
  // String controllerNote = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.west_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/scan_adjustment_screen');
          },
        ),
        title: Text(
          'Điều chỉnh lô',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return BlocConsumer<AdjustmentBloc, AdjustmentState>(
            listener: (context, state) {            },
            builder: (context, state) {
              if (state is GetLotDetailSuccessState) {
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columns:const [
                            DataColumn(label: Text('Mã lô')),
                            DataColumn(label: Text('SL')),
                            DataColumn(label: Text('PO')),
                            DataColumn(label: Text('SL mới')),
                            DataColumn(label: Text('PO mới')),
                            DataColumn(label: Text('Note')),
                          ],
                          rows: state
                              .itemLots // Loops through dataColumnText, each iteration assigning the value to element
                              .map(
                                ((element) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(element.lotId
                                            .toString())), //Extracting from Map element the value
                                        DataCell(
                                            Text(element.beforeQuantity.toString())),
                                        DataCell(
                                          Text(element.oldPoNumber
                                              .toString()),
                                        ),
                                        DataCell(
                                            TextField(
                                              controller:
                                                   TextEditingController(text: element.afterQuantity.toString()),
                                            ),
                                            showEditIcon: true),
                                        DataCell(
                                          TextField(
                                              controller:
                                                   TextEditingController(text: element.newPoNumber.toString()),
                                            ),
                                            showEditIcon: true),
                                        DataCell(
                                            TextField(
                                              controller:
                                                   TextEditingController(text: element.note.toString()),
                                            ),
                                            showEditIcon: true),
                                      ],
                                    )),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text('Xác nhận'))
                  ],
                );
              }

              if (state is GetLotDetailFailState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        title: 'Mã lô không tồn tại',
                        message: "Quét lại mã lô khác",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
              if (state is UpdateLotQuantitySuccessState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        icon: Icons.check_box_outlined,
                        title: 'Thành công',
                        message: "Đã hoàn thành kiểm kê lô",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
              if (state is UpdateLotQuantityFailState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExceptionErrorState(
                        title: 'Thất bại',
                        message: "Không thể hoàn thành kiểm kê lô",
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100 * SizeConfig.ratioHeight,
                      ),
                      const CircularProgressIndicator(),
                      SizedBox(
                        height: 150 * SizeConfig.ratioHeight,
                      ),
                      CustomizedButton(
                          text: "Trở lại",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/scan_adjustment_screen');
                          })
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
