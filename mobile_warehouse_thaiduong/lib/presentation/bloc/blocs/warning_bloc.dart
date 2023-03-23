import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_lot_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/location_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/warning_events.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/warning_states.dart';

class WarningBloc extends Bloc<WarningEvent, WarningState> {
  ItemLotUsecase itemLotUsecase;
  LocationUsecase locationUsecase;
  WarningBloc(this.itemLotUsecase, this.locationUsecase)
      : super(ExpirationWarningLoadingState(DateTime.now())) 
      {
// cảnh báo hsd 
    on<ExpirationWarningEvent>((event, emit) async {
      emit(ExpirationWarningLoadingState(DateTime.now()));
      try {
        final itemLot = await itemLotUsecase.getIsolatedItemLots();
        itemLot.isNotEmpty
            ? emit(ExpirationWarningSuccessState(DateTime.now(), itemLot))
            : emit(ExpirationWarningFailState(
                DateTime.now(), 'Chưa có lô được nhập'));
      } catch (e) {
        emit(ExpirationWarningFailState(
            DateTime.now(), 'Không truy xuất được dữ liệu'));
      }
    });
    // hiển thị list bộ phận
   on<GetWarehouseEvent>((event, emit) async {
      emit(GetWarehouseLoadingState(DateTime.now()));
      try {
        final warehouseIds = await locationUsecase.getAllWarehouseId();
        emit(GetWarehouseSuccessState(DateTime.now(), warehouseIds));
      } catch (e) {
        emit(GetWarehouseFailState(DateTime.now()));
      }
    });
 
  // cảnh báo số lượng tồn kho tối thiểu
   on<MinimumStockWarningEvent>((event, emit) async {
      emit(MinimumStockWarningLoadingState(DateTime.now()));
      try {
        final itemLots = await itemLotUsecase.getUnderStockminItemLots();
        itemLots.isNotEmpty
            ? emit(MinimumStockWarningSuccessState(DateTime.now(), itemLots))
            : emit(MinimumStockWarningFailState(
                DateTime.now(), ''));
      } catch (e) {
        emit(ExpirationWarningFailState(
            DateTime.now(), 'Không truy xuất được dữ liệu'));
      }
    });  
  }
}
