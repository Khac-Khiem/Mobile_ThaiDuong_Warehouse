// ignore_for_file: deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import '../../../constant.dart';
import '../../../domain/entities/location.dart';
import '../../bloc/blocs/shelve_bloc.dart';
import '../../bloc/events/shelve_events.dart';
import '../../bloc/states/shelve_states.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/exception_widget.dart';

class SearchShelfScreen extends StatefulWidget {
  const SearchShelfScreen({super.key});

  @override
  State<SearchShelfScreen> createState() => _SearchShelfScreennState();
}

class _SearchShelfScreennState extends State<SearchShelfScreen> {
  List<Location> locationDropdownData = [];
  Location? selectedLocation;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/shelves_function_screen");
        return false;
      },
      child: Scaffold(
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
          body:
              BlocConsumer<ShelveBloc, ShelveState>(listener: (context, state) {
            if (state is GetLotByLocationLoadingState) {
              const CircularProgressIndicator();
            }
          }, builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 340 * SizeConfig.ratioWidth,
                      height: 60 * SizeConfig.ratioHeight,
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: state.location.map((e) => e.locationId).toList(),
                        showSearchBox: true,
                        label: "Vị trí",
                        onChanged: (value) {
                          //  print(value);
                          setState(() {
                            selectedLocation = state.location.firstWhere(
                                (element) => element.locationId == value);
                          });
                        },
                        selectedItem: selectedLocation == null
                            ? ''
                            : selectedLocation!.locationId,
                      ),
                    ),
                  ),
                  CustomizedButton(
                      text: "Tìm kiếm",
                      onPressed: () {
                        BlocProvider.of<ShelveBloc>(context).add(
                            GetLotByLocationEvent(DateTime.now(),
                                state.location, selectedLocation!.locationId));
                      }),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Constants.mainColor,
                    thickness: 1,
                  ),
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
                  state.itemLot.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              ExceptionErrorState(
                                icon: Icons.error_outline,
                                title: "Danh sách rỗng",
                                message: "",
                              ),
                              CustomizedButton(
                                  text: "Trở về",
                                  onPressed: () {
                                    // reset lại trang tạo phiếu
                                    Navigator.pushNamed(
                                      context,
                                      '/shelves_function_screen',
                                    );
                                  }),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 430 * SizeConfig.ratioHeight,
                          child: ListView.builder(
                              itemCount: state.itemLot.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // height: 110.0 * SizeConfig.ratioHeight,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                        ),
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
                                              fontSize:
                                                  16 * SizeConfig.ratioFont,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width:
                                                  150 * SizeConfig.ratioWidth,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
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
                                                      "Mã SP: ${state.itemLot[index].item!.itemId}"),
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
                                                      "Số lượng: ${state.itemLot[index].quantity}"),
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
                                                      "Vị trí: ${state.itemLot[index].location!.locationId}"),
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
                                                      "NSX: ${state.itemLot[index].productionDate == null ? '...' : DateFormat('yyyy-MM-dd').format(state.itemLot[index].productionDate as DateTime)}"),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  130 * SizeConfig.ratioWidth,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
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
                                                      "Tên SP: ${state.itemLot[index].item!.itemName}"),
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
                                                      "Định mức: ${state.itemLot[index].sublotSize ?? '...'}  "),
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
                                                      "HSD: ${state.itemLot[index].expirationDate == null ? '...' : DateFormat('yyyy-MM-dd').format(state.itemLot[index].expirationDate as DateTime)}"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        isThreeLine: true,
                                        onTap: () {},
                                      ),
                                    ));
                              })),
                ],
              ),
            );
          })),
    );
  }
}
