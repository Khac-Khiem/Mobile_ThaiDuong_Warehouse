import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/history_bloc/import_history_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/history_state/import_history_state.dart';
import '../../../constant.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class ImportHistoryEntryScreen extends StatefulWidget {
  const ImportHistoryEntryScreen({super.key});

  @override
  State<ImportHistoryEntryScreen> createState() =>
      _ImportHistoryEntryScreenState();
}

class _ImportHistoryEntryScreenState extends State<ImportHistoryEntryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/import_history_screen');
            },
          ),
          title: Text(
            'Lịch sử nhập kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
          BlocConsumer<ImportHistoryBloc, ImportHistoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AccessImportHistorySuccessState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Danh sách các lô hàng",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * SizeConfig.ratioFont,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 500 * SizeConfig.ratioHeight,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount: state.importHistoryEntries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Visibility(
                                  visible: state.importHistoryEntries[index]
                                      .lots!.isNotEmpty,
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: state
                                              .importHistoryEntries[index]
                                              .lots!
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int index2) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 90.0 *
                                                    SizeConfig.ratioHeight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ListTile(
                                                    // leading: const Icon(
                                                    //     Icons.list),
                                                    leading: Text(
                                                        "  ${DateFormat('yyyy-MM-dd').format(state.importHistoryEntries[index].timestamp as DateTime)}"),
                                                    title: Text(
                                                        "NCC : ${state.importHistoryEntries[index].supplier}"),
                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 130 *
                                                              SizeConfig
                                                                  .ratioWidth,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize: 16 *
                                                                        SizeConfig
                                                                            .ratioFont,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  "Mã lô: ${state.importHistoryEntries[index].lots![index2].goodsReceiptLotId}"),
                                                              Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize: 16 *
                                                                        SizeConfig
                                                                            .ratioFont,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  "Tên SP: ${state.importHistoryEntries[index].lots![index2].item!.itemName}"),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 130 *
                                                              SizeConfig
                                                                  .ratioWidth,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize: 16 *
                                                                        SizeConfig
                                                                            .ratioFont,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  "SL: ${state.importHistoryEntries[index].lots![index2].quantity}"),
                                                              Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize: 16 *
                                                                        SizeConfig
                                                                            .ratioFont,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  "Số PO: ${state.importHistoryEntries[index].lots![index2].purchaseOrderNumber ?? '...'}"),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    isThreeLine: true,
                                                    onTap: () {}),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                );
                              })),
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
                if (state is AccessImportHistoryFailState) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExceptionErrorState(
                          title: state.status.detail,
                          message: "Vui lòng thử lại sau",
                        ),
                      ],
                    ),
                  );
                }
                if (state is AccessImportHistoryLoadingState) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExceptionErrorState(
                          icon: Icons.wifi_protected_setup_sharp,
                          title: 'Loading',
                          message: "Vui lòng đợi....",
                        ),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExceptionErrorState(
                          title: 'Lỗi hệ thống',
                          message: "Vui lòng thử lại sau",
                        ),
                      ],
                    ),
                  );
                }
              })
        ]));
  }
}
