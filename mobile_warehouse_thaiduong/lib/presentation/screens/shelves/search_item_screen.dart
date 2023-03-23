import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../constant.dart';
import '../../../domain/entities/item.dart';
import '../../bloc/blocs/shelve_bloc.dart';
import '../../bloc/states/shelve_states.dart';
import '../../widgets/button_widget.dart';

class SearchItemScreen extends StatefulWidget {
  SearchItemScreen({super.key});

  @override
  State<SearchItemScreen> createState() =>
      _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
  List<Item> itemsDropdownData = [];
  Item? selectedItem;
// class SearchItemScreen extends StatelessWidget {
//   const SearchItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String expiredDay = '';
    SizeConfig().init(context);

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Kệ kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Column(children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Mã SP",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
        BlocConsumer<ShelveBloc, ShelveState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllItemIdSuccessState) {
           return DropdownButton<Item>(
                      hint: Text("Chọn mã sản phẩm"),
                      value: selectedItem,
                      onChanged: (Item? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          print(
                              state.items.indexOf(selectedItem as Item));
                        });
                      },
                      items: state.items.map((Item item) {
                        return DropdownMenuItem<Item>(
                          value: item,
                          child: Text(
                            item.itemId.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Tên SP",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            DropdownSearchButton(
              buttonName: "Chọn tên sản phẩm", 
              height: 60, width: 200, 
              listItem: ["a"], 
              reference: expiredDay, 
              onChanged: (){})
          ],
        ),
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
         CustomizedButton(text: "Truy xuất" ,onPressed: (){
          onPressed: () {
              BlocBuilder<ShelveBloc, ShelveState>(builder: (context, state) {
                if (state is GetLotByItemIdSuccessState) {
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
                        // CustomizedButton(text: "Truy xuất", onPressed: () {})
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
            };
         })
      ]),
    );
  }
}