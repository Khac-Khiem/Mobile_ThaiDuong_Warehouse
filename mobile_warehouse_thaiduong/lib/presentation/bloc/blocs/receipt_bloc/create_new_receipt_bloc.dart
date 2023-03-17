import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/create_new_receipt_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/create_new_receipt_state.dart';

class CreateReceiptBloc extends Bloc<CreateReceiptEvent, CreateReceiptState> {
  GoodsReceiptUsecase goodsReceiptUsecase;
  ItemUsecase itemUsecase;

  CreateReceiptBloc(this.goodsReceiptUsecase, this.itemUsecase)
      : super(ReceiptLoadingState(DateTime.now())) {
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
        event.lots.add(event.itemLotView);

        emit(UpdateLotReceiptStateSuccess(DateTime.now(), event.lots));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<UpdateLotReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        event.lots.removeAt(event.index);
        event.lots.insert(event.index, event.itemLotView);
        emit(UpdateLotReceiptStateSuccess(
          DateTime.now(),
          event.lots,
        ));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
  }
}
