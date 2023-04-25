import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/create_new_issue_state.dart';
import 'package:mobile_warehouse_thaiduong/presentation/dialog/dialog_one_button.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';

class FillMainInFoIssueScreen extends StatefulWidget {
  const FillMainInFoIssueScreen({super.key});

  @override
  State<FillMainInFoIssueScreen> createState() =>
      _FillMainInfoIssueScreenState();
}

class _FillMainInfoIssueScreenState extends State<FillMainInFoIssueScreen> {
  final issueId = TextEditingController();

  String selectedDepartment = '';
  String poNumber = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Khi trở lại mọi thông tin sẽ không được lưu'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '///');
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.west, //mũi tên back
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/create_issue_screen');
            },
          ),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Xuất kho',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: BlocConsumer<CreateIssueBloc, CreaNewIssueState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is PostNewGoodsIssueSuccessState) {
              AlertDialogOneBtnCustomized(context, 'Thành công',
                      'Đã hoàn thành việc tạo đơn', 'Tiếp tục', () {
                Navigator.pushNamed(context, '/export_main_screen');
              }, 20, 15, () {}, false)
                  .show();
            }
          },
          builder: (context, state) {
            if (state is LoadListDataSuccessState) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 350 * SizeConfig.ratioWidth,
                          height: 60 * SizeConfig.ratioHeight,
                          margin: EdgeInsets.symmetric(
                              vertical: 5 * SizeConfig.ratioHeight),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                // filled: true,
                                // fillColor: Constants.buttonColor,
                                labelText: "Số phiếu"),
                            controller: issueId,
                            onChanged: (value) => {},
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: SizedBox(
                      //     width: 350 * SizeConfig.ratioWidth,
                      //     height: 60 * SizeConfig.ratioHeight,
                      //     child: DropdownSearch<String>(
                      //         mode: Mode.MENU,
                      //         items:
                      //             state.departments.map((e) => e.name).toList(),
                      //         showSearchBox: true,
                      //         label: "Bộ phận (xuất nội bộ)",
                      //         // hint: "country in menu mode",
                      //         onChanged: (value) {
                      //           //  print(value);
                      //           setState(() {});
                      //         },
                      //         selectedItem: selectedDepartment),
                      //   ),
                      // ),
                      Container(
                        width: 350 * SizeConfig.ratioWidth,
                        height: 60 * SizeConfig.ratioHeight,
                        margin: EdgeInsets.symmetric(
                            vertical: 5 * SizeConfig.ratioHeight),
                        child: TextField(
                          controller:
                              TextEditingController(text: selectedDepartment),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              // filled: true,
                              // fillColor: Constants.buttonColor,
                              labelText: "Người nhận"),
                          onChanged: (value) => selectedDepartment = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350 * SizeConfig.ratioWidth,
                          height: 60 * SizeConfig.ratioHeight,
                          child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              items: state.listPo.map((e) => e).toList(),
                              showSearchBox: true,
                              label: "Số PO (đối với thành phẩm)",
                              // hint: "country in menu mode",
                              onChanged: (value) {
                                //  print(value);
                                setState(() {
                                  poNumber = value.toString();
                                });
                              },
                              selectedItem: poNumber),
                        ),
                      ),
                      CustomizedButton(
                          text: "Hoàn thành",
                          onPressed: () {
                            BlocProvider.of<CreateIssueBloc>(context).add(
                                PostNewGoodsIssueEvent(
                                    state.issueEntries,
                                    issueId.text,
                                    poNumber,
                                    selectedDepartment,
                                    DateTime.now()));
                            // Navigator.pushNamed(
                            //   context,
                            //   '/fill_info_entry_screen',
                            // );
                          })
                    ]),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
