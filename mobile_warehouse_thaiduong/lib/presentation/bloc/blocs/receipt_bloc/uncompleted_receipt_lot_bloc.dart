import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/uncompleted_receipt_lot_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/uncompleted_receipt_lot_state.dart';

class ExportingReceiptLotBloc
    extends Bloc<UncompletedReceiptLotEvent, UncompletedReceiptLotState> {
  GoodsReceiptUsecase goodsReceiptUsecase;
  ExportingReceiptLotBloc(this.goodsReceiptUsecase)
      : super(LoadReceiptLotsLoadingState(DateTime.now())) {
    on<LoadUncompletedReceiptLotEvent>((event, emit) async {
      emit(UpdateReceiptLotSuccessState(event.receipt, DateTime.now()));
    });
    on<UpdateReceiptLotEvent>((event, emit) async {
      emit(UpdateReceiptLotLoadingState(DateTime.now()));
      try {
        event.goodsReceipt.lots.removeAt(event.index);
        event.goodsReceipt.lots.insert(event.index, event.itemLot);
        emit(UpdateReceiptLotSuccessState(event.goodsReceipt, DateTime.now()));
      } catch (e) {
        // emit(LoadReceiptExportingStateFail(
        //     DateTime.now(), 'Không truy xuất được dữ liệu'));
      }
    });
    on<PostReceiptChangedEvent>((event, emit) async {
      emit(ConfirmReceiptLotChangedLoadingState(DateTime.now()));
      try {
        final status = await goodsReceiptUsecase
            .updateDetailLotReceipt(event.goodsReceipt);
        status.detail == 'success'
            ? emit(ConfirmReceiptLotChangedSuccessState(
                ErrorPackage('Thành công'), DateTime.now()))
            : emit(ConfirmReceiptLotChangedFailState(
                ErrorPackage('Thất bại'), DateTime.now()));
      } catch (e) {
       emit(ConfirmReceiptLotChangedFailState(
                ErrorPackage('Lỗi hệ thống'), DateTime.now()));
      }
    });
  }
}
