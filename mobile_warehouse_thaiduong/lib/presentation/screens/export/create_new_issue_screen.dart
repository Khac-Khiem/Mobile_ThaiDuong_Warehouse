import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/fill_info_issue_enry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/fill_info_issue_entry_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/create_new_issue_state.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/button_widget.dart';
import '../../dialog/dialog_one_button.dart';
import '../../widgets/exception_widget.dart';
import '../../widgets/text_input_widget.dart';

class CreateNewIssueScreen extends StatefulWidget {
  const CreateNewIssueScreen({super.key});

  @override
  State<CreateNewIssueScreen> createState() => _CreateNewIssueScreenState();
}

class _CreateNewIssueScreenState extends State<CreateNewIssueScreen> {
  GoodsIssue goodsIssue =
     GoodsIssue('', '',DateTime.now() , false, '', null, []);
  var issueId = TextEditingController();
  var receiver = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              resizeToAvoidBottomInset: false, 

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.west, //mũi tên back
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/export_main_screen');
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
         
        },
        builder: (context, state) {
        
          if (state is UpdateEntryToGoodsIssueSuccess || state is PostNewGoodsIssueFailState || state is PostNewGoodsIssueSuccessState) {
             goodsIssue = state.goodsIssue as GoodsIssue;
            issueId.text = goodsIssue.goodsIssueId.toString();
            receiver.text = goodsIssue.receiver.toString();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    
                Container(
                  width: 350 * SizeConfig.ratioWidth,
                  height: 60 * SizeConfig.ratioHeight,
                  margin: EdgeInsets.symmetric(
                      vertical: 5 * SizeConfig.ratioHeight),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // filled: true,
                        // fillColor: Constants.buttonColor,
                        labelText: "Mã bộ phận (nếu có)"),
                    controller: receiver,
                    onChanged: (value) => {
                      goodsIssue.receiver = value,
                      issueId.text =
                          "${DateFormat('yyMMdd').format(DateTime.now())}-$value",
                      goodsIssue.goodsIssueId = issueId.text,
                    },
                  ),
                ),
                Container(
                  width: 350 * SizeConfig.ratioWidth,
                  height: 60 * SizeConfig.ratioHeight,
                  margin: EdgeInsets.symmetric(
                      vertical: 5 * SizeConfig.ratioHeight),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // filled: true,
                        // fillColor: Constants.buttonColor,
                        labelText: "Số phiếu"),
                    controller: issueId,
                    onChanged: (value) => goodsIssue.goodsIssueId = value,
                  ),
                ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Danh sách các lô hàng",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25 * SizeConfig.ratioFont,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300 * SizeConfig.ratioHeight,
                        child: ListView.builder(
                            itemCount: state.goodsIssue!.entries!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: const Icon(Icons.list),
                                trailing: Icon(Icons.edit,
                                    size: 15 * SizeConfig.ratioFont),
                                isThreeLine: true,
                                title: Text(
                                    "Sản phẩm : ${state.goodsIssue!.entries![index].item!.itemName.toString()}"),
                                subtitle: Text(
                                    "Số lượng yêu cầu : ${state.goodsIssue!.entries![index].requestQuantity.toString()} \nĐịnh mức yêu cầu : ${state.goodsIssue!.entries![index].requestSublotSize ?? "..."} "),
                                onTap: () {
                                  BlocProvider.of<FillInfoIssueEntryBloc>(
                                          context)
                                      .add(GetAllItemIssueEvent(
                                          // issueId.text,
                                          // poNumber.text,
                                          // selectedDepartment,
                                          DateTime.now(),
                                          state.goodsIssue as GoodsIssue,
                                          index));
                                  Navigator.pushNamed(
                                    context,
                                    '/fill_info_entry_screen',
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomizedButton(
                          text: "Tiếp tục",
                          onPressed: () {
                            BlocProvider.of<FillInfoIssueEntryBloc>(context)
                                .add(GetAllItemIssueEvent(
                                    DateTime.now(), state.goodsIssue as GoodsIssue, -1));
                            Navigator.pushNamed(
                              context,
                              '/fill_info_entry_screen',
                            );
                          }),
                      CustomizedButton(
                          text: "Hoàn thành",
                          onPressed: () {
                           BlocProvider.of<CreateIssueBloc>(context).add(
                                PostNewGoodsIssueEvent(
                                   state.goodsIssue as GoodsIssue,
                                    DateTime.now()));
                            // Navigator.pushNamed(
                            //   context,
                            //   '/fill_main_info_issue_screen',
                            // );
                          })
                    ],
                  ),
                ]);
         
           }  
          else {
             return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                Container(
                  width: 350 * SizeConfig.ratioWidth,
                  height: 60 * SizeConfig.ratioHeight,
                  margin: EdgeInsets.symmetric(
                      vertical: 5 * SizeConfig.ratioHeight),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // filled: true,
                        // fillColor: Constants.buttonColor,
                        labelText: "Mã bộ phận (nếu có)"),
                    controller: receiver,
                    onChanged: (value) => {
                      goodsIssue.receiver = value,
                      issueId.text =
                          "${DateFormat('yyMMdd').format(DateTime.now())}-$value",
                      goodsIssue.goodsIssueId = issueId.text,
                    },
                  ),
                ),
                Container(
                  width: 350 * SizeConfig.ratioWidth,
                  height: 60 * SizeConfig.ratioHeight,
                  margin: EdgeInsets.symmetric(
                      vertical: 5 * SizeConfig.ratioHeight),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // filled: true,
                        // fillColor: Constants.buttonColor,
                        labelText: "Số phiếu"),
                    controller: issueId,
                    onChanged: (value) => goodsIssue.goodsIssueId = value,
                  ),
                ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Danh sách hàng hóa cần xuất",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25 * SizeConfig.ratioFont,
                      color: Colors.black,
                    ),
                  ),
                  ExceptionErrorState(
                    title: "Phiếu đang rỗng",
                    message: "Chọn Tiếp tục để chọn hàng hóa cần xuất",
                  ),
                  CustomizedButton(
                      text: "Tiếp tục",
                      onPressed: () {
                        BlocProvider.of<FillInfoIssueEntryBloc>(context)
                            .add(GetAllItemIssueEvent(DateTime.now(), goodsIssue, -1));
                        Navigator.pushNamed(
                          context,
                          '/fill_info_entry_screen',
                        );
                      })
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
