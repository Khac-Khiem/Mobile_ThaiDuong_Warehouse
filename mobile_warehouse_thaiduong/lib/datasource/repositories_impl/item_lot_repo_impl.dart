import 'package:mobile_warehouse_thaiduong/datasource/service/item_lot_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_lot_repository.dart';
//import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/isolation_events.dart';

import '../../domain/entities/error_package.dart';

class ItemLotRepoImpl implements ItemLotRepository {
  final ItemLotService itemLotService;
  ItemLotRepoImpl(this.itemLotService);
  @override
  Future<List<ItemLot>> getExpiredItemLots() {
   final itemLot = itemLotService.getExpiredItemLots();
    return itemLot;
  }

  @override
  Future<List<ItemLot>> getIsolatedItemLots() {
    final itemLot = itemLotService.getIsolatedItemLots();
    return itemLot;
  }

  @override
  Future<ItemLot> getItemLotById(String lotId) {
     final itemLot = itemLotService.getItemLotById(lotId);
    return itemLot;
  }

  @override
  Future<List<ItemLot>> getItemLotsByItemId(String itemId) {
   final itemLot = itemLotService.getItemLotsByItemId(itemId);
    return itemLot;
  }

  @override
  Future<List<ItemLot>> getItemLotsByLocation(String locationId) {
 final itemLot = itemLotService.getItemLotsByLocation(locationId);
    return itemLot;
  }

  @override
  Future<List<ItemLot>> getUnderStockminItemLots() {
      final itemLot = itemLotService.getUnderStockminItemLots();
    return itemLot;
  }

  //==
  
  Future<ErrorPackage> addNewIsolationLot(double isolationQuantity, String notes ){
    final status = itemLotService.addNewIsolationLot(
       isolationQuantity, notes);
    return status;
  }
}
