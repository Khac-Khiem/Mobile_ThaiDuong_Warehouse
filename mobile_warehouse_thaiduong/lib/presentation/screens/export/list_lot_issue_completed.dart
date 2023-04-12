import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:mobile_warehouse_thaiduong/presentation/widgets/lot_detail_component.dart';

import '../../bloc/blocs/issue_bloc/list_lot_issue_completed_bloc.dart';
import '../../bloc/states/issue_state/list_completed_lots_issue_state.dart';

class ListLotIssueCompletedScreen extends StatelessWidget {
  const ListLotIssueCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.west, //mũi tên back
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/list_goods_issue_completed_screen');
            },
          ),
          backgroundColor: Constants.mainColor,
          title: Text(
            'Danh sách hàng hóa',
            style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
          ),
        ),
        body: BlocConsumer<ListGoodsIssueLotCompletedBloc,
            CompletedGoodsIssueLotState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is LoadCompletedGoodsIssueLotSuccessState) {
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                                 overflow: TextOverflow.ellipsis,
                                 "Danh sách các lô hàng đã xuất",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 25 * SizeConfig.ratioFont,
                                   color: Colors.black,
                                 ),
                               ),
                   ),
                     const Divider(
                  indent: 30,
                  endIndent: 30,
                  color: Constants.mainColor,
                  thickness: 1,
                ),
                  SizedBox(
                                          height: 470 * SizeConfig.ratioHeight,

                    child: ListView.builder(
                        itemCount: state.lots.length,
                        itemBuilder: (BuildContext context, int index) {
                          return LotDetailComponent(
                              itemId: state.lots[index].goodsIssueLotId.toString(),
                              location: '',
                              enableEdit: false,
                              lotid: '220123_NCC',
                              numberPO: '264836',
                              unit: 'cái',
                              quantity: 100,
                              sublotSize: 10,
                              onPressed: () {});
                        }),
                  ),
                ],
              );
            }else{
               return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
