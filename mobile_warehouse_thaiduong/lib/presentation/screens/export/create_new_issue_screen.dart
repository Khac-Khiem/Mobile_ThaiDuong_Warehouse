import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/fill_info_lot_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../domain/entities/item.dart';
import '../../widgets/exception_widget.dart';
import '../../widgets/text_input_widget.dart';

class CreateNewIssueScreen extends StatefulWidget {
  const CreateNewIssueScreen({super.key});

  @override
  State<CreateNewIssueScreen> createState() => _CreateNewIssueScreenState();
}

class _CreateNewIssueScreenState extends State<CreateNewIssueScreen> {
  TextEditingController controller = TextEditingController();
  String issueId = '';
  String poNumber = '';
  String itemId = '', itemName = '', lotId = '';
  double sublotSize = 0;
  Unit? unit = Unit('');
  List<Item> item = [];
  List<IssueEntryView> issueEntryViews = [];
  void _showForm(String id) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(builder: (BuildContext context,
                void Function(void Function()) setState) {
              return SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownSearchButton(
                          buttonName: "Mã hàng hóa",
                          height: 60,
                          width: 350,
                          listItem: const ["a", "b"],
                          reference: itemId,
                          onChanged: (() {
                            setState(() {
                              final itemSelected = item.firstWhere(
                                  (element) => element.itemId == itemId);
                              itemName = itemSelected.itemName;
                              unit = itemSelected.unit;
                            });
                          })),
                      DropdownSearchButton(
                          buttonName: "Tên hàng hóa",
                          height: 60,
                          width: 350,
                          listItem: const ["a", "b"],
                          reference: itemId,
                          onChanged: (() {
                            setState(() {
                              final itemSelected = item.firstWhere(
                                  (element) => element.itemName == itemName);
                              itemId = itemSelected.itemId;
                              unit = itemSelected.unit;
                            });
                          })),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5 * SizeConfig.ratioHeight),
                            alignment: Alignment.centerRight,
                            width: 160 * SizeConfig.ratioWidth,
                            height: 55 * SizeConfig.ratioHeight,
                            //color: Colors.grey[200],
                            child: TextField(
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Constants.buttonColor,
                                  labelText:
                                      "Nhập số lượng định mức của thùng hàng"),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]')),
                              ],
                              onChanged: (value) =>
                                  sublotSize = double.parse(value),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5 * SizeConfig.ratioHeight),
                            alignment: Alignment.centerRight,
                            width: 160 * SizeConfig.ratioWidth,
                            height: 55 * SizeConfig.ratioHeight,
                            //color: Colors.grey[200],
                            child: TextField(
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Constants.buttonColor,
                                  labelText: "Nhập tổng lượng của lô hàng"),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]')),
                              ],
                              onChanged: (value) =>
                                  sublotSize = double.parse(value),
                            ),
                          )
                        ],
                      ),
                      DropdownSearchButton(
                          buttonName: "Đơn vị tính",
                          height: 60,
                          width: 350,
                          listItem: const ["a", "b"],
                          reference: itemId,
                          onChanged: (() {
                            setState(() {});
                          })),
                      ElevatedButton(
                        onPressed: () async {
                          // BlocProvider.of<CreateReceiptBloc>(context)
                          //     .add(UpdateLotReceiptEvent(ItemLotView('', 90)));
                          // Close the bottom sheet
                          Navigator.of(context).pop();
                        },
                        child: Text(id == '' ? 'Create New' : 'Update'),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Xuất kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Số phiếu",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            TextInputWidget(contentTextField: issueId)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Bộ phận",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            DropdownSearchButton(
                buttonName: "Bộ phận",
                height: 55,
                width: 200,
                listItem: [],
                reference: "",
                onChanged: () {})
            //TextInput(contentTextField: issueId)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              "Số PO   ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20 * SizeConfig.ratioFont,
                color: Colors.black,
              ),
            ),
            TextInputWidget(contentTextField: poNumber)
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
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     onChanged: ((value) {}),
        //     controller: controller,
        //     decoration: const InputDecoration(
        //         labelText: "Search",
        //         hintText: "Search",
        //         prefixIcon: Icon(Icons.search),
        //         border: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        //   ),
        // ),
        ExceptionErrorState(
          title: "Phiếu đang rỗng",
          message: "Chọn Tiếp tục để chọn hàng hóa cần xuất",
        ),
        CustomizedButton(
            text: "Tiếp tục",
            onPressed: () {
              _showForm('');
            })
      ]),
    );
  }
}
