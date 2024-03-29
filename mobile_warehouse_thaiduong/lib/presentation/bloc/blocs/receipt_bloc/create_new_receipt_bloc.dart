import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/create_new_receipt_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/create_new_receipt_state.dart';

class CreateReceiptBloc extends Bloc<CreateReceiptEvent, CreateReceiptState> {
  GoodsReceiptUsecase goodsReceiptUsecase;
  ItemUsecase itemUsecase;

  CreateReceiptBloc(this.goodsReceiptUsecase, this.itemUsecase)
      : super(ReceiptInitState(DateTime.now())) {
    // on<GetAllItemEvent>((event, emit) async {
    //   emit(LoadItemDataLoadingState(DateTime.now()));
    //   try {
    //     final items = await itemUsecase.getAllItem();

    //     emit(LoadItemDataSuccessState(items,event.lots, event.index, DateTime.now()));
    //   } catch (e) {
    //     //emit(Load(DateTime.now()));
    //   }
    // });
    on<AddLotToGoodsReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        event.goodsReceipt.lots.add(event.itemLot);

        emit(UpdateLotReceiptStateSuccess(DateTime.now(), event.goodsReceipt));
      } catch (e) {
        // emit(UpdateLotReceiptStateSuccess(DateTime.now(), event.goodsReceipt));
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<UpdateLotReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        event.goodsReceipt.lots.removeAt(event.index);
        event.goodsReceipt.lots.insert(event.index, event.itemLot);
        emit(UpdateLotReceiptStateSuccess(
          DateTime.now(),
          event.goodsReceipt,
        ));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<PostNewReceiptEvent>((event, emit) async {
      emit(PostReceiptStateLoadingState(DateTime.now()));
      try {
        final status =
            await goodsReceiptUsecase.postNewGoodsReceipt(event.goodsReceipt);
        if (status.detail == 'success') {
          emit(PostReceiptStateSuccess(
              DateTime.now(), status, event.goodsReceipt));
        } else {
          emit(PostReceiptStateFailure(
              ErrorPackage('fail'), DateTime.now(), event.goodsReceipt));
          //   emit(UpdateLotReceiptStateSuccess(
          //   DateTime.now(),
          //   event.goodsReceipt,
          // ));
        }
      } catch (e) {
        emit(PostReceiptStateFailure(
            ErrorPackage('fail'), DateTime.now(), event.goodsReceipt));
        // emit(UpdateLotReceiptStateSuccess(
        //   DateTime.now(),
        //   event.goodsReceipt,
        // ));
      }
    });
    on<UpdateReceiptFailEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        event.goodsReceipt.goodsReceiptId == '' ?
          emit(ReceiptInitState(DateTime.now())):
        emit(UpdateLotReceiptStateSuccess(
          DateTime.now(),
          event.goodsReceipt,
        ));
      } catch (e) {
         emit(ReceiptInitState(DateTime.now()));
         
      }
    });
  }
}
