import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/info_issuecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/issue_event/create_new_issue_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/issue_state/create_new_issue_state.dart';

class CreateIssueBloc extends Bloc<CreateNewIssueEvent, CreaNewIssueState> {
  GoodsIssueUseCase goodsIssueUseCase;
  InfoUsecase infoUsecase;

  CreateIssueBloc(this.goodsIssueUseCase, this.infoUsecase)
      : super(CreateNewIssueInitialState()) {
    on<LoadListDataEvent>((event, emit) async {
      emit(LoadDepartmentLoadingState(DateTime.now()));
      try {
        final department = await infoUsecase.getAllDepartment();
        final listPO = await infoUsecase.getAllPO();
     //   final listReceiver = await infoUsecase.getAllReceiver();
        emit(LoadListDataSuccessState(department, event.entriesIssue,
          listPO, DateTime.now()));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<AddIssueEntryEvent>((event, emit) async {
      emit(UpdateEntryToGoodsIssueLoading(DateTime.now()));
      try {
        event.issueEntries.add(event.issueEntry);
        emit(UpdateEntryToGoodsIssueSuccess(
          DateTime.now(),
          event.issueEntries,
        ));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<UpdateIssueEntryEvent>((event, emit) async {
      emit(UpdateEntryToGoodsIssueLoading(DateTime.now()));
      try {
        event.issueEntries.removeAt(event.index);
        event.issueEntries.insert(event.index, event.issueEntry);
        emit(UpdateEntryToGoodsIssueSuccess(
          DateTime.now(),
          event.issueEntries,
        ));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<LoadIssueEntryEvent>((event, emit) async {
      emit(UpdateEntryToGoodsIssueLoading(DateTime.now()));
      try {
        emit(UpdateEntryToGoodsIssueSuccess(
          DateTime.now(),
          event.issueEntries,
        ));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<PostNewGoodsIssueEvent>((event, emit) async {
      emit(PostNewGoodsIssueLoadingState(DateTime.now()));
      try {
        final status = await goodsIssueUseCase.postNewGoodsIssue(
            event.goodsIssueId,
            event.purchaseOrderNumber,
            event.timestamp,
            event.receiver,
            event.issueEntries);
        if (status.detail == 'success') {
          emit(PostNewGoodsIssueSuccessState(
            DateTime.now(),
            'success',
          ));
        } else {
          emit(PostNewGoodsIssueFailState(DateTime.now(), 'fail'));
        }
      } catch (e) {
        emit(PostNewGoodsIssueFailState(DateTime.now(), 'fail'));
      }
    });
  }
}
