import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/export_history_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/info_issuecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/location_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/history_event/export_history_event.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/history_state/export_history_state.dart';

import '../../../../domain/entities/item.dart';

class ExportHistoryBloc extends Bloc<ExportHistoryEvent, ExportHistoryState> {
  ItemUsecase itemUsecase;
  InfoUsecase infoUsecase;
  LocationUsecase locationUsecase;
  ExportHistoryUsecase exportHistoryUsecase;
  // GoodsReceiptUsecase goodsReceiptUseCase;
  ExportHistoryBloc(this.exportHistoryUsecase, this.infoUsecase,
      this.locationUsecase, this.itemUsecase)
      : super(GetAllInfoExportLoadingState(DateTime.now())) {
    // hiển thị list kho hàng, itemId, bộ phận
    on<GetAllInfoExportEvent>((event, emit) async {
      emit(GetAllInfoExportLoadingState(DateTime.now()));
      try {
        final item = await itemUsecase.getAllItem();
        final warehouse = await locationUsecase.getAllWarehouseId();
        final receiver = await infoUsecase.getAllReceiver();
        final poNumber = await infoUsecase.getAllPO();

        emit(GetAllInfoExportSuccessState(
            DateTime.now(), item, poNumber, receiver, warehouse));
      } catch (e) {
        emit(GetAllInfoExportFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    on<GetExportItemByWarehouseEvent>((event, emit) async {
      emit(GetExportItemByWarehouseLoadingState(DateTime.now()));
      try {
        List<Item> item = event.listAllItem
            .expand((e) => [if (e.itemClass == event.warehouseId) e])
            .toList();
        emit(GetExportItemByWarehouseSuccessState(
            DateTime.now(),
            event.listAllItem,
            item,
            event.warehouse,
            event.poNumber,
            event.receiver));
      } catch (e) {
        emit(GetExportItemByWarehouseFailState(
            DateTime.now(), ErrorPackage('')));
      }
    });

    // truy xuất lịch sử xuất kho
    on<AccessExportHistoryByPOEvent>((event, emit) async {
      emit(AccessExportHistoryLoadingState(DateTime.now()));
      try {
        final goodIssueLots = await exportHistoryUsecase
            .getExportHistoryByPO(event.purchaseOrderNumber);
            goodIssueLots.isNotEmpty ?
        emit(AccessExportHistorySuccessState(DateTime.now(), goodIssueLots,event.itemSort, event.listAllItem, event.warehouse, event.poNumber, event.receiverList)):  emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lịch sử đang rỗng')));
      } catch (e) {
        emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lỗi hệ thống')));
      }
    });
    on<AccessExportHistoryByReceiverEvent>((event, emit) async {
      emit(AccessExportHistoryLoadingState(DateTime.now()));
      try {
        final goodIssueLots =
            await exportHistoryUsecase.getExportHistoryByReceiver(
          event.receiver,
          event.startDate,
          event.endDate,
        );
        
      goodIssueLots.isNotEmpty ?
        emit(AccessExportHistorySuccessState(DateTime.now(), goodIssueLots,event.itemSort, event.listAllItem, event.warehouse, event.poNumber, event.receiverList)):  emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lịch sử đang rỗng')));
         } catch (e) {
        emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lỗi hệ thống')));
      }
    });
    on<AccessExportHistoryByItemIdEvent>((event, emit) async {
      emit(AccessExportHistoryLoadingState(DateTime.now()));
      try {
        final goodIssueLots = await exportHistoryUsecase.getExportHistoryByItem(
          event.warehouseId,
          event.itemId,
          event.startDate,
          event.endDate,
        );
      goodIssueLots.isNotEmpty ?
        emit(AccessExportHistorySuccessState(DateTime.now(), goodIssueLots,event.itemSort, event.listAllItem, event.warehouse, event.poNumber, event.receiverList)):  emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lịch sử đang rỗng')));
         } catch (e) {
        emit(AccessExportHistoryFailState(DateTime.now(), ErrorPackage('Lỗi hệ thống')));
      }
    });
  }
}
