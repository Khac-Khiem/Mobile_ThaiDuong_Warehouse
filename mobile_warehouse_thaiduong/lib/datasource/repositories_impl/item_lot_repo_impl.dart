import 'package:mobile_warehouse_thaiduong/datasource/service/item_lot_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_lot_repository.dart';

class ItemLotRepoImpl implements ItemLotRepository {
  final ItemLotService itemLotService;
  ItemLotRepoImpl(this.itemLotService);
  @override
  Future<List<ItemLot>> getExpiredItemLots() {
    // TODO: implement getExpiredItemLots
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getIsolatedItemLots() {
    // TODO: implement getIsolatedItemLots
    throw UnimplementedError();
  }

  @override
  Future<ItemLot> getItemLotById(String lotId) {
    // TODO: implement getItemLotById
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getItemLotsByItemId(String itemId) {
    // TODO: implement getItemLotsByItemId
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getItemLotsByLocation(String locationId) {
    // TODO: implement getItemLotsByLocation
    throw UnimplementedError();
  }

  @override
  Future<List<ItemLot>> getUnderStockminItemLots() {
    // TODO: implement getUnderStockminItemLots
    throw UnimplementedError();
  }
}
