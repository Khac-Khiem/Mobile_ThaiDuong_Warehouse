// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/isolation_bloc.dart';
import '../../bloc/states/isolation_states.dart';
import '../../widgets/button_widget.dart';

class IsolationItemScreen extends StatefulWidget {
  const IsolationItemScreen({super.key});

  @override
  State<IsolationItemScreen> createState() => _IsolationItemScreenState();
}

class _IsolationItemScreenState extends State<IsolationItemScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
  String itemId = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.west_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/isolation_function_screen');
          },
        ),
        title: Text(
          'Cách ly',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: BlocConsumer<IsolationBloc, IsolationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllItemSuccessState) {
            return SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
                    child: 
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         
                          SizedBox(
                            width: 340 * SizeConfig.ratioWidth,
                            height: 60 * SizeConfig.ratioHeight,
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              items: state.item.map((e) => e.itemId).toList(),
                              showSearchBox: true,
                              label: "Mã sản phẩm",
                              // hint: "country in menu mode",
                              onChanged: (value) {
                                //  print(value);
                                setState(() {
                                  selectedItem = state.item.firstWhere(
                                      (element) => element.itemId == value);
                                });
                              },
                             
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(     
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            
                            SizedBox(
                              width: 340 * SizeConfig.ratioWidth,
                              height: 60 * SizeConfig.ratioHeight,
                              child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                items: state.item.map((e) => e.itemName).toList(),
                                showSearchBox: true,
                                label: "Tên sản phẩm",
                                // hint: "country in menu mode",
                                onChanged: (value) {
                                  //  print(value);
                                  setState(() {
                                    selectedItem = state.item.firstWhere(
                                        (element) => element.itemName == value);
                                  });
                                },
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 30,
                        endIndent: 30,
                        color: Constants.mainColor,
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 450, 10, 10),
                        child: CustomizedButton(
                            text: "Truy xuất", onPressed: () {}),
                      )
                    ])));
          }
          if (state is GetLotByItemIdSuccessState) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          SingleChildScrollView(
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
                                  height: 10 * SizeConfig.ratioHeight,
                                  child: ListView.builder(
                                      itemCount: state.itemLots.length,
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
                              ],
                            ),
                          )
                        ])
                  ])
                ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
