import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/list_issue_entry_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/list_entry_issue_state.dart';

class ListGoodsIssueEntryBloc extends Bloc<GoodsIssueEntryEvent, GoodsIssueEntryState> {
  GoodsIssueUseCase goodsIssueUseCase;
  ListGoodsIssueEntryBloc(this.goodsIssueUseCase):super(LoadGoodsIssueEntryLoadingState(DateTime.now())){
  }
}
