import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/list_lot_issue_uncompleted_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/list_goods_issue_state.dart';
import '../../../function.dart';
import '../../bloc/blocs/issue_bloc/list_goods_issue_uncompleted_bloc.dart';
import '../../bloc/events/issue_event/list_lot_issue_event.dart';

class ListGoodIssueScreen extends StatefulWidget {
  const ListGoodIssueScreen({super.key});

  @override
  State<ListGoodIssueScreen> createState() => _ListGoodIssueScreenState();
}

class _ListGoodIssueScreenState extends State<ListGoodIssueScreen> {
  int _index = 0;
  List<GoodsIssue> goodsIssue = [];
  // void _showModalSheet(int i, GoodsIssue issue) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return BlocProvider.value(
  //           value: BlocProvider.of<ListGoodsIssueLotUncompletedBloc>(context),
  //           child: SizedBox(
  //             height: 470 * SizeConfig.ratioHeight,
  //             child: ListView.builder(
  //                 itemCount: issue.entries!.length,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return GestureDetector(
  //                     onTap: () {
  //                       Navigator.pushNamed(
  //                           context, '/list_goods_issue_lot_screen');
  //                            BlocProvider.of<ListGoodsIssueLotUncompletedBloc>(
  //                               context)
  //                           .add(LoadGoodsIssueLotSuggestEvent(DateTime.now(),
  //                               issue.entries![index].item!.itemId.toString()));
  //                     },
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(10),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Constants.buttonColor.withOpacity(0.5),
  //                               spreadRadius: 5,
  //                               blurRadius: 2,
  //                               offset:
  //                                   Offset(4, 8), // changes position of shadow
  //                             ),
  //                           ],
  //                         ),
  //                         width: 300 * SizeConfig.ratioWidth,
  //                         height: 80 * SizeConfig.ratioHeight,
  //                         // color: Constants.buttonColor,
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           //crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               overflow: TextOverflow.ellipsis,
  //                               "Tên SP: ${issue.entries![index].item!.itemName.toString()}",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w600,
  //                                 fontSize: 28 * SizeConfig.ratioFont,
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                             Text(
  //                               overflow: TextOverflow.ellipsis,
  //                               "SL yêu cầu",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 18 * SizeConfig.ratioFont,
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                             Text(
  //                               overflow: TextOverflow.ellipsis,
  //                               "SL đã xuất",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 18 * SizeConfig.ratioFont,
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 }),
  //           ),
  //         );
  //       });
  //}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        title: Text(
          'Xuất kho',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: BlocBuilder<ListGoodsIssueUncompletedBloc, GoodsIssueState>(
        builder: (context, state) {
          if (state is LoadGoodsIssuesSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  height: 400 * SizeConfig.ratioHeight,
                  child: SingleChildScrollView(
                    child: ExpansionPanelList.radio(
                      children: state.goodsIssues
                          .map((e) => ExpansionPanelRadio(
                                canTapOnHeader: true,
                                value: e.goodsIssueId.toString(),
                                headerBuilder: ((context, isExpanded) {
                                  return ListTile(
                                    title: Text(e.goodsIssueId.toString()),
                                  );
                                }),
                                body: SizedBox(
                                  height: 300 * SizeConfig.ratioHeight,
                                  child: ListView.builder(
                                      itemCount: e.entries!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // BlocProvider.of<ListGoodsIssueEntryBloc>(context)
                                            //     .add(LoadGoodsIssueEntryEvent(DateTime.now()));
                                            // Navigator.pushNamed(
                                            //     context, '/list_goods_issue_entry_screen');

                                            // bỏ qua trang issue entry
                                            setState(() {
                                              BlocProvider.of<
                                                          ListGoodsIssueLotUncompletedBloc>(
                                                      context)
                                                  .add(LoadGoodsIssueLotEvent(
                                                      DateTime.now(),
                                                      e.entries![index].item!
                                                          .itemId,  e.entries![index].lots as List<GoodsIssueLot>));
                                              Navigator.pushNamed(context,
                                                  '/list_goods_issue_lot_screen');
                                              //goodsIssue = state.goodsIssues;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Constants.buttonColor
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 2,
                                                    offset: const Offset(4,
                                                        8), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              width:
                                                  300 * SizeConfig.ratioWidth,
                                              height:
                                                  80 * SizeConfig.ratioHeight,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "Số lượng : ${e.entries![index].requestQuantity}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 28 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "Tên sp : ${e.entries![index].item!.itemName}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18 *
                                                          SizeConfig.ratioFont,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                  // child: ListView.builder(
                  //     itemCount: state.goodsIssues.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           // BlocProvider.of<ListGoodsIssueEntryBloc>(context)
                  //           //     .add(LoadGoodsIssueEntryEvent(DateTime.now()));
                  //           // Navigator.pushNamed(
                  //           //     context, '/list_goods_issue_entry_screen');

                  //           // bỏ qua trang issue entry
                  //           setState(() {
                  //             goodsIssue = state.goodsIssues;

                  //           });
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(10),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Constants.buttonColor.withOpacity(0.5),
                  //                   spreadRadius: 5,
                  //                   blurRadius: 2,
                  //                   offset: const Offset(
                  //                       4, 8), // changes position of shadow
                  //                 ),
                  //               ],
                  //             ),
                  //             width: 300 * SizeConfig.ratioWidth,
                  //             height: 80 * SizeConfig.ratioHeight,
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               //crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   overflow: TextOverflow.ellipsis,
                  //                   "Mã đơn : ${state.goodsIssues[index].goodsIssueId}",
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.w600,
                  //                     fontSize: 28 * SizeConfig.ratioFont,
                  //                     color: Colors.black,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   overflow: TextOverflow.ellipsis,
                  //                   "Receiver : ${state.goodsIssues[index].receiver}",
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 18 * SizeConfig.ratioFont,
                  //                     color: Colors.black,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }),
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
