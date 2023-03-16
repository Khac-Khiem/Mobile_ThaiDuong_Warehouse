import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/create_new_receipt_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/create_new_receipt_state.dart';

//test => sqlite
List<ItemLotView> itemlots = [];

class CreateReceiptBloc extends Bloc<CreateReceiptEvent, CreateReceiptState> {
  GoodsReceiptUsecase goodsReceiptUsecase;
  ItemUsecase itemUsecase;

  CreateReceiptBloc(this.goodsReceiptUsecase, this.itemUsecase)
      : super(ReceiptLoadingState(DateTime.now())) {
    on<GetAllItemEvent>((event, emit) async {
      emit(LoadItemDataLoadingState(DateTime.now()));
      try {
        final items = await itemUsecase.getAllItem();
        // final List<String> itemIds = [];
        // final List<String> itemNames = [];
        // final List<Unit?> units = [];

        for (int i = 0; i < items.length; i++) {
          //database 
          // itemIds.add(items[i].itemId);
          // itemNames.add(items[i].itemName);
          // units.add(items[i].unit);
          
          
        }
        emit(LoadItemDataSuccessState(items, DateTime.now()));
      } catch (e) {
        //emit(Load(DateTime.now()));
      }
    });
    on<AddLotToGoodsReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        itemlots.add(event.itemLot);
        emit(AddLotToGoodsReceiptStateSuccess(DateTime.now()));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
    on<UpdateLotReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState(DateTime.now()));
      try {
        itemlots.removeWhere(
            (element) => element.itemName == event.itemLotView.itemName);
        itemlots.add(event.itemLotView);
        emit(UpdateLotReceiptStateSuccess(DateTime.now()));
      } catch (e) {
        // emit(LoginStateLoginFailure(DateTime.now()));
      }
    });
  }
}
