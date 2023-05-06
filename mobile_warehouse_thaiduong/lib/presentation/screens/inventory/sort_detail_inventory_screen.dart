
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../../domain/entities/location.dart';
import '../../bloc/blocs/inventory_bloc.dart';
import '../../bloc/events/inventory_events.dart';
import '../../bloc/states/inventory_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/customized_date_picker.dart';

class StockcardScreen extends StatefulWidget {
  const StockcardScreen({super.key});

  @override
  State<StockcardScreen> createState() => _StockcardScreenState();
}

class _StockcardScreenState extends State<StockcardScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  Warehouse? selectedWarehouse;
  List<Warehouse> warehouseDropdownData = [];
  String warehose = '';
  @override
  Widget build(BuildContext context) {
  
    DateTime startDate =(DateFormat('yyyy-MM-dd').parse(DateTime.now().toString()));
    DateTime endDate = (DateFormat('yyyy-MM-dd').parse(DateTime.now().toString()));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/stockcard_function_screen');
            },
          ),
          title: Text(
            'Truy xuất tồn kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(
          children: [
            BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {
              if (state is GetWarehouseIdSuccessState) {
                warehouseDropdownData = state.warehouse;
                itemsDropdownData = state.item;
              }
              if (state is GetAllItemByWarehouseSuccessState) {
                
                itemsDropdownData = state.item;
              }
            }, builder: (context, state) {
              if (state is GetWarehouseIdSuccessState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: SizedBox(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: state.warehouse
                              .map((e) => e.warehouseId)
                              .toList(),
                          showSearchBox: true,
                          label: "Kho hàng",
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              selectedWarehouse = state.warehouse.firstWhere(
                                  (element) => element.warehouseId == value);
                              BlocProvider.of<InventoryBloc>(context)
                                  .add(GetAllItemIdByWarehouseEvent(
                                DateTime.now(),
                                selectedWarehouse!.warehouseId,
                                state.item,
                                state.item,
                                state.warehouse,
                              ));
                            });
                          },
                          selectedItem: selectedWarehouse == null
                              ? ''
                              : selectedWarehouse!.warehouseName,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: state.item.map((e) => e.itemId).toList(),
                        showSearchBox: true,
                        label: "Mã sản phẩm",
                        onChanged: (value) {
                          print(value);
                          selectedItem = null;
                          setState(() {
                            selectedItem = state.item.firstWhere(
                                (element) => element.itemId == value);
                          });
                        },
                        selectedItem:
                            selectedItem == null ? '' : selectedItem!.itemId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: state.item
                              .map((e) => e.itemName.toString())
                              .toList(),
                          showSearchBox: true,
                          label: "Tên sản phẩm",
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              selectedItem = state.item.firstWhere(
                                  (element) => element.itemName == value);
                            });
                          },
                          selectedItem: selectedItem == null
                              ? ''
                              : selectedItem!.itemName,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(
                          //     vertical: 5 * SizeConfig.ratioHeight),
                          width: 170 * SizeConfig.ratioWidth,
                          height: 80 * SizeConfig.ratioHeight,
                          child: CustomizeDatePicker(
                            name: "Từ ngày",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                            initDateTime: startDate,
                            okBtnClickedFunction: (pickedTime) {
                              startDate = pickedTime;
                            },
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(
                          //     vertical: 5 * SizeConfig.ratioHeight),
                          width: 170 * SizeConfig.ratioWidth,
                          height: 80 * SizeConfig.ratioHeight,
                          child: CustomizeDatePicker(
                            name: "Đến ngày",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                            initDateTime: endDate,
                            okBtnClickedFunction: (pickedTime) {
                              endDate = pickedTime;
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomizedButton(
                        text: "Truy xuất",
                        onPressed: () {
                          BlocProvider.of<InventoryBloc>(context).add(
                              LoadInventoryEvent(
                                  DateTime.now(),
                                  selectedItem!.itemId,
                                  startDate,
                                  endDate
                                  //state.warehouse
                                  ));
                        }),
                    const Divider(
                      indent: 30,
                      endIndent: 30,
                      color: Constants.mainColor,
                      thickness: 1,
                    ),
                     ],
                    );
                     }
                    if (state is GetAllItemByWarehouseSuccessState) {
                    return
                     Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: 350 * SizeConfig.ratioWidth,
                            height: 60 * SizeConfig.ratioHeight,
                            child: DropdownSearch<String?>(
                              mode: Mode.MENU,
                              items: state.warehouse
                                  .map((e) => e.warehouseId)
                                  .toList(),
                              showSearchBox: true,
                              label: "Kho hàng",
                               onChanged: (value) {
                                        selectedItem = null;
                                        print(value);
                                        setState(() {
                                          selectedWarehouse = state.warehouse
                                              .firstWhere((element) =>
                                                  element.warehouseId == value);
                                          BlocProvider.of<InventoryBloc>(context)
                                              .add(GetAllItemIdByWarehouseEvent(
                                                  DateTime.now(),
                                                  selectedWarehouse!
                                                      .warehouseId,
                                                  state.listAllItem,
                                                  state.item,
                                                  state.warehouse,
                                                  ));
                                        });
                                      },
                              selectedItem: selectedWarehouse == null
                                  ? ''
                                  : selectedWarehouse!.warehouseId,
                            ),
                          ),
                        ),
                        SizedBox(
                              width: 350 * SizeConfig.ratioWidth,
                              height: 60 * SizeConfig.ratioHeight,
                              child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                items: state.item
                                    .map((e) => e.itemId.toString())
                                    .toList(),
                                showSearchBox: true,
                                label: "Mã sản phẩm",
                                // hint: "country in menu mode",
                                onChanged: (value) {
                                  print(value);
                                  print(value);
                                  setState(() {
                                    selectedItem = state.item.firstWhere(
                                        (element) => element.itemId == value);
                                  });
                                },
                                selectedItem: selectedItem == null
                                    ? ''
                                    : selectedItem!.itemId,
                              ),
                            ),
                        Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 350 * SizeConfig.ratioWidth,
                                height: 60 * SizeConfig.ratioHeight,
                                child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  items: state.item
                                      .map((e) => e.itemName.toString())
                                      .toList(),
                                  showSearchBox: true,
                                  label: "Tên sản phẩm",
                                  // hint: "country in menu mode",
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      selectedItem = state.item.firstWhere(
                                          (element) =>
                                              element.itemName == value);
                                    });
                                  },
                                  selectedItem: selectedItem == null
                                      ? ''
                                      : selectedItem!.itemName,
                                ),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5 * SizeConfig.ratioHeight),
                                width: 160 * SizeConfig.ratioWidth,
                                height: 60 * SizeConfig.ratioHeight,
                                child: CustomizeDatePicker(
                                  name: "Từ ngày",
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  initDateTime: startDate,
                                  okBtnClickedFunction: (pickedTime) {
                                    startDate = pickedTime;
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5 * SizeConfig.ratioHeight),
                                width: 160 * SizeConfig.ratioWidth,
                                height: 60 * SizeConfig.ratioHeight,
                                child: CustomizeDatePicker(
                                  name: "Đến ngày",
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  initDateTime: endDate,
                                  okBtnClickedFunction: (pickedTime) {
                                    endDate = pickedTime;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomizedButton(
                            text: "Truy xuất",
                            onPressed: () {
                              // BlocProvider.of<InventoryBloc>(context).add(
                              //     LoadInventoryLotEvent(
                              //         DateTime.now(),
                              //         selectedWarehouse!.warehouseId,
                              //        ));
                              BlocProvider.of<InventoryBloc>(context).add(
                              LoadInventoryEvent(
                                  DateTime.now(),
                                  selectedItem!.itemId,
                                  startDate,
                                  endDate
                                  //state.warehouse
                                  ));
                               Navigator.pushNamed(
                                    context,
                                    '/list_inventory_screen',
                                  );       
                            }),
                        const Divider(
                          indent: 30,
                          endIndent: 30,
                          color: Constants.mainColor,
                          thickness: 1,
                        ),
                    
                  ],
                );
                // } else {
                //   return const Center(child: CircularProgressIndicator());
                // }
              } else {
               return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: SizedBox(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          // items: state.warehouse
                          //     .map((e) => e.warehouseId)
                          //     .toList(),
                          // showSearchBox: true,
                          label: "Kho hàng",
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              // selectedWarehouse = state.warehouse.firstWhere(
                              //     (element) => element.warehouseId == value);
                              // BlocProvider.of<InventoryBloc>(context)
                              //     .add(GetAllItemIdByWarehouseEvent(
                              //   DateTime.now(),
                              //   selectedWarehouse!.warehouseId,
                              //   state.item,
                              //   state.item,
                              //   state.warehouse,
                              // ));
                            });
                          },
                          selectedItem: selectedWarehouse == null
                              ? ''
                              : selectedWarehouse!.warehouseName,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        // items: state.item.map((e) => e.itemId).toList(),
                        // showSearchBox: true,
                        label: "Mã sản phẩm",
                        onChanged: (value) {
                          
                          // print(value);
                          // setState(() {
                          //   selectedItem = state.item.firstWhere(
                          //       (element) => element.itemId == value);
                          // });
                        },
                        selectedItem:
                            selectedItem == null ? '' : selectedItem!.itemId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          // items: state.item
                          //     .map((e) => e.itemName.toString())
                          //     .toList(),
                          showSearchBox: true,
                          label: "Tên sản phẩm",
                          onChanged: (value) {
                            print(value);
                            // setState(() {
                            //   selectedItem = state.item.firstWhere(
                            //       (element) => element.itemName == value);
                            // });
                          },
                          selectedItem: selectedItem == null
                              ? ''
                              : selectedItem!.itemName,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5 * SizeConfig.ratioHeight),
                            width: 160 * SizeConfig.ratioWidth,
                            height: 60 * SizeConfig.ratioHeight,
                            child: CustomizeDatePicker(
                              name: "Từ ngày",
                              fontColor: Colors.black,
                              fontWeight: FontWeight.normal,
                              initDateTime: startDate,
                              okBtnClickedFunction: (pickedTime) {
                                endDate = pickedTime;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5 * SizeConfig.ratioHeight),
                            width: 160 * SizeConfig.ratioWidth,
                            height: 60 * SizeConfig.ratioHeight,
                            child: CustomizeDatePicker(
                              name: "Đến ngày",
                              fontColor: Colors.black,
                              fontWeight: FontWeight.normal,
                              initDateTime: startDate,
                              okBtnClickedFunction: (pickedTime) {
                                endDate = pickedTime;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomizedButton(
                        text: "Truy xuất",
                        onPressed: () {
                          BlocProvider.of<InventoryBloc>(context).add(
                              LoadInventoryEvent(
                                  DateTime.now(),
                                  selectedWarehouse!.warehouseName,
                                  startDate,
                                  endDate
                                  //state.warehouse
                                  ));
                                   Navigator.pushNamed(
                                    context,
                                    '/list_inventory_screen',
                                  ); 
                        }),
                    const Divider(
                      indent: 30,
                      endIndent: 30,
                      color: Constants.mainColor,
                      thickness: 1,
                    ),]);
              }
            }),
          ],
        ));
  }
}