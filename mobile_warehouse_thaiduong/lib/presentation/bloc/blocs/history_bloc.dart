import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_lot_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/inventory_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/history_events.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/history_states.dart';

import '../../../domain/usecases/goods_receipt_usecase.dart';
import '../../../domain/usecases/location_usecase.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  ItemUsecase itemUsecase;
  GoodsIssueUseCase goodsIssueUseCase;
  GoodsReceiptUsecase goodsReceiptUseCase;
  InventoryUsecase inventoryUsecase;
  LocationUsecase locationUsecase;
  HistoryBloc(this.inventoryUsecase, this.goodsIssueUseCase,
      this.goodsReceiptUseCase, this.locationUsecase, this.itemUsecase)
      : super(GetAllInfoImportLoadingState(DateTime.now())) {
    // hiển thị list kho hàng, itemId, bộ phận
    on<GetAllInfoImportEvent>((event, emit) async {
      emit(GetAllInfoImportLoadingState(DateTime.now()));
      try {
        final item = await itemUsecase.getAllItem();
        final department = await goodsIssueUseCase.getAllDepartment();
        emit(GetAllInfoImportSuccessState(DateTime.now(), item, department));
      } catch (e) {
        emit(GetAllInfoImportFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    //list sản phẩm theo kho hàng
    on<GetItemByWarehouseEvent>((event, emit) async {
      emit(GetItemByWarehouseLoadingState(DateTime.now()));
      try {
        if (event is GetItemByWarehouseEvent) {
          final items = await itemUsecase.getItemByWarehouseId(event.itemClass);
          emit(GetItemByWarehouseSuccessState(DateTime.now(), items));
        }
      } catch (e) {
        emit(GetItemByWarehouseFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    // lọc kho hàng theo thông tin tìm kiếm
    on<AccessImportHistoryEvent>((event, emit) async {
      emit(AccessImportHistoryLoadingState(DateTime.now()));
      try {
        if (event is AccessImportHistoryEvent) {
          final goodReceiptLots =
              await goodsReceiptUseCase.getGoodsReceiptsHistory(
                  event.itemClass,
                  event.startDate,
                  event.endDate,
                  event.itemId,
                  event.department,
                  event.receiver,
                  event.purchaseOrderNumber);
          emit(
              AccessImportHistorySuccessState(DateTime.now(), goodReceiptLots));
        }
      } catch (e) {
        emit(AccessImportHistoryFailState(DateTime.now(), ErrorPackage('')));
      }
    });
  }
}
