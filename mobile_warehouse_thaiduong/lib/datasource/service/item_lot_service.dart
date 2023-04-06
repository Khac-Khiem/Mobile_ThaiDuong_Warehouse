import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_lot_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

class ItemLotService {
  Future<ItemLotModel> getItemLotById(String lotId) async {
    final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/containers/$lotId'),
    );
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      //   print(body.toString());
      ItemLotModel lot = ItemLotModel.fromJson(body);
      return lot;
    } else {
      print('rổ không xác định');

      return throw "Unable to retrieve posts.";
    }
  }

  Future<List<ItemLotModel>> getItemLotsByItemId(String itemId) async {
    return [ItemLotModel('123', Item(itemId, 'kk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ),
    ItemLotModel('456', Item('2', 'kk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", null, null,null )];
  }

  Future<List<ItemLotModel>> getItemLotsByLocation(String locationId) async {
    return [ItemLotModel('123', Item('1', '2', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ),
    ItemLotModel('456', Item('2', 'kkkkkk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", null, null,null )];
  }

  Future<List<ItemLotModel>> getIsolatedItemLots() async {
    return [ItemLotModel('123', Item('1', '2', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ),
    ItemLotModel('456', Item('2', 'kkkkkk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", null, null,null )];
  }

  Future<List<ItemLotModel>> getExpiredItemLots(DateTime dateTime) async {
    return [ItemLotModel('123', Item('1', '2', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ),
    ItemLotModel('456', Item('1', 'kkkkkk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", null, null,null )];
  }
  Future<List<ItemLotModel>> getUnderStockminItemLots(String itemClassId) async {
    return [ItemLotModel('123', Item('1', '2', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ),
    ItemLotModel('456', Item('1', 'kkkkkk', Unit('cái'), ItemClass('TP'), 100, 10), false, 100, 10, "121212", null, null,null )];
  }
}