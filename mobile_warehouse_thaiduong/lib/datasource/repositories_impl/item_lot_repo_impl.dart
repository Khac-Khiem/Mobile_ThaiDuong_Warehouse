import 'package:mobile_warehouse_thaiduong/datasource/service/item_lot_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_lot_repository.dart';

class ItemLotRepoImpl implements ItemLotRepository {
  final ItemLotService itemLotService;
  ItemLotRepoImpl(this.itemLotService);
  @override
  Future<List<ItemLot>> getExpiredItemLots(DateTime dateTime) {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getIsolatedItemLots() {
    throw UnimplementedError();
  }

  @override
  Future<ItemLot> getItemLotById(String lotId) {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getItemLotsByItemId(String itemId) {
    final itemLots = itemLotService.getItemLotsByItemId(itemId);
    return itemLots;
  }

  @override
  Future<List<ItemLot>> getItemLotsByLocation(String locationId) {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getUnderStockminItemLots() {
    throw UnimplementedError();
  }
}