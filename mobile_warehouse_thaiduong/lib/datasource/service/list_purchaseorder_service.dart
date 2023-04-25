import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/constant.dart';

class PODataService {
  Future<List<String>> getAllPO() async {
    final res = await http.get(Uri.parse('${Constants.baseUrl}api/GoodsReceipts/PurchaseOrderNumbers'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body.toString());
      List<String> listPO = body
          .map(
            (dynamic item) => item.toString(),
          )
          .toList();
      print(listPO.toString());
      return listPO;
    } else {
      throw "Unable to retrieve posts.";
    }
  
  }
}
