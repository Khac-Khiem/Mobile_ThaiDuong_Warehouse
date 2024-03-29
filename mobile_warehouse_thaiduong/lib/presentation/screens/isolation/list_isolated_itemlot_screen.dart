import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/isolation_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/isolation_states.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class ListIsolatedItemLotScreen extends StatefulWidget {
  const ListIsolatedItemLotScreen({super.key});

  @override
  State<ListIsolatedItemLotScreen> createState() =>
      _ListIsolatedItemLotScreenState();
}

class _ListIsolatedItemLotScreenState extends State<ListIsolatedItemLotScreen> {
  // List<Item> itemsDropdownData = [];
  Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
       onWillPop: () async {
        Navigator.pushNamed(context, "/isolation_function_screen");
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.west_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/isolation_function_screen');
              },
            ),
            backgroundColor: Constants.mainColor,
            title: Text(
              'Hàng hóa cách ly',
              style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
            ),
          ),
          body: Column(
            children: [
              BlocConsumer<IsolationBloc, IsolationState>(
                  listener: (context, state) {
                // if (state is GetAllItemIdSuccessState) {
                //   itemsDropdownData = state.items;
                // }
                // if (state is GetLotByItemIdSuccessState) {
                //   itemsDropdownData = state.item;
                // }
              }, builder: (context, state) {
                if (state is GetAllIsolationLotSuccessState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 430 * SizeConfig.ratioHeight,
                        child: ListView.builder(
                            itemCount: state.itemLot.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    trailing: Icon(Icons.edit,
                                        size: 17 * SizeConfig.ratioFont),
                                    title: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 8.0, 0, 8.0),
                                      child: Text(
                                        "Mã lô : ${state.itemLot[index].lotId}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16 * SizeConfig.ratioFont,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 150 * SizeConfig.ratioWidth,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Mã SP: ${state.itemLot[index].item!.itemId}"),
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Số lượng: ${state.itemLot[index].quantity}"),
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Vị trí: ${state.itemLot[index].location ?? '...'}"),
                                             Text(
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 16 *
                                                              SizeConfig
                                                                  .ratioFont,
                                                          color: Colors.black,
                                                        ),
                                                        "NSX: ${DateFormat('yyyy-MM-dd')
                                            .format(
                                                state.itemLot[index].productionDate as DateTime)}"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150 * SizeConfig.ratioWidth,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Tên SP: ${state.itemLot[index].item!.itemName}"),
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Định mức: ${state.itemLot[index].sublotSize ?? '...'}  "),
                                              Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        16 * SizeConfig.ratioFont,
                                                    color: Colors.black,
                                                  ),
                                                  "Số PO: ${state.itemLot[index].purchaseOrderNumber ?? '...'}"),
                                              Text(
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 16 *
                                                              SizeConfig
                                                                  .ratioFont,
                                                          color: Colors.black,
                                                        ),
                                                        "HSD: ${DateFormat('yyyy-MM-dd')
                                            .format(
                                                state.itemLot[index].expirationDate as DateTime)}"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    isThreeLine: true,
                                    onTap: () {},
                                  ),
                                ),
                              );
                            }),
                      ),
                      CustomizedButton(
                          text: "TRỞ LẠI",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/isolation_function_screen');
                          }),
                    ],
                  );
                }
                if (state is GetAllIsolationLotLoadingState) {
                  return Center(
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
                }
                if (state is GetAllIsolationLotFailState) {
                  return Center(
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
                } else {
                  return Center(
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
              }),
            ],
          )),
    );
  }
}
