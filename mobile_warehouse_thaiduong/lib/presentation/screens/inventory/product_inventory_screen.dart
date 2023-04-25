import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import '../../../constant.dart';
import '../../bloc/blocs/inventory_bloc.dart';
import '../../bloc/events/inventory_events.dart';
import '../../bloc/states/inventory_states.dart';
import '../../widgets/button_widget.dart';

class ListInventoryScreen extends StatefulWidget {
  const ListInventoryScreen({super.key});

  @override
  State<ListInventoryScreen> createState() => _ListInventoryScreenState();
}

class _ListInventoryScreenState extends State<ListInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
            'Danh sách lô hàng',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: Column(children: [
          BlocConsumer<InventoryBloc, InventoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadInventorySuccessState
                    //   ||state is LoadInventorySuccessState
                    // state is AccessExportHistoryByReceiverSuccessState||
                    // state is AccessExportHistoryByItemIdSuccessState
                    ) {
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
                            itemCount: state.itemLots.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 110.0 * SizeConfig.ratioHeight,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                      leading: Text(DateFormat('yyyy-MM-dd')
                                          .format(
                                              state.itemLots[index].timestamp)),
                                      // trailing: Icon(
                                      //     Icons.arrow_drop_down_sharp,
                                      //     size: 15 * SizeConfig.ratioFont),
                                      title: Text(
                                          "Mã lô : ${state.itemLots[index].itemLot}"),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Sản phẩm : ${state.itemLots[index].item.itemName.toString()}  \nSố lượng ban đầu : ${state.itemLots[index].beforeQuantity.toString()}   \nSố lượng thay đổi : ${state.itemLots[index].changedQuantity.toString()}"),
                                          // Text(
                                          //     "nĐịnh mức : ${state.itemLots[index].itemLot.sublotSize.toString()}"),
                                        ],
                                      ),
                                      isThreeLine: true,
                                      onTap: () {}),
                                ),
                              );
                            },
                          )),
                      CustomizedButton(
                        onPressed: () {
                          // BlocProvider.of<HistoryBloc>(context)
                          //     .add(GetAllInfoImportEvent(
                          //   DateTime.now(),
                          // ));
                          Navigator.pushNamed(
                            context,
                            '/inventory_function_screen',
                          );
                        },
                        text: "Trở lại",
                      )
                    ],
                  );
                } else {
                  print(state);
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ]));
  }
}
