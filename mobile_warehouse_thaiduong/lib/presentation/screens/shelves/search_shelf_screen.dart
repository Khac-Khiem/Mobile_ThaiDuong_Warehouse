
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../bloc/blocs/shelve_bloc.dart';
import '../../bloc/states/shelve_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dropdown_search_button.dart';

class SearchShelfScreen extends StatefulWidget {
  const SearchShelfScreen({super.key});

  @override
  State<SearchShelfScreen> createState() => _SearchShelfScreennState();
}

class _SearchShelfScreennState extends State<SearchShelfScreen> {
  String warehouseId = '';

/* class SearchShelfScreen extends StatelessWidget {
  const SearchShelfScreen({super.key});*/
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
        body: BlocConsumer<ShelveBloc, ShelveState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetAllLocationSuccessState) {
                return Column(children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Vị trí",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * SizeConfig.ratioFont,
                            color: Colors.black,
                          ),
                        ),
                        DropdownSearchButton(
                            buttonName: "Chọn loại kho hàng",
                            height: 60,
                            width: 200,
                            listItem: state.locationId,
                            reference: warehouseId,
                            onChanged: () {})
                      ],
                    ),
                        Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: CustomizedButton(
                            text: "Tìm kiếm", onPressed: () {})),
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
                
                    // CustomizedButton(text: "Truy xuất", onPressed: () {}),
                  ])
                ]);
              }
              if (state is GetLotByLocationSuccessState) {
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
                            itemBuilder: (BuildContext context, int index) {
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
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
