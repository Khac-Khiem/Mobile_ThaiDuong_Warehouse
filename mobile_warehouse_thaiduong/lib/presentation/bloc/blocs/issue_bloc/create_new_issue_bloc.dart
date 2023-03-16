import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/create_new_issue_state.dart';

class CreateIssueBloc extends Bloc<CreateNewIssueEvent, CreaNewIssueState> {
  GoodsIssueUseCase goodsIssueUseCase;

  CreateIssueBloc(this.goodsIssueUseCase)
      : super(LoadDepartmentLoadingState(DateTime.now())) {
    on<LoadDepartmentIdsEvent>((event, emit) async {
      emit(LoadDepartmentLoadingState(DateTime.now()));
      try {
        final department = await goodsIssueUseCase.getAllDepartment();
        emit(LoadDepartmentSuccessState(department, DateTime.now()));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<AddIssueEntryEvent>((event, emit) async {
      emit(AddEntryToGoodsIssueLoading(DateTime.now()));
      try {
        
        
       // emit(AddEntryToGoodsIssueSuccess(department, DateTime.now()));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
  }
}
