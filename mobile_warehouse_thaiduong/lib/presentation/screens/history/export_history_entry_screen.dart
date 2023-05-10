import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import '../../../constant.dart';
import '../../bloc/blocs/history_bloc/export_history_bloc.dart';
import '../../bloc/states/history_state/export_history_state.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class ExportHistoryEntryScreen extends StatefulWidget {
  const ExportHistoryEntryScreen({super.key});

  @override
  State<ExportHistoryEntryScreen> createState() =>
      _ExportHistoryEntryScreenState();
}

class _ExportHistoryEntryScreenState extends State<ExportHistoryEntryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/export_history_screen');
            },
          ),
          title: Text(
            'Lịch sử xuất kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
          BlocConsumer<ExportHistoryBloc, ExportHistoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AccessExportHistorySuccessState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Lịch sử xuất kho",
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
                            columns:const [
                              DataColumn(label: Text('Bộ phận')),
                              DataColumn(label: Text('Mã lô')),
                              DataColumn(label: Text('SP')),
                              DataColumn(label: Text('SL')),
                              DataColumn(label: Text('PO')),
                            ],
                            rows: state
                                .exportHistoryEntries // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                                  ((element) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text(element.receiver
                                              .toString())), //Extracting from Map element the value
                                          DataCell(
                                              Text(element.goodsIssueLotId.toString())),
                                          DataCell(
                                              Text(element.itemName.toString())),
                                               DataCell(
                                              Text(element.quantity.toString())),
                                          DataCell(
                                              Text(element.purchaseOrderNumber.toString())),
                                        ],
                                      )),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                         
                      // SizedBox(
                      //     height: 500 * SizeConfig.ratioHeight,
                      //     child:
                      //     ListView.builder(
                      //         // shrinkWrap: true,
                      //         itemCount: state.exportHistoryEntries.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return Visibility(
                      //             visible: state.exportHistoryEntries[index]
                      //                 .entries!.isNotEmpty,
                      //             child: Column(
                      //               children: [
                      //                 ListView.builder(
                      //                     shrinkWrap: true,
                      //                     physics: ScrollPhysics(),
                      //                     itemCount: state
                      //                         .exportHistoryEntries[index]
                      //                         .entries!
                      //                         .length,
                      //                     itemBuilder: (BuildContext context,
                      //                         int index2) {
                      //                       return Visibility(
                      //                         visible: state
                      //                             .exportHistoryEntries[index]
                      //                             .entries![index2]
                      //                             .lots!
                      //                             .isNotEmpty,
                      //                         child: Column(
                      //                           children: [
                      //                             ListView.builder(
                      //                                 shrinkWrap: true,
                      //                                 physics: ScrollPhysics(),
                      //                                 itemCount: state
                      //                                     .exportHistoryEntries[
                      //                                         index]
                      //                                     .entries![index2]
                      //                                     .lots!
                      //                                     .length,
                      //                                 itemBuilder:
                      //                                     (BuildContext context,
                      //                                         int index3) {
                      //                                   return Padding(
                      //                                     padding:
                      //                                         const EdgeInsets
                      //                                             .all(5.0),
                      //                                     child: Container(
                      //                                       height: 90.0 *
                      //                                           SizeConfig
                      //                                               .ratioHeight,
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         border:
                      //                                             Border.all(
                      //                                           width: 1,
                      //                                         ),
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(
                      //                                                     10),
                      //                                       ),
                      //                                       child: ListTile(
                      //                                           // leading: const Icon(
                      //                                           //     Icons.list),
                      //                                           leading: Text(
                      //                                               DateFormat('yyyy-MM-dd').format(state.exportHistoryEntries[index].timestamp as DateTime)),
                      //                                           title: Text(
                      //                                               "Bộ phận : ${state.exportHistoryEntries[index].receiver}"),
                      //                                           subtitle: Row(
                      //                                             mainAxisAlignment:
                      //                                                 MainAxisAlignment
                      //                                                     .spaceBetween,
                      //                                             children: [
                      //                                               SizedBox(
                      //                                                 width: 130 *
                      //                                                     SizeConfig
                      //                                                         .ratioWidth,
                      //                                                 child:
                      //                                                     Column(
                      //                                                   crossAxisAlignment:
                      //                                                       CrossAxisAlignment.start,
                      //                                                   children: [
                      //                                                     Text(
                      //                                                         overflow: TextOverflow.ellipsis,
                      //                                                         style: TextStyle(
                      //                                                           fontWeight: FontWeight.w100,
                      //                                                           fontSize: 16 * SizeConfig.ratioFont,
                      //                                                           color: Colors.black,
                      //                                                         ),
                      //                                                         "Mã lô: ${state.exportHistoryEntries[index].entries![index2].lots![index3].goodsIssueLotId}"),
                      //                                                     Text(
                      //                                                         overflow: TextOverflow.ellipsis,
                      //                                                         style: TextStyle(
                      //                                                           fontWeight: FontWeight.w100,
                      //                                                           fontSize: 16 * SizeConfig.ratioFont,
                      //                                                           color: Colors.black,
                      //                                                         ),
                      //                                                         "Tên SP: ${state.exportHistoryEntries[index].entries![index2].item!.itemName}"),
                      //                                                   ],
                      //                                                 ),
                      //                                               ),
                      //                                               SizedBox(
                      //                                                 width: 130 *
                      //                                                     SizeConfig
                      //                                                         .ratioWidth,
                      //                                                 child:
                      //                                                     Column(
                      //                                                   crossAxisAlignment:
                      //                                                       CrossAxisAlignment.start,
                      //                                                   children: [
                      //                                                     Text(
                      //                                                         overflow: TextOverflow.ellipsis,
                      //                                                         style: TextStyle(
                      //                                                           fontWeight: FontWeight.w100,
                      //                                                           fontSize: 16 * SizeConfig.ratioFont,
                      //                                                           color: Colors.black,
                      //                                                         ),
                      //                                                         "SL: ${state.exportHistoryEntries[index].entries![index2].lots![index3].quantity}"),
                      //                                                     Text(
                      //                                                         overflow: TextOverflow.ellipsis,
                      //                                                         style: TextStyle(
                      //                                                           fontWeight: FontWeight.w100,
                      //                                                           fontSize: 16 * SizeConfig.ratioFont,
                      //                                                           color: Colors.black,
                      //                                                         ),
                      //                                                         "Note: ${state.exportHistoryEntries[index].entries![index2].lots![index3].note ?? '...'}"),
                      //                                                   ],
                      //                                                 ),
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                           isThreeLine:
                      //                                               true,
                      //                                           onTap: () {}),
                      //                                     ),
                      //                                   );
                      //                                 }),
                      //                           ],
                      //                         ),
                      //                       );
                      //                     })
                      //               ],
                      //             ),
                      //           );
                      //         })),

                      CustomizedButton(
                        onPressed: () {
                          // BlocProvider.of<HistoryBloc>(context)
                          //     .add(GetAllInfoImportEvent(
                          //   DateTime.now(),
                          // ));
                          Navigator.pushNamed(
                            context,
                            '/import_history_screen',
                          );
                        },
                        text: "Trở lại",
                      )
                    ],
                  );
                }
                if (state is AccessExportHistoryFailState) {
                  return SingleChildScrollView(
                    child: Center(
                      child: ExceptionErrorState(
                        title: state.status.detail,
                        message: "Vui lòng thử lại sau",
                      ),
                    ),
                  );
                }
                if (state is AccessExportHistoryLoadingState) {
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
        ]));
  }
}
