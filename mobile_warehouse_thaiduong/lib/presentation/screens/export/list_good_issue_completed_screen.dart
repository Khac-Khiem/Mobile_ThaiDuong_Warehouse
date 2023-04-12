import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/list_lot_issue_completed_event.dart';
import '../../../domain/entities/goods_issue.dart';
import '../../../function.dart';
import '../../bloc/blocs/issue_bloc/list_goods_issue_completed_bloc.dart';
import '../../bloc/blocs/issue_bloc/list_lot_issue_completed_bloc.dart';
import '../../bloc/states/issue_state/list_completed_goods_issue_state.dart';

class ListGoodIssueCompletedScreen extends StatefulWidget {
  const ListGoodIssueCompletedScreen({super.key});

  @override
  State<ListGoodIssueCompletedScreen> createState() => _ListGoodIssueCompletedScreenState();
}

class _ListGoodIssueCompletedScreenState extends State<ListGoodIssueCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
      body: BlocBuilder<ListGoodsIssueCompletedBloc, CompletedGoodsIssueState>(
          builder: (context, state) {
        if (state is LoadCompletedGoodsIssuesSuccessState) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Danh sách các phiếu cần xuất",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22 * SizeConfig.ratioFont,
                      color: Colors.black,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: ExpansionPanelList.radio(
                    children: state.goodsIssues
                        .map((e) => ExpansionPanelRadio(
                              backgroundColor: Colors.grey[200],
                              canTapOnHeader: true,
                              value: e.goodsIssueId.toString(),
                              headerBuilder: ((context, isExpanded) {
                                return ListTile(
                                  //leading: const Icon(Icons.list),
                                  // trailing: Icon(
                                  //     Icons.arrow_drop_down_sharp,
                                  //     size: 15 * SizeConfig.ratioFont),
                                  //      tileColor: Colors.grey[200],

                                  isThreeLine: true,
                                  title: Text("Số phiếu : ${e.goodsIssueId}"),
                                  subtitle: Text(
                                      "Receiver : ${e.receiver.toString()} "),
                                );
                              }),
                              body: Column(
                                children: [
                                  SizedBox(
                                    height: e.entries!.length *
                                        120 *
                                        SizeConfig.ratioHeight,
                                    child: ListView.builder(
                                        itemCount: e.entries!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: ListTile(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              //  leading: const Icon(Icons.list),
                                              trailing: const Icon(
                                                  Icons.post_add_outlined),
                                              isThreeLine: true,
                                              title: Text(
                                                  "Sản phẩm : ${e.entries![index].item!.itemName}"),
                                              subtitle: Text(
                                                  "Số lượng yêu cầu : ${e.entries![index].requestQuantity.toString()} \nĐịnh mức yêu cầu : ${e.entries![index].requestSublotSize.toString()} "),
                                              onTap: () {
                                                BlocProvider.of<
                                                            ListGoodsIssueLotCompletedBloc>(
                                                        context)
                                                    .add(LoadGoodsIssueLotCompletedEvent(
                                                        DateTime.now(),
                                                        e.entries![index].lots
                                                            as List<
                                                                GoodsIssueLot>));
                                                Navigator.pushNamed(context,
                                                    '/list_goods_issue_lot_completed_screen');
                                              },
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
