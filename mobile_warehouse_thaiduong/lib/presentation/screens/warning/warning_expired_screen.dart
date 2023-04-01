import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../constant.dart';
import '../../bloc/blocs/warning_bloc.dart';
import '../../bloc/states/warning_states.dart';
import '../../widgets/button_widget.dart';

const List<String> expirationDate = <String>['6 tháng', '1 năm', '2 năm'];

class WarningExpiredScreen extends StatelessWidget {
  const WarningExpiredScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String expirationDate = '';
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.west_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/warning_function_screen');
            },
          ),
          title: Text(
            'Cảnh báo',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
             Container(
                          padding: EdgeInsets.fromLTRB(8, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          
                              SizedBox(
                                width: 340 * SizeConfig.ratioWidth,
                                height: 60 * SizeConfig.ratioHeight,
                                child: DropdownSearch<String?>(
                                  mode: Mode.MENU,
                                  items: const ['6 tháng', '1 năm','2 năm'],
                                  showSearchBox: true,
                                  label: "Chọn hạn sử dụng còn lại",
                                  // hint: "country in menu mode",
                                  // onChanged: (value) {
                                  //   //  print(value);
                                  //   setState(() {
                                  //     selectedItemClass = state.itemClass.firstWhere(
                                  //         (element) => element.itemClassId == value);
                                  //   });
                                  // },
                                  // selectedItem: selectedWarehouse == null
                                  //     ? ''
                                  //     : selectedWarehouse!.warehouse,
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
          Text(
            overflow: TextOverflow.ellipsis,
            "Danh sách các lô hàng",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20 * SizeConfig.ratioFont,
              color: Colors.black,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 350, 10, 10),
            child: CustomizedButton(
                text: "Truy xuất",
                onPressed: () {
                  BlocConsumer<WarningBloc, WarningState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is ExpirationWarningSuccessState) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                height:
                                                    10 * SizeConfig.ratioHeight,
                                                child: ListView.builder(
                                                    itemCount:
                                                        state.itemLot.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Container(
                                                          width: 350 *
                                                              SizeConfig
                                                                  .ratioWidth,
                                                          height: 80 *
                                                              SizeConfig
                                                                  .ratioHeight,
                                                          color: Constants
                                                              .buttonColor,
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
                              child: CircularProgressIndicator());
                        }
                      });
                  //           {
                  //   BlocProvider.of<WarningBloc>(context).add(
                  //       MinimumStockWarningEvent(
                  //           DateTime.now(), warehouse));
                  // }
                }),
          )
          // BlocBuilder<WarningBloc, WarningState>(builder: (context, state) {
          //   if (state is ExpirationWarningSuccessState) {
          //     return SingleChildScrollView(
          //       scrollDirection: Axis.vertical,
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             height: 370 * SizeConfig.ratioHeight,
          //             child: ListView.builder(
          //                 itemCount: state.itemLot.length,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   return Padding(
          //                     padding:
          //                         const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //                     child: Container(
          //                       width: 350 * SizeConfig.ratioWidth,
          //                       height: 80 * SizeConfig.ratioHeight,
          //                       color: Constants.buttonColor,
          //                     ),
          //                   );
          //                 }),
          //           ),
          //           // CustomizedButton(text: "Truy xuất", onPressed: () {})
          //         ],
          //       ),
          //     );

          //   } else {
          //     return const Center(child: CircularProgressIndicator());
          //   }
          // }),
        ]));
  }
}
