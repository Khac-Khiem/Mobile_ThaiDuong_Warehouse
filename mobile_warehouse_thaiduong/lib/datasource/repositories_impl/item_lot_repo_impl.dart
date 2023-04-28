import 'package:mobile_warehouse_thaiduong/datasource/service/item_lot_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_lot_repository.dart';

class ItemLotRepoImpl implements ItemLotRepository {
  final ItemLotService itemLotService;
  ItemLotRepoImpl(this.itemLotService);
  @override
  Future<List<ItemLot>> getExpiredItemLots(int month) {
    final itemLots = itemLotService.getExpiredItemLots(month);
    return itemLots;
  }

  @override
  Future<List<ItemLot>> getIsolatedItemLots() {
    final itemLots = itemLotService.getIsolatedItemLots();
    return itemLots;
  }

  @override
  Future<ItemLot> getItemLotById(String lotId) {
    final itemLots = itemLotService.getItemLotById(lotId);
    return itemLots;
  }

  @override
  Future<List<ItemLot>> getItemLotsByItemId(String itemId) {
    final itemLots = itemLotService.getItemLotsByItemId(itemId);
    return itemLots;
  }

  @override
  Future<List<ItemLot>> getItemLotsByLocation(String locationId) {
    final itemLots = itemLotService.getItemLotsByLocation(locationId);
    return itemLots;
  }

  @override
  Future<List<ItemLot>> getUnderStockminItemLots(String itemClassId) {
    final itemLots = itemLotService.getUnderStockminItemLots(itemClassId);
    return itemLots;
  }

  @override
  Future<ErrorPackage> patchIsolationItemLot(bool isolated, String itemLotId) {
    // TODO: implement patchIsolationItemLot
    final status = itemLotService.patIsolationItemLot(isolated, itemLotId);
    return status;
  }
}
