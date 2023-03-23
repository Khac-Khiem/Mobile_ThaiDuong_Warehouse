import 'package:mobile_warehouse_thaiduong/datasource/service/item_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_repository.dart';

class ItemRepoImpl implements ItemRepository {
  ItemService itemService;
  ItemRepoImpl(this.itemService);
  @override
  Future<List<Item>> getAllItem() {
    // TODO: implement getAllItems
    final items = itemService.getAllItem();
    return items;
  }
  //==
    Future<List<Item>> getItemByWarehouseId(itemClassId) {
    // TODO: implement getAllItems
    final items = itemService.getItemByWarehouseId(itemClassId);
    return items;
  }
}
