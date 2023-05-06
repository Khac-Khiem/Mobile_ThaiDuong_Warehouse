import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/shelve_bloc.dart';
import '../../bloc/states/shelve_states.dart';
import '../../bloc/events/shelve_events.dart';
import '../../widgets/button_widget.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({super.key});

  @override
  State<SearchItemScreen> createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
  // List<Item> itemsDropdownData = [];
  Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/shelves_function_screen');
            },
          ),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Kệ kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(
          children: [
            BlocConsumer<ShelveBloc, ShelveState>(listener: (context, state) {
              // if (state is GetAllItemIdSuccessState) {
              //   itemsDropdownData = state.items;
              // }
              // if (state is GetLotByItemIdSuccessState) {
              //   itemsDropdownData = state.item;
              // }
            }, builder: (context, state) {
              if (state is GetAllItemIdSuccessState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: state.items.map((e) => e.itemId).toList(),
                          showSearchBox: true,
                          label: "Mã sản phẩm",
                          onChanged: (value) {
                            print(value);
                            selectedItem = null;
                            setState(() {
                              selectedItem = state.items.firstWhere(
                                  (element) => element.itemId == value);
                            });
                          },
                          selectedItem:
                              selectedItem == null ? '' : selectedItem!.itemId,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: state.items
                            .map((e) => e.itemName.toString())
                            .toList(),
                        showSearchBox: true,
                        label: "Tên sản phẩm",
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            selectedItem = state.items.firstWhere(
                                (element) => element.itemName == value);
                          });
                        },
                        selectedItem:
                            selectedItem == null ? '' : selectedItem!.itemName,
                      ),
                    ),
                    CustomizedButton(
                        text: "Truy xuất",
                        onPressed: () {
                          BlocProvider.of<ShelveBloc>(context).add(
                              GetLotByItemIdEvent(DateTime.now(),
                                  selectedItem!.itemId, state.items

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
              if (state is GetLotByItemIdSuccessState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
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
                          selectedItem:
                              selectedItem == null ? '' : selectedItem!.itemId,
                        ),
                      ),
                    ),
                    SizedBox(
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
                                (element) => element.itemName == value);
                          });
                        },
                        selectedItem:
                            selectedItem == null ? '' : selectedItem!.itemName,
                      ),
                    ),
                    CustomizedButton(
                        text: "Truy xuất",
                        onPressed: () {
                          BlocProvider.of<ShelveBloc>(context).add(
                              GetLotByItemIdEvent(DateTime.now(),
                                  selectedItem!.itemId, state.item));
                        }),
                    const Divider(
                      indent: 30,
                      endIndent: 30,
                      color: Constants.mainColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 330 * SizeConfig.ratioHeight,
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
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize:
                                                      16 * SizeConfig.ratioFont,
                                                  color: Colors.black,
                                                ),
                                                "NSX: ${DateFormat('yyyy-MM-dd').format(state.itemLot[index].productionDate as DateTime)}"),
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
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize:
                                                      16 * SizeConfig.ratioFont,
                                                  color: Colors.black,
                                                ),
                                                "HSD: ${DateFormat('yyyy-MM-dd').format(state.itemLot[index].expirationDate as DateTime)}"),
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
                  ],
                );
              } else {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
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
                  ),
                  SizedBox(
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
                      selectedItem:
                          selectedItem == null ? '' : selectedItem!.itemName,
                    ),
                  ),
                  CustomizedButton(text: "Truy xuất", onPressed: () {}),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Constants.mainColor,
                    thickness: 1,
                  ),
                ]);
              }
            }),
          ],
        ));
  }
}
