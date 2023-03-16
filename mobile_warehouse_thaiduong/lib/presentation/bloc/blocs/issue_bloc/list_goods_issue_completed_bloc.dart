import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/list_goods_issue_completed_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/list_completed_goods_issue_state.dart';

class ListGoodsIssueCompletedBloc extends Bloc<CompletedGoodsIssueEvent, CompletedGoodsIssueState> {
  GoodsIssueUseCase goodsIssueUseCase;
  ListGoodsIssueCompletedBloc(this.goodsIssueUseCase):super(LoadCompletedGoodsIssuesLoadingState(DateTime.now())){
  }
}
