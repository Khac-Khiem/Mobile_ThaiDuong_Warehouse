import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_model.dart';

class ItemService {
  Future<List<ItemModel>> getAllItems() async {
    final res = await http.get(Uri.parse('${Constants.baseUrl}api/Items'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body.toString());
      List<ItemModel> items = body
          .map(
            (dynamic item) => ItemModel.fromJson(item),
          )
          .toList();
      print(items.toString());
      return items;
    } else {
      throw "Unable to retrieve posts.";
    }
    // return [
    //   ItemModel('CDP001', '43111-Card HOLEE', UnitModel('cái'), ItemClassModel('TP'), 100, 10),
    //   ItemModel('CDP002', '43031-Card ISQUEAK', UnitModel('kg'), ItemClassModel('BTP'), 100, 10),
    //   ItemModel('CDP00210', '33117G-Card Tumbler G', UnitModel('cái'), ItemClassModel('BB'), 100, 10),
    //   ItemModel('CDP00221', '32085G- Card Sport 26 L Launcher GLOBAL', UnitModel('cặp'), ItemClassModel('VT'), 100, 10),
    //   ItemModel('CDP003ALP2MD00', '190401-Card Fetch ball XL', UnitModel('bộ'), ItemClassModel('NVL'), 100, 10),
    //   ItemModel('CDP003ALP2MD01', '0520520G-Card Fetch Mdley Asst 3pk-MD', UnitModel('cái'), ItemClassModel('TP'), 100, 10),
    //   ItemModel('CDP0072G0', '46305- Card JW Megalast bone toy LG', UnitModel('met'), ItemClassModel('BB'), 100, 10),
    //   ItemModel('XON001', '32439G-Card Zipflight MD', UnitModel('cuộn'), ItemClassModel('BTP'), 100, 10)
    // ];
  }
}
