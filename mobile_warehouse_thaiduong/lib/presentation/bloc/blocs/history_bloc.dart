
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/department_issuecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/history_events.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/history_states.dart';

import '../../../domain/usecases/goods_receipt_usecase.dart';
import '../../../domain/usecases/location_usecase.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  ItemUsecase itemUsecase;
  DepartmentUsecase departmentUsecase;
  LocationUsecase locationUsecase;
  GoodsIssueUseCase goodsIssueUseCase;
  GoodsReceiptUsecase goodsReceiptUseCase;
  HistoryBloc(
      this.goodsIssueUseCase,
      this.departmentUsecase, 
      this.locationUsecase, 
      this.goodsReceiptUseCase,
      this.itemUsecase)
      : super(GetAllInfoExportLoadingState(DateTime.now())) {
    // hiển thị list kho hàng, itemId, bộ phận
    on<GetAllInfoExportEvent>((event, emit) async {
      emit(GetAllInfoExportLoadingState(DateTime.now()));
      try {
       
        final item = await itemUsecase.getAllItem();
        final warehouse = await locationUsecase.getAllWarehouseId();
        final department = await departmentUsecase.getAllDepartment();
        emit(GetAllInfoExportSuccessState(DateTime.now(), item, warehouse, department));
      }catch (e) {
        emit(GetAllInfoExportFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    //list sản phẩm theo kho hàng
    on<GetItemByWarehouseEvent>((event, emit) async {
      emit(GetItemByWarehouseLoadingState(DateTime.now()));
      try {
      
        {
          final items = await itemUsecase.getItemByWarehouseId(event.itemClass);
          emit(GetItemByWarehouseSuccessState(DateTime.now(), items));
        }
      } catch (e) {
        emit(GetItemByWarehouseFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    // lọc kho hàng theo thông tin tìm kiếm
    on<AccessExportHistoryEvent>((event, emit) async {
      emit(AccessImportHistoryLoadingState(DateTime.now()));
      try {
         {
          final goodIssueLots =
              await goodsIssueUseCase.getGoodsIssueHistory(
                  event.warehouse,
                  event.startDate,
                  event.endDate,
                  event.itemId,
                  event.department
         
              //  event.purchaseOrderNumber
                  );
          emit(
              AccessExportHistorySuccessState(DateTime.now(), goodIssueLots));
        }
      } catch (e) {
        emit(AccessImportHistoryFailState(DateTime.now(), ErrorPackage('')));
      }
    });
  //-------------------
      on<GetAllInfoImportEvent>((event, emit) async {
      emit(GetAllInfoImportLoadingState(DateTime.now()));
      try {
        final item = await itemUsecase.getAllItem();
          final warehouse = await locationUsecase.getAllWarehouseId();
        final department = await departmentUsecase.getAllDepartment();
        emit(GetAllInfoImportSuccessState(DateTime.now(),warehouse, item, department));
      } catch (e) {
        emit(GetAllInfoImportFailState(DateTime.now(), ErrorPackage('')));
      }
    });
    //list sản phẩm theo kho hàng

    // lọc kho hàng theo thông tin tìm kiếm
    on<AccessImportHistoryEvent>((event, emit) async {
      emit(AccessImportHistoryLoadingState(DateTime.now()));
      try {
         {
          final goodIssueLots =
              await goodsReceiptUseCase.getGoodsReceiptsHistory(
                  event.itemClass,
                  event.startDate,
                  event.endDate,
                  event.itemId,
                  event.department,
                  event.receiver,
                  event.purchaseOrderNumber
                  );
          emit(
              AccessImportHistorySuccessState(DateTime.now(), goodIssueLots));
        }
      } catch (e) {
        emit(AccessImportHistoryFailState(DateTime.now(), ErrorPackage('')));
      }
    });
  }
}

 
