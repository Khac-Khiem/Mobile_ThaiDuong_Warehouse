import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/inventory_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/inventory_states.dart';

import '../../../constant.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class ReportInventoryScreen extends StatefulWidget {
  const ReportInventoryScreen({super.key});

  @override
  State<ReportInventoryScreen> createState() => _ReportInventoryScreenState();
}

class _ReportInventoryScreenState extends State<ReportInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        Navigator.pushNamed(context, "/scan_item_screen");
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.mainColor,
            leading: IconButton(
              icon: const Icon(Icons.west_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/scan_item_screen');
              },
            ),
            title: Text(
              'Tồn kho',
              style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
            ),
          ),
          body: Column(children: [
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadReportInventoryLotSuccessState) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Báo cáo tồn kho",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20 * SizeConfig.ratioFont,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Mã SP')),
                                DataColumn(label: Text('Tên SP')),
                                DataColumn(label: Text('ĐVT')),
                                DataColumn(label: Text('Tồn kho')),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(state.itemLots[0].item!.itemId
                                        .toString())),
                                    DataCell(Text(state.itemLots[0].item!.itemName
                                        .toString())),
                                    DataCell(Text(
                                        state.itemLots[0].item!.unit.toString())),
                                    DataCell(
                                        Text(state.totalQuantity.toString())),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Lô')),
                                DataColumn(label: Text('Tồn kho')),
                              ],
                              rows: state
                                  .itemLots // Loops through dataColumnText, each iteration assigning the value to element
                                  .map(
                                    ((element) => DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text(element.lotId
                                                .toString())), //Extracting from Map element the value
                                            DataCell(Text(
                                                element.quantity.toString())),
                                          ],
                                        )),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        CustomizedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/scan_item_screen',
                            );
                          },
                          text: "Trở lại",
                        )
                      ],
                    );
                  }
                  if (state is LoadReportInventoryLotFailState) {
                    return SingleChildScrollView(
                      child: Center(
                        child: ExceptionErrorState(
                          title: 'Danh sách đang rỗng',
                          message: "Vui lòng thử lại sau",
                        ),
                      ),
                    );
                  }
                  if (state is LoadReportInventoryLotLoadingState) {
                    return SingleChildScrollView(
                      child: Center(
                        child: ExceptionErrorState(
                          icon: Icons.wifi_protected_setup_sharp,
                          title: 'Loading',
                          message: "Vui lòng đợi....",
                        ),
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Center(
                        child: ExceptionErrorState(
                          title: 'Lỗi hệ thống',
                          message: "Vui lòng thử lại sau",
                        ),
                      ),
                    );
                  }
                })
          ])),
    );
  }
}
