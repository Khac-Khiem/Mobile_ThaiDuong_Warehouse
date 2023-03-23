import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/fill_info_issue_enry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/fill_info_lot_issue_state.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/create_new_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/dropdown_search_button.dart';

import '../../../domain/entities/item.dart';

class LotAdjustmentScreen extends StatefulWidget {
  const LotAdjustmentScreen({super.key});

  @override
  State<LotAdjustmentScreen> createState() => _LotAdjustmentScreenState();
}

class _LotAdjustmentScreenState extends State<LotAdjustmentScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Điều chỉnh lô',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: BlocConsumer<FillInfoIssueEntryBloc, FillInfoIssueEntryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LoadItemDataSuccessState) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10 * SizeConfig.ratioHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Thông tin lô cần điều chỉnh",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10 * SizeConfig.ratioHeight,
                    ),
                    Container(
                        height: 500 * SizeConfig.ratioHeight,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Mã lô: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Mã sản phẩm: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Lượng cũ: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
                                labelText:
                                    "Nhập lượng mới"),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.,]')),
                            ],  
                          ),
                        ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "PO cũ: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "PO mới: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Ghi chú: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20 * SizeConfig.ratioFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    //   CustomizedButton(
                    //       text: "Tiếp tục",
                    //       onPressed: () {
                    //          BlocProvider.of<CreateIssueBloc>(context)
                    //     .add(AddIssueEntryEvent(DateTime.now()));
                    // Navigator.pushNamed(context, '/create_issue_screen');
                    //         // Navigator.push(
                    //         //   context,
                    //         //   MaterialPageRoute(
                    //         //       builder: (context) =>
                    //         //           const CreateNewIssueScreen()),
                    //         // );
                    //       })
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
