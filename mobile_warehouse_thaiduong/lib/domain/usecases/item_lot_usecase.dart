import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_lot_repository.dart';

class ItemLotUsecase {
  final ItemLotRepository itemLotRepository;
  ItemLotUsecase(this.itemLotRepository);
  Future<ItemLot> getItemLotById(String lotId) async {
    final itemLot = itemLotRepository.getItemLotById(lotId);
    return itemLot;
  }

  Future<List<ItemLot>> getItemLotsByItemId(String itemId) async{
    final itemLots = itemLotRepository.getItemLotsByItemId(itemId);
    return itemLots;
  }

  Future<List<ItemLot>> getItemLotsByLocation(String locationId)async {
    final itemLots = itemLotRepository.getItemLotsByLocation(locationId);
    return itemLots;
  }
  Future<List<ItemLot>> getIsolatedItemLots() async{
    final itemLots = itemLotRepository.getIsolatedItemLots();
    return itemLots;
  }
  Future<List<ItemLot>> getExpiredItemLots(int month)async {
     final itemLots = itemLotRepository.getExpiredItemLots(month);
    return itemLots;
  }

  Future<List<ItemLot>> getUnderStockminItemLots(String itemClassId)async {
     final itemLots = itemLotRepository.getUnderStockminItemLots(itemClassId);
    return itemLots;
  }
  Future<ErrorPackage> patchIsolationItemLot(bool isolated, String itemLotId )async {
     final status = itemLotRepository.patchIsolationItemLot(isolated, itemLotId);
    return status;
  }
}
