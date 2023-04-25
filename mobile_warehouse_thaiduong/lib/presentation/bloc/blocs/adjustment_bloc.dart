import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_lot_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/inventory_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/adjustment_events.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/adjustment_states.dart';

import '../../../domain/usecases/location_usecase.dart';
import '../../../domain/usecases/lot_adjustment_usecase.dart';

class AdjustmentBloc extends Bloc<AdjustmentEvent, AdjustmentState> {
  LotAdjustmentUsecase lotAdjustmentUsecase;
  ItemLotUsecase itemLotUsecase;
  AdjustmentBloc(this.lotAdjustmentUsecase, this.itemLotUsecase)
      : super(GetLotDetailLoadingState(DateTime.now())) {
    on<GetLotDetailEvent>((event, emit) async {
      emit(GetLotDetailLoadingState(DateTime.now()));
      try {
        final ItemLot lotsAdjust = await itemLotUsecase.getItemLotById(event.lotId);
        emit(GetLotDetailSuccessState(DateTime.now(), lotsAdjust));
      } catch (e) {
        emit(GetLotDetailFailState(DateTime.now()));
      }
    });

    on<UpdateLotAdjustmentQuantityEvent>((event, emit) async {
      emit(UpdateLotQuantityLoadingState(DateTime.now()));
      try {
        final ErrorPackage postNewAdjust = await lotAdjustmentUsecase.postNewLotAdjustment(event.itemLot, event.employeeName, event.newPo, event.note, event.newQuantity);
       if(postNewAdjust.detail == 'success'){
 emit(UpdateLotQuantitySuccessState(
          DateTime.now(),
          ErrorPackageModel('Thành công'),
        ));
       }else{
         emit(UpdateLotQuantityFailState(
          DateTime.now(),
          ErrorPackageModel('Thất bại'),
        ));
       }
       
      } catch (e) {
         emit(UpdateLotQuantityFailState(
          DateTime.now(),
          ErrorPackageModel('Thất bại'),
        ));
      }
    });
  }
}
